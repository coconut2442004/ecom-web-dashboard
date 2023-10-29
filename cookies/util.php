<?php
function encrypt_cookie($data, $key)
{
    $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('aes-256-cbc'));
    $encrypted_data = openssl_encrypt($data, 'aes-256-cbc', $key, 0, $iv);
    return base64_encode($iv . $encrypted_data);
}

// Hàm giải mã dữ liệu
function decrypt_cookie($data, $key)
{
    $data = base64_decode($data);
    $iv_size = openssl_cipher_iv_length('aes-256-cbc');
    $iv = substr($data, 0, $iv_size);
    $encrypted_data = substr($data, $iv_size);
    return openssl_decrypt($encrypted_data, 'aes-256-cbc', $key, 0, $iv);
}
