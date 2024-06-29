<?php
include_once "koneksi.php";
$password = password_hash('123', PASSWORD_BCRYPT);
$query = "INSERT INTO tabel_pengguna(
    username,
    password,
    nama_lengkap,
    email,
    jabatan,
    hak_akses
    )
    VALUES(
    'admin',
    '$password',
    'Administrator web',
    'admin@gmail.com',
    'Administator',
    'Admin'
    )
    ";
    if($koneksi->query($query)){
        echo "Data User Berhasil Ditambah";
    }else{
        echo "Data User Gagal Ditambah";
    }
    mysqli_close($koneksi);
    ?>