<?php
  include('config.php'); //agar index terhubung dengan database, maka koneksi sebagai penghubung harus di include
  
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Tambah Produk</title>
    <style type="text/css">
      * {
        font-family: "Times New Roman";
      }
      h1 {
        text-transform: uppercase;
        color: black;
      }
    button {
          background-color: blue;
          color: #ADFF2F;
          padding: 10px;
          text-decoration: none;
          font-size: 12px;
          border: 0px;
          margin-top: 20px;
    }
    label {
      margin-top: 10px;
      float: left;
      text-align: left;
      width: 100%;
    }
    input {
      padding: 6px;
      width: 100%;
      box-sizing: border-box;
      background: #ADFF2F;
      border: 2px solid #ccc;
      outline-color: green;
    }
    div {
      width: 100%;
      height: auto;
    }
    .base {
      width: 400px;
      height: auto;
      padding: 20px;
      margin-left: auto;
      margin-right: auto;
      background: #ededed;
    }
    </style>
  </head>
  <body>
      <center>
        <h1>Tambah Produk</h1>
      <center>
      <form method="POST" action="proses_tambah.php" enctype="multipart/form-data" >
      <section class="base">
      <div class="modal-body">
        <div class="form-group">
            <label class="samll">Kode Produk :</label>
            <input type="text" name="kode_produk" placeholder="kode produk" class="form-control" required>
        </div>
        <div class="form-group">
            <label class="samll">Nama Produk :</label>
            <input type="text" name="nama_produk" placeholder="nama produk" class="form-control" required>
        </div>
        
        <div class="form-group">
          <label>Gambar Produk:</label>
         <input type="file" name="gambar_produk" required="" class="form-control"  required>

         <p style="color: red">Ekstensi yang diperbolehkan .jpg | .png | tidak boleh lebih 100kb</p>
      </div>	
       
        
        <div class="form-group">
            <label class="samll">Harga Modal :</label>
            <input type="number" placeholder="0" name="harga_modal" class="form-control" required>
        </div>
        <div class="form-group">
            <label class="samll">Harga Jual :</label>
            <input type="number" placeholder="0" name="harga_jual" class="form-control" required>
        </div>
      </div>
      


      <div class="modal-footer">

      <a href="produk.php"> <button type="button" class="btn btn-primary">Kembali</button>
        <button type="submit" name="TambahProduk" class="btn btn-primary">Simpan</button>
        </div>
        </section>
      </form>
  </body>
</html>