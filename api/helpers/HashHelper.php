<?php
class HashHelper {
    // Hash a password with a salt (generate new salt if not provided)
    public static function hashPassword($password, $salt = '') {
        if (empty($salt)) {
            $salt = bin2hex(random_bytes(16)); // 32-char salt
        }
        $hashed = hash('sha256', $salt . $password);
        return ['hash' => $hashed, 'salt' => $salt];
    }

    // Verify input password against stored hash and salt
    public static function verifyPassword($password, $storedHash, $storedSalt) {
        $verifyHash = hash('sha256', $storedSalt . $password);
        return hash_equals($storedHash, $verifyHash);
    }
}
?>
