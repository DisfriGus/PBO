<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Riwayat Belanja</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Add any necessary stylesheets or libraries here -->
</head>

<body class="font-poppins">
<div class="mx-[36px]">
    <div onclick="navigateBack()" class="flex items-center gap-4">
        <button class="text-[32px]" >&lt;</button>
        <h2 class="text-[30px] tracking-[3px] font-bold"> Riwayat Belanja</h2>
    </div>
    <div class="flex justify-between items-center px-6 py-3">
        <div class="flex flex-col gap-4 w-full" id="riwayat">
            <!-- Riwayat data dynamically rendered here -->
        </div>
    </div>
</div>

<script>
    // JavaScript logic goes here

    // Function to navigate back
    function navigateBack() {
        location.href="/loginSuccess"
    }

    // Function to calculate total price
    // Function to calculate total price
    function fetchData() {
        // Ganti URL API dengan URL yang sesuai
        var apiUrl = 'http://localhost:8080/api/v1/order';
        const userLogin = JSON.parse(localStorage.getItem('userData')); // Parse JSON string menjadi objek

        // Menggunakan fetch untuk mengambil data dari API
        fetch(apiUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                const users = data.filter(item => item.idCustomer === userLogin.id.toString());
                console.log(userLogin.id);
                console.log(users);
                updateInnerHtml(users);
            })
            .catch(error => {
                console.error('Fetch Error:', error);
            });
    }

    function updateInnerHtml(dataArray) {
        var dynamicContentContainer = document.getElementById('riwayat');

        // Initialize an empty string to concatenate HTML content
        var htmlContent = '';
        if (Array.isArray(dataArray)) {
            dataArray.forEach(item => {
                htmlContent += "<div class='border w-full px-3 py-6 flex flex-col gap-5'>"+item.tanggalPemesanan;

                if (Array.isArray(item.orderProduct)) {
                    item.orderProduct.forEach(data => {
                        htmlContent +=
                            "<div class=''>" +
                            "<div class='flex gap-[18px]'>" +
                            "<img src='" + data.product.url + "' alt='' class='w-20 h-20 rounded-[20px]' />" +
                            "<div class='flex flex-col gap-1'>" +
                            "<p class='tracking-[1.5px] font-extrabold'>" + data.product.namaProduct + "</p>" +
                            "<p class='tracking-[1.5px]'>Rp " + data.product.harga + " X " + data.jumlahBarang + "</p>" +
                            "</div>" +
                            "</div>" +
                            "</div>";
                    });
                }

                htmlContent += "</div>";

            });

            // Set the concatenated HTML content to the dynamicContentContainer
            if (dynamicContentContainer) {
                dynamicContentContainer.innerHTML = htmlContent;
            } else {
                console.error('Element with ID "riwayat" not found.');
            }
        } else {
            console.error('Data is not an array.');
        }
    }



    fetchData()
</script>

</body>
</html>