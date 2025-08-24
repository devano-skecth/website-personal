<?php 
include '../../koneksi/koneksi.php';

$inv = $_GET['inv'] ?? '';

if (!$inv) {
    echo "<script>alert('INVOICE TIDAK DITEMUKAN'); window.location = '../pesanan.php';</script>";
    exit;
}

// Ambil pesanan berdasarkan invoice
$result = mysqli_query($conn, "SELECT * FROM pesanan WHERE invoice = '$inv' AND terima = '0'");
if (mysqli_num_rows($result) == 0) {
    echo "<script>alert('Pesanan tidak ditemukan atau sudah diproses'); window.location = '../pesanan.php';</script>";
    exit;
}

// Loop pesanan
while ($row = mysqli_fetch_assoc($result)) {
    $kode_produk = $row['kode_produk'];
    $qty_pesan = intval($row['qty']);

    // Ambil semua bahan dari bom
    $bom = mysqli_query($conn, "SELECT * FROM bom_produk WHERE kode_produk = '$kode_produk'");
    while ($row_bom = mysqli_fetch_assoc($bom)) {
        $kode_bk = $row_bom['kode_bk'];
        $qty_kebutuhan = intval($row_bom['kebutuhan']);

        // Ambil stok dari inventory
        $q_inv = mysqli_query($conn, "SELECT * FROM inventory WHERE kode_bk = '$kode_bk'");
        $row_inv = mysqli_fetch_assoc($q_inv);

        if ($row_inv) {
            $stok = intval($row_inv['qty']);
            $total_pemakaian = $qty_pesan * $qty_kebutuhan;
            $sisa = $stok - $total_pemakaian;

            if ($sisa < 0) {
                echo "<script>
                    alert('STOK TIDAK CUKUP UNTUK $kode_bk. Sisa: $stok, Dibutuhkan: $total_pemakaian');
                    window.location = '../pesanan.php';
                </script>";
                exit;
            }

            // Update inventory
            $update = mysqli_query($conn, "UPDATE inventory SET qty = '$sisa' WHERE kode_bk = '$kode_bk'");
            if (!$update) {
                echo "<script>
                    alert('GAGAL UPDATE STOK UNTUK $kode_bk');
                    window.location = '../pesanan.php';
                </script>";
                exit;
            }

        } else {
            echo "<script>
                alert('DATA BAHAN $kode_bk TIDAK DITEMUKAN DI INVENTORY');
                window.location = '../pesanan.php';
            </script>";
            exit;
        }
    }
}

// Update status pesanan
mysqli_query($conn, "UPDATE pesanan SET terima = '1', status = '0' WHERE invoice = '$inv'");

echo "<script>
    alert('PESANAN BERHASIL DITERIMA, STOK BERHASIL DIKURANGI');
    window.location = '../pesanan.php';
</script>";
?>
