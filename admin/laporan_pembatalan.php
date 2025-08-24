<?php 
include 'header.php';
$date = date('Y-m-d'); // Memastikan format tanggal Y-m-d

// Menangani jika form disubmit
if(isset($_POST['submit'])){
    $date1 = $_POST['date1'];
    $date2 = $_POST['date2'];
} else {
    // Set default tanggal jika form belum disubmit
    $date1 = $date;
    $date2 = $date;
}
?>

<style type="text/css">
    @media print{
        .print{
            display: none;
        }
    }
</style>

<div class="container">
    <h2 style=" width: 100%; border-bottom: 4px solid gray; padding-bottom: 5px;"><b>Laporan Pembatalan Pesanan</b></h2>
    
    <!-- Form untuk memilih rentang tanggal -->
    <div class="row print">
        <div class="col-md-9">
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <table>
                    <tr>
                        <td><input type="date" name="date1" class="form-control" value="<?= $date1; ?>"></td>
                        <td>&nbsp; - &nbsp;</td>
                        <td><input type="date" name="date2" class="form-control" value="<?= $date2; ?>"></td>
                        <td> &nbsp;</td>
                        <td><input type="submit" name="submit" class="btn btn-primary" value="Tampilkan"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="col-md-3">
            <form action="exp_pembatalan.php" method="POST">
                <table>
                    <tr>
                        <td><input type="hidden" name="date1" class="form-control" value="<?= $date1; ?>"></td>
                        <td><input type="hidden" name="date2" class="form-control" value="<?= $date2; ?>"></td>
                        <td><button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-save-file"></i> Export to Excel</button></td>
                        <td> &nbsp;</td>
                        <td><a href="" onclick="window.print()" class="btn btn-default"><i class="glyphicon glyphicon-print"></i> Cetak</a></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <br><br>
    
    <!-- Tabel untuk menampilkan laporan pembatalan -->
    <table class="table table-striped">
        <tr>
            <th>No</th>
            <th>Nama Produk</th>
            <th>Tanggal</th>
            <th>Qty</th>
        </tr>
        
        <?php 
        // Query untuk mengambil data pembatalan berdasarkan tanggal
        if(isset($_POST['submit'])){
            $result = mysqli_query($conn, "SELECT * FROM pesanan WHERE tolak = 1 AND tanggal BETWEEN '$date1' AND '$date2'");
        } else {
            // Menampilkan data untuk hari ini jika form belum disubmit
            $result = mysqli_query($conn, "SELECT * FROM pesanan WHERE tolak = 1 AND tanggal = '$date'");
        }
        
        $no = 1;
        $total = 0;
        
        // Memeriksa apakah query mengembalikan data
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                ?>
                <tr>
                    <td><?= $no; ?></td>
                    <td><?= $row['nama_produk']; ?></td>
                    <td><?= $row['tanggal']; ?></td>
                    <td><?= $row['qty']; ?></td>
                </tr>
                <?php 
                $total += $row['qty'];
                $no++;
            }
        } else {
            echo "<tr><td colspan='4' class='text-center'>Tidak ada data untuk rentang tanggal ini.</td></tr>";
        }
        ?>
        
        <!-- Menampilkan total pembatalan -->
        <tr>
            <td colspan="4" class="text-right"><b>Jumlah Pembatalan = <?= $total; ?></b></td>
        </tr>
    </table>
</div>

<br><br><br><br><br>

<?php 
include 'footer.php';
?>
