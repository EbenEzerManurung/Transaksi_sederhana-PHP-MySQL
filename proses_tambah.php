<?php
// memanggil file koneksi.php untuk melakukan koneksi database
include 'config.php';

	// membuat variabel untuk menampung data dari form
  $kodeproduk = htmlspecialchars($_POST['kode_produk']);
    $namaproduk = htmlspecialchars($_POST['nama_produk']);
    $harga_modal = htmlspecialchars($_POST['harga_modal']);
    $harga_jual = htmlspecialchars($_POST['harga_jual']);
  $gambar_produk = $_FILES['gambar_produk']['name'];


//cek dulu jika ada gambar produk jalankan coding ini
if($gambar_produk != "") {
  $ekstensi_diperbolehkan = array('png','jpg'); //ekstensi file gambar yang bisa diupload 
  $x = explode('.', $gambar_produk); //memisahkan nama file dengan ekstensi yang diupload
  $ekstensi = strtolower(end($x));
  $file_tmp = $_FILES['gambar_produk']['tmp_name'];   
  $ekstensi = strtolower(end($x));
  $ukuran	= $_FILES['file']['size'];
  $bataasan = $ukuran < 100000;

  $nama_gambar_baru = $angka_acak.'-'.$gambar_produk; //menggabungkan angka acak dengan nama file sebenarnya
        if(in_array($ekstensi, $ekstensi_diperbolehkan, $bataasan) === true)  {     
                move_uploaded_file($file_tmp, 'gambar/'.$nama_gambar_baru,); //memindah file gambar ke folder gambar
                  // jalankan query INSERT untuk menambah data ke database pastikan sesuai urutan (id tidak perlu karena dibikin otomatis)
                  $cekkode = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM produk WHERE kode_produk='$kodeproduk'"));
                      if($cekkode > 0) {
                          echo '<script>alert("Maaf! kode produk sudah ada");history.go(-1);</script>';
                      } 
                      else {
                      $InputProduk = mysqli_query($conn,"INSERT INTO produk (kode_produk,nama_produk,harga_modal,harga_jual, gambar_produk)
                       values ('$kodeproduk','$namaproduk','$harga_modal','$harga_jual','$nama_gambar_baru' )");
                      
                      if ($ukuran > 100000){
                                        echo '<script>alert("File Terlalu Besar");history.go(-1);</script>';
                    }
                                          else {
                        $InputProduk = mysqli_query($conn,"INSERT INTO produk (kode_produk,nama_produk,harga_modal,harga_jual, gambar_produk)
                       values ('$kodeproduk','$namaproduk','$harga_modal','$harga_jual','$nama_gambar_baru' )");

                      if ($InputProduk){
                    echo "<script>alert('Data berhasil ditambah');window.location='produk.php';</script>";
                      }
                      

                       else {
                          echo '<script>alert("Gagal Menambahkan Data");history.go(-1);</script>';
                      }
                      
                      
                  }
                 
                      }

                    }
                  };
                  
                  

 

