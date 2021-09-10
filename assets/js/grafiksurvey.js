$(document).ready(()=>{
    $.ajax({
        method: "POST",
        url: "php/grafik.php",
        data: {
            task: "selectDataPenduduk"
        },
        success: (response) => {
            let jsonparse = JSON.parse(response);
            $("#pendudukterdaftar").html(jsonparse[0].jumlahdata + " Orang");

            $.ajax({
                method: "POST",
                url: "php/grafik.php",
                data: {
                    task: "selectJumlahMenjawab"
                },
                success: (response) => {
                    $("#pendudukmenjawab").html(response + " Orang");
                    let penduduktidakmengisi = jsonparse[0].jumlahdata - response;
                    $("#penduduktidakmenjawab").html(penduduktidakmengisi + " Orang");
                }
            });
        }
    });

    //Grafik Ijazah
    let grafiksurveysatu = $("#grafiksurveybagiansatu");
    let myChart = new Chart(grafiksurveysatu, {
        type: 'bar',
        data: {
            labels: ['SD/SMP', 'SMA/SMK', 'DI/DII/DIII', 'DIV/S1', 'S2/S3'],
            datasets: [{
                label: 'Responden Survei Berdasarkan Pendidikan Terakhir',
                data: [2.50, 25.60, 10.54, 46.23, 15.13],
                backgroundColor: [
                    'rgba(255, 94, 0)',
                ],
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
        }
    });

    //Grafik Usia
    let grafiksurveydua = $("#myPieChart");
    let PieChart = new Chart(grafiksurveydua, {
        type: 'doughnut',
        data: {
            labels: [
            'Usia > 60 Tahun',
            'Usia 17-30 Tahun',
            'Usia 31-45 Tahun',
            'Usia 46-60 Tahun'
            ],
            datasets: [{
            label: 'My First Dataset',
            data: [3.62, 27.24, 41.77, 27.37],
            backgroundColor: [
                'rgb(252, 199, 23)',
                'rgb(1, 55, 140)',
                'rgba(255, 94, 0)',
                'rgba(145, 145, 145)'
            ],
            hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom',
                }
            }
        }
    });

})