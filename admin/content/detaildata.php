<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Kelola Data</h1>
    </div>

    <!-- Content Row -->

    <div class="row">
        <!-- Area Chart -->
        <div class="col">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Kelola Data Keluarga</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped dt-responsive nowrap" style="width:100%" id="dataTableDetailData">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>No. NIK</th>
                                    <th>Nama Lengkap</th>
                                    <th>Jenis Kelamin</th>
                                    <th>Tempat Lahir</th>
                                    <th>Tanggal Lahir</th>
                                    <th>Agama</th>
                                    <th>Pendidikan</th>
                                    <th>Jenis Pekerjaan</th>
                                    <th>Status Perkawinan</th>
                                    <th>Status Hubungan</th>
                                    <th>Kewarganegaraan</th>
                                    <th>Nama Ayah</th>
                                    <th>Nama Ibu</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>No.</th>
                                    <th>No. NIK</th>
                                    <th>Nama Lengkap</th>
                                    <th>Jenis Kelamin</th>
                                    <th>Tempat Lahir</th>
                                    <th>Tanggal Lahir</th>
                                    <th>Agama</th>
                                    <th>Pendidikan</th>
                                    <th>Jenis Pekerjaan</th>
                                    <th>Status Perkawinan</th>
                                    <th>Status Hubungan</th>
                                    <th>Kewarganegaraan</th>
                                    <th>Nama Ayah</th>
                                    <th>Nama Ibu</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php
                                require_once 'php/koneksi.php';

                                if (isset($_POST['idKK'])) {
                                    $nomorKK = $_POST['idKK'];

                                    $sqlSelect = "SELECT a.nomor_ktp,a.nama_lengkap,a.jenis_kelamin,a.tempat_lahir,a.tanggal_lahir,b.agama,b.pendidikan,b.jenis_pekerjaan,b.status_perkawinan,c.status_hubungan,c.kewarganegaraan,c.nama_ayah,c.nama_ibu FROM `table_biodata` as a
                                                    JOIN `table_dataindividu` as b
                                                    ON a.nomor_ktp = b.nomor_ktp
                                                    JOIN `table_status` as c
                                                    ON a.nomor_ktp = c.nomor_ktp
                                                    WHERE a.nomor_kartukeluarga = '$nomorKK'";

                                    $result = $conn->query($sqlSelect);

                                    if ($result->num_rows > 0) {
                                        $nomor = 1;
                                        // output data of each row
                                        while ($row = $result->fetch_assoc()) {
                                            echo "
                                                <tr>
                                                    <td>$nomor</td>
                                                    <td>" . $row['nomor_ktp'] . " </td>
                                                    <td>" . $row['nama_lengkap'] . " </td>
                                                    <td>" . $row['jenis_kelamin'] . " </td>
                                                    <td>" . $row['tempat_lahir'] . " </td>
                                                    <td>" . $row['tanggal_lahir'] . " </td>
                                                    <td>" . $row['agama'] . " </td>
                                                    <td>" . $row['pendidikan'] . " </td>
                                                    <td>" . $row['jenis_pekerjaan'] . " </td>
                                                    <td>" . $row['status_perkawinan'] . " </td>
                                                    <td>" . $row['status_hubungan'] . " </td>
                                                    <td>" . $row['kewarganegaraan'] . " </td>
                                                    <td>" . $row['nama_ayah'] . " </td>
                                                    <td>" . $row['nama_ibu'] . " </td>
                                                </tr>
                                                ";
                                            $nomor++;
                                        }
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-3">
                        <a class="btn btn-success" href="?page=kelola-data"><i class="fas fa-arrow-circle-left"></i> Kembali</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    <script>
        $(document).ready(function() {
            $('#dataTableDetailData').DataTable();
        })
    </script>