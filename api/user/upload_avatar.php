<?php
header("Content-Type: application/json");
ini_set('display_errors', 1);
error_reporting(E_ALL);

include '../connection.php';

// Function to safely get request parameters
function getRequestParam($key, $default = '') {
    return isset($_REQUEST[$key]) ? trim($_REQUEST[$key]) : $default;
}

// Main request handler
$action = getRequestParam('action');

switch ($action) {
    case 'upload':
        handleAvatarUpload();
        break;
    case 'get':
        handleGetAvatar();
        break;
    case 'serve':
        handleServeAvatar();
        break;
    default:
        sendResponse(400, 'error', 'Invalid action');
        break;
}

// Handle avatar upload
function handleAvatarUpload() {
    // Validate user ID
    $userId = (int)getRequestParam('user_id');
    if ($userId <= 0) {
        sendResponse(400, 'error', 'Invalid user ID');
    }

    // Check file upload
    if (!isset($_FILES['avatar']) || $_FILES['avatar']['error'] !== UPLOAD_ERR_OK) {
        sendResponse(400, 'error', 'No file uploaded or upload error');
    }

    $avatar = $_FILES['avatar'];

    // Set up upload directory
    $uploadDir = realpath(__DIR__ . '/../uploads/avatars') . '/';
    if (!is_dir($uploadDir)) {
        if (!mkdir($uploadDir, 0755, true)) {
            sendResponse(500, 'error', 'Failed to create upload directory');
        }
    }

    // Validate file type
    $fileExt = strtolower(pathinfo($avatar['name'], PATHINFO_EXTENSION));
    $allowedTypes = ['jpg', 'jpeg', 'png', 'gif'];
    if (!in_array($fileExt, $allowedTypes)) {
        sendResponse(400, 'error', 'Invalid file type. Only JPG, PNG, GIF allowed');
    }

    // Generate unique filename
    $newFilename = 'avatar_' . $userId . '_' . time() . '.' . $fileExt;
    $uploadPath = $uploadDir . $newFilename;
    $relativePath = 'uploads/avatars/' . $newFilename;

    // Move uploaded file
    if (!move_uploaded_file($avatar['tmp_name'], $uploadPath)) {
        sendResponse(500, 'error', 'Failed to save uploaded file');
    }

    // Update database
    $stmt = $GLOBALS['connectNow']->prepare("UPDATE users SET avatar = ? WHERE UserID = ?");
    $stmt->bind_param("si", $relativePath, $userId);

    if ($stmt->execute()) {
        sendResponse(200, 'success', 'Avatar uploaded successfully', [
            'avatar_path' => $relativePath,
            'avatar_url' => generateServeUrl($newFilename)
        ]);
    } else {
        unlink($uploadPath);
        sendResponse(500, 'error', 'Database update failed');
    }
    $stmt->close();
}

// Handle avatar retrieval
function handleGetAvatar() {
    $userId = (int)getRequestParam('user_id');
    if ($userId <= 0) {
        sendResponse(400, 'error', 'Invalid user ID');
    }

    $stmt = $GLOBALS['connectNow']->prepare("SELECT avatar FROM users WHERE UserID = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        if (!empty($row['avatar'])) {
            $filename = basename($row['avatar']);
            sendResponse(200, 'success', 'Avatar found', [
                'avatar_url' => generateServeUrl($filename)
            ]);
        } else {
            sendResponse(404, 'error', 'No avatar found for user');
        }
    } else {
        sendResponse(404, 'error', 'User not found');
    }
    $stmt->close();
}

// Handle image serving
function handleServeAvatar() {
    $filename = getRequestParam('filename');
    if (empty($filename)) {
        sendResponse(400, 'error', 'Filename is required', null, false);
    }

    // Strict filename validation
    if (!preg_match('/^avatar_\d+_\d+\.(jpg|jpeg|png|gif)$/i', $filename)) {
        sendResponse(400, 'error', 'Invalid filename pattern', null, false);
    }

    $filePath = realpath(__DIR__ . '/../uploads/avatars') . '/' . $filename;

    // Check file exists and is readable
    if (!file_exists($filePath) || !is_readable($filePath)) {
        sendResponse(404, 'error', 'File not found', null, false);
    }

    // Get MIME type
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    $mimeType = finfo_file($finfo, $filePath);
    finfo_close($finfo);

    // Set headers and output file
    header('Content-Type: ' . $mimeType);
    header('Content-Length: ' . filesize($filePath));
    header('Cache-Control: max-age=86400'); // Cache for 24 hours
    readfile($filePath);
    exit;
}

// Helper function to generate secure serve URL
function generateServeUrl($filename) {
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https://' : 'http://';
    $host = $_SERVER['HTTP_HOST'];
    $scriptPath = dirname($_SERVER['SCRIPT_NAME']);
    return $protocol . $host . $scriptPath . '/upload_avatar.php?action=serve&filename=' . urlencode($filename);
}

// Unified response handler
function sendResponse($statusCode, $status, $message, $data = null, $json = true) {
    http_response_code($statusCode);
    $response = [
        'status' => $status,
        'message' => $message
    ];
    if ($data !== null) {
        $response['data'] = $data;
    }
    
    if ($json) {
        header('Content-Type: application/json');
        echo json_encode($response);
    } else {
        header('Content-Type: text/plain');
        echo $response['message'];
    }
    exit;
}