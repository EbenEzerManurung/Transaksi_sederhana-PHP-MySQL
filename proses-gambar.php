<?php
include "config.php";
session_start();
	if($_SESSION['log']!="login"){
		header("location:login.php");
	} else {
    $uid = $_SESSION['kodeproduk'];
    $ekstensi_diperbolehkan	= array('png','jpg');
    $gambar_produk = $_FILES['file']['gambar_produk'];
    $x = explode('.', $gambar_produk);
    $ekstensi = strtolower(end($x));
    $ukuran	= $_FILES['file']['size'];
    $file_tmp = $_FILES['file']['tmp_name'];	

    if(in_array($ekstensi, $ekstensi_diperbolehkan) === true){
        if($ukuran < 10000){			
            move_uploaded_file($file_tmp, 'assets/images/'.$gambar_produk);
            $query =  mysqli_querymysqli_query($conn,"INSERT INTO produk (kode_produk,nama_produk,harga_modal,harga_jual, gambar_produk)
            values ('$kodeproduk','$namaproduk','$harga_modal','$harga_jual', '$gambar')"or die(mysqli_connect_error());
            
            if($query){
                echo '<script>history.go(-1);</script>';
            }else{
                echo '<script>alert("GAGAL MENGUPLOAD GAMBAR");history.go(-1);</script>';
            }
        }else{
            echo '<script>alert("UKURAN FILE TERLALU BESAR");history.go(-1);</script>';
        }
    }else{
        echo '<script>alert("EKSTENSI FILE YANG DI UPLOAD TIDAK DI PERBOLEHKAN");history.go(-1);</script>';
    }
}
?>


