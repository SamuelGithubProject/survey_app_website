function saveSurveyToPdf(filename, surveyModel, pdfWidth, pdfHeight) {
    var options = {
        fontSize: 14,
        margins: {
            left: 10,
            right: 10,
            top: 10,
            bot: 10
        },
        format: [pdfWidth, pdfHeight]
    };
    var surveyPDF = new SurveyPDF.SurveyPDF(json, options);
    surveyPDF.data = surveyModel.data;
    surveyPDF.save(filename);
}

$(document).ready(function() {
    $.ajax({
        method: 'POST',
        url: 'php/surveyselect.php',
        data: {
            task: 'selectDataKuisioner',
        },
        success: function (response) {
            if (response) {
                var jsonParse = JSON.parse(response);
                var nomor = 1;
                var dataKuis = ``;
                jsonParse.map((item) => {
                    if (item.result) {
                        dataKuis += `
                        <tr class="text-center">
                            <td>${nomor}</td>
                            <td>${item.tanggal_waktu_pengisian}</td>
                            <td>${item.nomor_kk}</td>
                            <td>${item.nomor_ktp}</td>
                            <td>${item.nama_lengkap}</td>
                            <td><button class="btn btn-success" id="btnHasilSurvei${nomor}" onclick="printPDF(${item.nomor_kk});">Lihat Hasil</button></td>
                        </tr>`
                    }
                    $('#tableShowDataResult tbody').html(dataKuis);
                    nomor++;
                })
            } else {
                $('#tableShowDataResult tbody').html(`
                <tr class="text-center">
                    <td colspan="6">Data Belum Ada</td>
                </tr>`);
            }
        }
    })
})

function printPDF(nomorKK) {
    $.ajax({
        method: 'POST',
        url: 'php/surveyselect.php',
        data: {
            task: 'selectDataKuisioner',
        },
        success: function (response) {
            if (response) {
                var jsonParse = JSON.parse(response);
                var nomor = 1;
                var dataKuis = "";
                jsonParse.map((item) => {
                    if (item.result) {
                        dataKuis += item.result;
                    }
                    nomor++;
                })
                var pdfWidth = survey.pdfWidth || 210;
                var pdfHeight = survey.pdfHeight || 297;
                saveSurveyToPdf(`surveyResult-${nomorKK}.pdf`, JSON.parse(dataKuis), pdfWidth, pdfHeight);
            } else {
                $('#tableShowDataResult tbody').html(`
                <tr class="text-center">
                    <td colspan="6">Data Belum Ada</td>
                </tr>`);
            }
        }
    })
}
