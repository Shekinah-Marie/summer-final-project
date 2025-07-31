<?php
header('Content-Type: application/json');
require_once '../connection.php';
require_once '../helpers/HashHelper.php'; // Adjust path if needed

$response = ['success' => false, 'message' => ''];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if (empty($username) || empty($password)) {
        $response['message'] = 'Username and password are required.';
        echo json_encode($response);
        exit;
    }

    // Join roles table to get RoleName
    $stmt = $connectNow->prepare("
        SELECT users.*, roles.RoleName 
        FROM users 
        LEFT JOIN roles ON users.RoleID = roles.RoleID 
        WHERE users.Username = ?
    ");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();

    if (!$user) {
        $response['message'] = 'User not found';
        echo json_encode($response);
        exit;
    }

    $userId = $user['UserID'];
    $failedAttempts = (int)$user['FailedAttempts'];
    $lastFailed = $user['LastFailedLogin'];
    $lockDuration = 30;

    // Check if locked
    if ($failedAttempts >= 3 && strtotime($lastFailed) + $lockDuration > time()) {
        $remaining = (strtotime($lastFailed) + $lockDuration) - time();
        $response['message'] = "Account locked. Try again in {$remaining}s.";
        echo json_encode($response);
        exit;
    }

    // Verify password
    $storedHash = $user['Password'];
    $storedSalt = $user['Salt'];

    if (HashHelper::verifyPassword($password, $storedHash, $storedSalt)) {
        // Reset attempts
        $resetStmt = $connectNow->prepare("UPDATE users SET FailedAttempts = 0, LastFailedLogin = NULL WHERE UserID = ?");
        $resetStmt->bind_param("i", $userId);
        $resetStmt->execute();

        // Remove sensitive fields before sending to frontend
        unset($user['Password'], $user['Salt'], $user['FailedAttempts'], $user['LastFailedLogin']);

        $response['success'] = true;
        $response['message'] = 'Login successful';
        $response['userData'] = $user;
    } else {
        // Increment attempts
        $failedAttempts++;
        $updateStmt = $connectNow->prepare("UPDATE users SET FailedAttempts = ?, LastFailedLogin = NOW() WHERE UserID = ?");
        $updateStmt->bind_param("ii", $failedAttempts, $userId);
        $updateStmt->execute();

        $response['message'] = ($failedAttempts >= 3)
            ? "Account locked. Try again in {$lockDuration}s."
            : 'Incorrect password';
    }
} else {
    $response['message'] = 'Invalid request method';
}

echo json_encode($response);
?>
