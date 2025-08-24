<?php 
include 'header.php';


// Proses HAPUS jika ada parameter ?hapus=invoice
if (isset($_GET['hapus'])) {
    $invoice = $_GET['hapus'];
    $delete = mysqli_query($conn, "DELETE FROM pesanan WHERE invoice = '$invoice'");
    if ($delete) {
        echo "<script>alert('Pesanan berhasil dihapus'); window.location.href='pesanan.php';</script>";
    } else {
        echo "<script>alert('Gagal menghapus pesanan'); window.location.href='pesanan.php';</script>";
    }
}

// Mengubah format tanggal menjadi tahun-bulan-hari (yyyy-mm-dd)
$date = date('Y-m-d');

if(isset($_POST['submit'])){
    $date1 = $_POST['date1'];
    $date2 = $_POST['date2'];
}
$sortage = mysqli_query($conn, "SELECT * FROM pesanan where cek = '1'");
$cek_sor = mysqli_num_rows($sortage);
?>

<div class="container">
    <h2 style=" width: 100%; border-bottom: 4px solid gray"><b>Daftar Pesanan</b></h2>
    <br>
    <h5 class="bg-success" style="padding: 7px; width: 710px; font-weight: bold;"><marquee>Lakukan Reload Setiap Masuk Halaman ini, untuk menghindari terjadinya kesalahan data dan informasi</marquee></h5>
    <a href="pesanan.php" class="btn btn-default"><i class="glyphicon glyphicon-refresh"></i> Reload</a>
    <br>

    <!-- Form untuk memilih rentang tanggal -->
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <table>
            <tr>
                <!-- Menampilkan tanggal default dalam format YYYY-MM-DD -->
                <td><input type="date" name="date1" class="form-control" value="<?= $date; ?>"></td>
                <td>&nbsp; - &nbsp;</td>
                <td><input type="date" name="date2" class="form-control" value="<?= $date; ?>"></td>
                <td> &nbsp;</td>
                <td><input type="submit" name="submit" class="btn btn-primary" value="Tampilkan"></td>
            </tr>
        </table>
    </form>

    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Invoice</th>
                <th scope="col">Kode Customer</th>
                <th scope="col">Status</th>
                <th scope="col">Tanggal</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>

            <?php 
            if(isset($_POST['submit'])){
                $result = mysqli_query($conn, "SELECT DISTINCT invoice, kode_customer, status, kode_produk, qty, terima, tolak, cek, tanggal FROM pesanan WHERE tanggal BETWEEN '$date1' AND '$date2' GROUP BY invoice");
            } else {
                $result = mysqli_query($conn, "SELECT DISTINCT invoice, kode_customer, status, kode_produk, qty, terima, tolak, cek, tanggal FROM pesanan GROUP BY invoice");
            }

            $no = 1;
            while($row = mysqli_fetch_assoc($result)){
                $kodep = $row['kode_produk'];
                $inv = $row['invoice'];
                ?>

                <tr>
                    <td><?= $no; ?></td>
                    <td><?= $row['invoice']; ?></td>
                    <td><?= $row['kode_customer']; ?></td>
                    <?php if($row['terima'] == 1){ ?>
                        <td style="color: green;font-weight: bold;">Pesanan Diterima (Siap Kirim)</td>
                    <?php } else if($row['tolak'] == 1){ ?>
                        <td style="color: red;font-weight: bold;">Pesanan Ditolak</td>
                    <?php } else if($row['terima'] == 0 && $row['tolak'] == 0){ ?>
                        <td style="color: orange;font-weight: bold;"><?= $row['status']; ?></td>
                    <?php } ?>

                    <td><?= $row['tanggal']; ?></td>
                    <td>
                        <?php if($row['tolak'] == 0 && $row['cek'] == 1 && $row['terima'] == 0){ ?>
                            <a href="inventory.php?cek=0" id="rq" class="btn btn-warning"><i class="glyphicon glyphicon-warning-sign"></i> Request Stok Shortage</a> 
                            <a href="proses/tolak.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menolak ?')"><i class="glyphicon glyphicon-remove-sign"></i> Tolak</a> 
                        <?php } else if($row['terima'] == 0 && $row['cek'] == 0){ ?>
                            <a href="proses/terima.php?inv=<?= $row['invoice']; ?>&kdp=<?= $row['kode_produk']; ?>" class="btn btn-success"><i class="glyphicon glyphicon-ok-sign"></i> Terima</a> 
                            <a href="proses/tolak.php?inv=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Ingin Menolak ?')"><i class="glyphicon glyphicon-remove-sign"></i> Tolak</a> 
                        <?php } ?>
                        <a href="detailorder.php?inv=<?= $row['invoice']; ?>&cs=<?= $row['kode_customer']; ?>" type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-eye-open"></i> Detail Pesanan</a>

                        <!-- ✅ Tombol Hapus -->
                        <a href="pesanan.php?hapus=<?= $row['invoice']; ?>" class="btn btn-danger" onclick="return confirm('Yakin ingin menghapus pesanan ini?')">
                            <i class="glyphicon glyphicon-trash"></i> Hapus
                        </a>
                    </td>
                </tr>
                <?php
                $no++; 
            }
            ?>

        </tbody>
    </table>

<?php include 'footer.php'; ?>
