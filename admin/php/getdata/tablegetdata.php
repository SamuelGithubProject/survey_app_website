<?php

require_once 'php/koneksi.php';

$sql = "SELECT a.nomor_kartukeluarga, c.nomor_ktp, b.nama_lengkap, c.status_hubungan, 
		(SELECT COUNT(*) 
          FROM table_biodata 
         WHERE nomor_kartukeluarga = a.nomor_kartukeluarga) as jumlah_tanggungan
FROM table_wilayah as a
INNER JOIN table_biodata as b ON a.nomor_kartukeluarga = b.nomor_kartukeluarga
INNER JOIN table_status as c ON b.nomor_ktp = c.nomor_ktp
GROUP BY a.nomor_kartukeluarga";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $nomor = 1;
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
        <td>$nomor </td>
        <td>" . $row['nomor_kartukeluarga'] . " </td>
        <td>" . $row['nomor_ktp'] . " </td>
        <td>" . $row['nama_lengkap'] . " </td>
        <td>" . $row['status_hubungan'] . " </td>
        <td>" . $row['jumlah_tanggungan'] . " </td>
        <td class = 'btn-group'>
        <form class='mr-3' action='?page=detail-data' method='POST'>
            <input hidden value='$row[nomor_kartukeluarga]' name='idKK'/>
            <button class = 'btn btn-primary' type='submit' id='btnDetailPenduduk$row[nomor_kartukeluarga]'>Detail</button>
            <a class = 'btn btn-danger' data-id='$row[nomor_kartukeluarga]' id='btnDeletePenduduk$row[nomor_kartukeluarga]' onclick='DeleteFunction(btnDeletePenduduk$row[nomor_kartukeluarga]);'>Delete</button>
        </form>
        </td>
        </tr>";

        $nomor++;
    }
}

// <button class = 'btn btn-warning' data-id='$row[nomor_kartukeluarga]' id='btnUpdatePenduduk$row[nomor_kartukeluarga]' onclick='UpdateFunction(btnUpdatePenduduk$row[nomor_kartukeluarga]);'>Update</button>