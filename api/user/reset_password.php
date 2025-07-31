<?php
ob_clean();
header('Content-Type: application/json');
error_reporting(0);
ini_set('display_errors', 0);

include '../connection.php';
include_once '../helpers/HashHelper.php'; // include SHA-256 helper

if (!$connectNow) {
    echo json_encode(['success' => false, 'message' => 'DB connection failed']);
    exit();
}

$username = trim($_POST['username'] ?? '');
$password = trim($_POST['password'] ?? '');

// Validate inputs
if (empty($username) || empty($password)) {
    echo json_encode(['success' => false, 'message' => 'Missing username or password']);
    exit();
}

// Hash the new password with SHA-256 and generate salt
$passwordData = HashHelper::hashPassword($password);
$hashedPassword = $passwordData['hash'];
$salt = $passwordData['salt'];

// Check if user exists
$checkStmt = $connectNow->prepare("SELECT UserID FROM users WHERE Username = ?");
$checkStmt->bind_param("s", $username);
$checkStmt->execute();
$checkResult = $checkStmt->get_result();

if ($checkResult->num_rows === 0) {
    echo json_encode(['success' => false, 'message' => 'User not found']);
    exit();
}

// Update password and salt
$stmt = $connectNow->prepare("UPDATE users SET Password = ?, Salt = ?, UpdatedAt = CURRENT_TIMESTAMP WHERE Username = ?");
$stmt->bind_param("sss", $hashedPassword, $salt, $username);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        echo json_encode(['success' => true, 'message' => 'Password updated successfully']);
    } else {
        echo json_encode(['success' => false, 'message' => 'No changes made to password']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to update password: ' . $stmt->error]);
}

$stmt->close();
$connectNow->close();
exit();
