<?php
class CryptoHelper {
    private static $key = '78e695eaaa6c4ef7026ab2c230e8a77a'; // Must be 32 characters
    private static $method = 'AES-256-CBC';

    public static function encrypt($data) {
        if ($data === null) return null;
        $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length(self::$method));
        $encrypted = openssl_encrypt($data, self::$method, self::$key, 0, $iv);
        return base64_encode($iv . $encrypted);
    }

    public static function decrypt($data) {
        $raw = base64_decode($data);
        $ivLength = openssl_cipher_iv_length(self::$method);
        $iv = substr($raw, 0, $ivLength);
        $encrypted = substr($raw, $ivLength);
        return openssl_decrypt($encrypted, self::$method, self::$key, 0, $iv);
    }
}
