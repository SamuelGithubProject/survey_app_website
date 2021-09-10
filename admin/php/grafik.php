<?php
require_once 'koneksi.php';

$task = $_POST['task'];

if (isset($task)) {
    if ($task == "selectDataPenduduk") {
        $rowData = [];
        $sqlCount = "SELECT COUNT(*) as 'jumlahdata' FROM `table_biodata` as a
                            JOIN `table_dataindividu` as b
                            JOIN `table_status` as c
                            ON a.nomor_ktp = b.nomor_ktp AND a.nomor_ktp = c.nomor_ktp";
        $resultCount = $conn->query($sqlCount);

        if ($resultCount->num_rows > 0) {
            while ($rowCount = $resultCount->fetch_assoc()) {
                $rowData[] = $rowCount;
            }
            echo json_encode($rowData);
        }
    } elseif ($task == "selectJumlahMenjawab") {
        $sqlCountAnswered = "SELECT COUNT(*) as 'jumlahMenjawab' FROM `table_kuisioner`";
        $resultCountAnswered = $conn->query($sqlCountAnswered);

        if ($resultCountAnswered->num_rows > 0) {
            while ($rowCountAnswered = $resultCountAnswered->fetch_assoc()) {
                echo $rowCountAnswered['jumlahMenjawab'];
            }
        } else {
            echo "0";
        }
    }
}
