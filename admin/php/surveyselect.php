<?php
require_once 'koneksi.php';

$task = $_POST['task'];
$dataArray = [];

if ($task == "selectDataKuisioner") {
    $sqlResultKuis = "SELECT a.id_result,a.tanggal_waktu_pengisian,a.nomor_kk,a.nomor_ktp,b.nama_lengkap,a.result FROM `table_kuisioner` as a
                    JOIN table_biodata as b
                    ON a.nomor_kk = b.nomor_kartukeluarga AND a.nomor_ktp = b.nomor_ktp;";
    $resultResultKuis = $conn->query($sqlResultKuis);

    if ($resultResultKuis->num_rows > 0) {
        // output data of each row
        while ($rowResultKuis = $resultResultKuis->fetch_assoc()) {
            $dataArray[] = $rowResultKuis;
        }
        echo json_encode($dataArray);
    }
}
