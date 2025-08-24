<?php 
include '../koneksi/koneksi.php';
$kd_cs = $_POST['kode_cs'];
$nama = $_POST['nama'];
$provinsi = $_POST['provinsi'];
$kota = $_POST['kota'];
$alamat = $_POST['alamat'];
$kode_pos = $_POST['kode_pos'];
$nama_bank = $_POST['nama_bank'];

// Mengubah format tanggal menjadi Y-m-d (tahun-bulan-hari)
$tanggal = date('Y-m-d');  // Pastikan formatnya Y-m-d

// Mendapatkan nomor invoice terbaru dan menambahkannya
$kode = mysqli_query($conn, "SELECT invoice FROM pesanan ORDER BY invoice DESC");
$data = mysqli_fetch_assoc($kode);
$num = substr($data['invoice'], 3, 4);
$add = (int) $num + 1;

// Membuat format invoice yang sesuai
if (strlen($add) == 1) {
    $format = "INV000".$add;
} elseif (strlen($add) == 2) {
    $format = "INV00".$add;
} elseif (strlen($add) == 3) {
    $format = "INV0".$add;
} else {
    $format = "INV".$add;
}

// Menambahkan data pesanan berdasarkan data dari keranjang
$keranjang = mysqli_query($conn, "SELECT * FROM keranjang WHERE kode_customer = '$kd_cs'");

while ($row = mysqli_fetch_assoc($keranjang)) {
    $kd_produk = $row['kode_produk'];
    $nama_produk = $row['nama_produk'];
    $qty = $row['qty'];
    $harga = $row['harga'];
    $status = "Pesanan Baru";  // Status pesanan

    // Menyimpan pesanan ke dalam tabel pesanan
    $order = mysqli_query($conn, "INSERT INTO pesanan VALUES('', '$format', '$kd_cs', '$kd_produk', '$nama_produk', '$qty', '$harga', '$nama_bank', '$status', '$tanggal', '$provinsi', '$kota', '$alamat', '$kode_pos', '0', '0', '0')");
}

// Menghapus data yang ada di keranjang setelah pesanan diproses
$del_keranjang = mysqli_query($conn, "DELETE FROM keranjang WHERE kode_customer = '$kd_cs'");

if ($del_keranjang) {
    header("location:../selesai.php");  // Redirect setelah berhasil
}
?>
