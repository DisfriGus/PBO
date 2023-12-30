<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Toko Petani</title>
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="overflow-y-auto overflow-x-hidden ">
<div class="mx-2 lg:mx-[72px] flex mt-8 justify-evenly max-2xl:flex-col">
    <div id="information" class="fixed translate-y-[-400px] bg-white w-[800px] h-[400px] z-50 border rounded-[20px]">
        <h1 class="text-[28px] font-bold">Barang Anda Sedang dikirim</h1>
        <button onclick="closePopup()" class="absolute right-2 top-1 text-[28px]">X</button>
    </div>
    <div>
        <!-- Payment Success Dialog -->
        <div id="paymentSuccessDialog" class="hidden">
            <!-- Content of the payment success dialog -->
        </div>

        <div class="flex lg:gap-6 mb-[52px] items-center">
            <button class="text-[32px]" onclick="navigateBack()">&lt;</button>
            <h1 class="lg:text-[30px] lg:font-bold tracking-[3px] font-poppins">Keranjang Belanja</h1>
        </div>
        <div class="flex justify-between">
            <div class="w-full">
                <div class="flex border-b-2 max-lg:hidden">
                    <p class="lg:text-[24px] lg:w-[412px] text-[#444B59] tracking-[2px] ">Produk</p>
                    <p class="lg:text-[24px] w-[250px] text-[#444B59] tracking-[2px]">Harga</p>
                    <p class="lg:text-[24px] text-[#444B59] tracking-[2px]">Jumlah</p>
                </div>
                <div id="dynamicContentContainer" class=" flex flex-col gap-9 mt-6 mb-[42px]">
                    <!-- Product items dynamically rendered here -->
                </div>
                <div class="flex justify-between text-[20px] mb-[20px]">
                    <p class="font-semibold text-[20px] text-[#444B59] tracking-[2px]">Subtotal untuk Produk</p>
                    <p class="font-semibold text-[20px] text-[#444B59] tracking-[2px]" id="hargaProduk">Rp</p>
                </div>
                <div class="flex justify-between text-[20px]">
                    <p class="font-semibold text-[20px] text-[#444B59] tracking-[2px]">Subtotal Pengiriman </p>
                    <p class="font-semibold text-[20px] text-[#444B59] tracking-[2px]">Rp 0</p>
                </div>
                <div class="flex justify-between text-[20px] border py-5 mt-[48px] px-4 bg-[#E8E6E6]">
                    <p class="font-semibold text-[20px] text-[#444B59] tracking-[2px]">Total Pembayaran</p>
                    <p class="font-semibold text-[20px] text-[#444B59] tracking-[2px]" id="totalBiaya">Rp </p>
                </div>
            </div>
        </div>
    </div>
    <div class="max-2xl:hidden h-[1000px] top-[-30px] border-r-4">
    </div>
    <div class="lg:w-[500px] mx-9 ">
        <div class="mt-2">
            <h1 class="text-[20px] lg:text-[30px] font-semibold mb-4 text-[#444B59] tracking-[2px]">Info Pembayaran</h1>
            <p class="lg:text-[20px] mb-3 text-[#444B59] tracking-[2px]">Alamat Pengirim</p>
            <input type="text" id="alamat" placeholder="Masukkan Alamat"
                   class="py-2 border-b lg:w-full lg:text-[18px] outline-none" value="" />
        </div>
        <div class="mt-8">
            <h1 class="text-[20px] mb-6 text-[#444B59] tracking-[2px]">Opsi Pengiriman</h1>
            <div class="flex max-md:flex-wrap gap-[38px]">
                <!-- Buttons for delivery options -->
            </div>
        </div>
        <div class="mt-8">
            <h1 class="text-[20px] mb-6 text-[#444B59] tracking-[2px]">Opsi Pembayaran</h1>
            <div class="flex max-lg:flex-wrap gap-[38px] ">
                <!-- Buttons for payment options -->
            </div>
        </div>
        <div class="mt-8">
            <h1 class="text-[20px] text-[#444B59] tracking-[2px]">Pesan</h1>
            <textarea id="pesan" class="w-[300px] md:w-[500px] h-[320px] md:h-[160px] resize-none bg-[#E8E6E6] p-4 rounded-md "
                      placeholder="Silahkan Tinggalkan Pesan Anda"></textarea>
        </div>
        <div class="flex md:justify-center">
            <button class="mt-8 text-[#fff] tracking-[2px] border px-[72px] bg-[#23886D] py-[22px] rounded-full"
                    onclick="handlePesanan()">
                Buat Pesanan
            </button>
        </div>
    </div>
