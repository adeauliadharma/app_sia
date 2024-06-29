<?php
require_once('koneksi.php');

$jenis_invoice = $_POST['jenis_invoice'];
$invoices = array();

switch ($jenis_invoice) {
    case 'pembayaran':
        $query = "SELECT invoice_pembayaran, pembayaran_id FROM tabel_pembayaran";
        break;
    case 'pembelian':
        $query = "SELECT invoice_pembelian, pembelian_id FROM tabel_pembelian";
        break;
    case 'penjualan':
        $query = "SELECT invoice_penjualan, penjualan_id FROM tabel_penjualan";
        break;
}

$result = mysqli_query($koneksi, $query);

while ($row = mysqli_fetch_assoc($result)) {
    $invoices[] = $row;
}

echo json_encode($invoices);
?>