</div>
<script>
    function showPopup() {
        const popup = document.getElementById("information");
        popup.style.transform = "translateY(200px)"
        popup.style.transition = "transform 1000ms ease";



        // Optional: Check if the popup is already added to the DOM
        if (!document.body.contains(popup)) {
            document.body.appendChild(popup);
        }

        popup.classList.remove("hidden"); // Apply a class to show the popup
        popup.classList.add("show"); // Additional class for styling animation

        // Optional: Set focus to the popup for accessibility
        popup.focus();
    }

    function closePopup() {
        const popup = document.getElementById("information");
        popup.classList.add("hidden"); // Apply a class to hide the popup
        popup.classList.remove("show");
        popup.style.transform = "translateY(-999px)"
        popup.style.transition = "transform 1000ms ease";
        setTimeout(function(){
            window.location.reload();
        }, 3000);
    }

    function formatDate(date) {
        const options = {
            day: '2-digit',
            month: 'long',
            year: 'numeric',
            hour: 'numeric',
            minute: 'numeric',
            second: 'numeric',
        };

        const formattedDateTime = new Intl.DateTimeFormat('en-US', options).format(date);
        const [day, month, year] = formattedDateTime.split(' ');

        return date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+", "+day+" "+ month+" "+year;
    }

    function postData(data) {
        var apiUrl = 'http://localhost:8080/api/v1/order';
        const today = new Date();
        const formattedToday = formatDate(today);
        const userDataString = localStorage.getItem('userData');
        const userData = JSON.parse(userDataString);
        fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Sesuaikan dengan tipe konten yang diharapkan
                // Tambahkan header lain jika diperlukan
            },
            body: JSON.stringify({
                orderProduct : data,
                status:"Dikirim",
                tanggalPemesanan:formattedToday,
                idCustomer:userData.id

            }), // Konversi data ke dalam format JSON
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Menguraikan respons JSON (jika server mengembalikan JSON)
            })
            .then(responseData => {
                console.log('Data berhasil ditambahkan:', responseData);
                // Lakukan sesuatu setelah berhasil menambahkan data
            })
            .catch(error => {
                console.error('Post Data Error:', error);
                // Handle error
            });
    }


    function navigateBack(){
        location.href = "/loginSuccess"
    }
    function tambah(button) {
        // Mendapatkan elemen dengan ID jumlahBarang
        var jumlahBarangElement = button.parentElement.querySelector('#jumlahBarang');

        // Mendapatkan nilai jumlah saat ini
        var jumlahSaatIni = parseInt(jumlahBarangElement.textContent);

        // Menambahkan 1 ke nilai jumlah saat ini
        var jumlahBaru = jumlahSaatIni + 1;

        // Mengupdate nilai pada elemen jumlahBarang
        jumlahBarangElement.textContent = jumlahBaru;

        // Memanggil totalProduk untuk menghitung ulang total
        totalProduk();
    }

    function kurang(button) {
        // Mendapatkan elemen dengan ID jumlahBarang
        var jumlahBarangElement = button.parentElement.querySelector('#jumlahBarang');

        // Mendapatkan nilai jumlah saat ini
        var jumlahSaatIni = parseInt(jumlahBarangElement.textContent);

        // Memastikan nilai tidak kurang dari 0
        if (jumlahSaatIni > 0) {
            // Mengurangkan 1 dari nilai jumlah saat ini
            var jumlahBaru = jumlahSaatIni - 1;

            // Mengupdate nilai pada elemen jumlahBarang
            jumlahBarangElement.textContent = jumlahBaru;

            // Memanggil totalProduk untuk menghitung ulang total
            totalProduk();
        }
    }

    function fetchData() {
        // Ganti URL API dengan URL yang sesuai
        var apiUrl = 'http://localhost:8080/api/orderProduct';

        // Menggunakan fetch untuk mengambil data dari API
        fetch(apiUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Setelah mendapatkan data dari API, isi inner HTML
                updateInnerHtml(data);
            })
            .catch(error => {
                console.error('Fetch Error:', error);
            });
    }

    // Membuat inner HTML baru secara dinamis
    function updateInnerHtml(dataArray) {
        var dynamicContentContainer = document.getElementById('dynamicContentContainer');

        // Initialize an empty string to concatenate HTML content
        var htmlContent = '';

        dataArray.forEach(data => {
            htmlContent +=
                "<div class='flex flex-col md:flex-row container' dataID='" + (data.id) + "'>" +
                    "<div class='left flex flex-row items-start justify-start gap-4 lg:w-[450px]'>" +
                        "<img class='w-[150px] h-[150px] object-cover rounded-[8px]' src='" + (data.product.url) + "' alt='' />" +
                            "<div class='flex flex-col'>" +
                                "<div class='flex flex-col'>" +
                                    "<h1 class='font-poppins text-[#031C32] font-medium leading-6 lg:text-[20px] tracking-[2px]' id='namaProduct'> " + (data.product.namaProduct) + "</h1>" +
                                "</div>" +
                            "</div>" +
                        "</div>" +
                        "<div class='max-lg:hidden lg:text-[24px] w-[200px] font-semibold text-[#444B59] tracking-[2px] mb-2 harga'>" +
                            (data.product.harga) +
                        "</div>" +
                        "<div class='right flex flex-row gap-2 h-fit items-center justify-end sm:justify-start'>" +
                            "<button class='text-[24px]' onclick='tambah(this)'>+</button>" +
                            "<p id='jumlahBarang'>"+(data.jumlahBarang)+"</p>"+
                            "<button  onclick='kurang(this)'>-</button>" +
                            "<button onclick='deleteItem(this)'>del</button>"+
                        "</div> " +
                    "</div>"
        })
        // Set the concatenated HTML content to the dynamicContentContainer
        dynamicContentContainer.innerHTML = htmlContent;

        // Call totalProduk after updating the inner HTML
        totalProduk();
    }

    fetchData();
    function totalProduk() {
        // Assuming you want to get the text content of elements with class 'harga'
        var hargaElements = document.querySelectorAll('.harga');

        var subtotal = 0;

        // Convert NodeList to Array for forEach
        Array.from(hargaElements).forEach(function (hargaElement) {
            // Get the text content of each element and parse it into a numerical value
            var hargaValue = parseFloat(hargaElement.textContent.replace('Rp ', '').replace(',', ''));

            // Mendapatkan nilai jumlah saat ini
            var jumlahSaatIni = parseInt(hargaElement.parentElement.querySelector('#jumlahBarang').textContent);

            // Ganti nilai pada elemen hargaProduk dengan hasil perkalian jumlah dengan harga per produk (misalnya, 100)
            subtotal += jumlahSaatIni * hargaValue;
        });

        // Mendapatkan elemen dengan ID hargaProduk
        var hargaProdukElement = document.getElementById('hargaProduk');
        var totalBiayaElement = document.getElementById('totalBiaya');

        // Mengupdate nilai pada elemen hargaProduk
        hargaProdukElement.textContent = "Rp " + subtotal; // Format as currency
        totalBiayaElement.textContent = "Rp " + subtotal; // Format as currency
    }


    function handlePesanan(){
        var orderProduct = []
        // Ganti URL API dengan URL yang sesuai
        var apiUrl = 'http://localhost:8080/api/orderProduct';

        // Menggunakan fetch untuk mengambil data dari API
        fetch(apiUrl)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                showPopup()
                return response.json();
            })
            .then(data => {
                // Setelah mendapatkan data dari API, isi inner HTML
                postData(data)

            })
            .catch(error => {
                console.error('Fetch Error:', error);
            });



        fetch('http://localhost:8080/api/orderProduct/deleteAll', {
            method: 'DELETE',
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }


            })
            .then(data => {
                console.log('Deletion successful:', data);

            })
            .catch(error => {
                console.error('Delete Error:', error);
            });

        showPopup()
    }

    function deleteItem(button){
        var container = button.closest('.container');
        var targetId = container.getAttribute('dataID');
        var apiUrl = 'http://localhost:8080/api/orderProduct/' + targetId;

        // Menggunakan fetch untuk melakukan permintaan DELETE
        fetch(apiUrl, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json', // Sesuaikan dengan tipe konten yang diharapkan
                // Tambahkan header lain jika diperlukan
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                console.log('Item deleted successfully');
                // Lakukan sesuatu setelah berhasil menghapus item
            })
            .catch(error => {
                console.error('Delete Error:', error);
                // Handle error
            });
        setTimeout(function(){
            window.location.reload();
        }, 500);

    }
</script>
</body>



</html>