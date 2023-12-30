<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Summary page</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<div class="m-8 mx-4 lg:mx-[100px]">
    <!-- ToastContainer -->
    <div id="toast-container" class="top-center"></div>

    <div class="flex justify-between items-center mb-8">
        <a href="/loginSuccess" class="flex items-center gap-4">
            <button >
                <!-- Assuming TbArrowLeft is some custom icon -->
                <span class="text-[24px]">&lt;</span>
            </button>
            <h4 class="text-[20px] lg:text-[30px]">Edit Profile</h4>
        </a>
        <div class="flex max-lg:flex-col items-center gap-4">
            <div class="border border-black w-10 lg:w-20 h-10 lg:h-20 rounded-full"></div>
            <p class="text-bold font-roboto lg:text-[28px] font-bold" id="username"></p>
            <div class="flex flex-col max-lg:hidden">
                <a href="/">home</a>
            </div>
        </div>
    </div>

    <div class="flex flex-col gap-6">
        <div>
            <p class="lg:text-[26px] font-semibold font-roboto">Username</p>
            <input class="border outline-none border-[#858585] rounded-md w-full lg:w-[920px] py-5 pl-8" type="text"
                   id="usernameInput" value="" />
        </div>
        <div>
            <p class="lg:text-[26px] font-semibold font-roboto">Email</p>
            <input class="border outline-none border-[#858585] rounded-md w-full lg:w-[920px] py-5 pl-8" type="text"
                   id="emailInput" />
        </div>
        <div>
            <p class="lg:text-[26px] font-semibold font-roboto">Alamat</p>
            <input class="border outline-none border-[#858585] rounded-md w-full lg:w-[920px] py-5 pl-8" type="text"
                   id="alamatInput" />
        </div>
        <div>
            <p class="lg:text-[26px] font-semibold font-roboto">Nomor HP:</p>
            <input class="border outline-none border-[#858585] rounded-md w-full lg:w-[920px] py-5 pl-8" type="text"
                   id="nomorInput" />
        </div>
        <button class="bg-[#23886D] py-[16px] mt-5 text-white font-bold rounded-full" onclick="updateProfile()">
            Update Profile
        </button>
    </div>

    <script>
        // Fetch user data from API
        function fetchUserData() {
            // Ambil nilai dari localStorage berdasarkan kunci
            const userDataString = localStorage.getItem('userData');

// Parse string JSON menjadi objek JavaScript (jika diperlukan)
            const userData = JSON.parse(userDataString);

            const apiUrl = "http://localhost:8080/api/v1/customer/"+(userData.id);

            fetch(apiUrl)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(userData => {
                    // Update input fields with user data
                    document.getElementById('usernameInput').value = userData.username;
                    document.getElementById('emailInput').value = userData.email;
                    document.getElementById('alamatInput').value = userData.alamat;
                    document.getElementById('nomorInput').value = userData.nomorHp;
                })
                .catch(error => {
                    console.error('Fetch Error:', error);
                    const errorMessageElement = document.querySelector('.error-message');
                    errorMessageElement.innerHTML = 'Error occurred while fetching user data';
                });
        }

        // Fetch user data when the page loads
        fetchUserData();

        // Function to update the profile
        function updateProfile() {
            // Mendapatkan nilai dari input fields
            const updatedUsername = document.getElementById('usernameInput').value;
            const updatedEmail = document.getElementById('emailInput').value;
            const updatedAlamat = document.getElementById('alamatInput').value;
            const updatedNomor = document.getElementById('nomorInput').value;

            // Data yang akan dikirim dalam permintaan PUT
            const updatedData = {
                username: updatedUsername,
                email: updatedEmail,
                alamat: updatedAlamat,
                nomor: updatedNomor
            };

            // Ambil id pengguna dari localStorage (asumsikan Anda menyimpan id pengguna di sana)
            const userId = JSON.parse(localStorage.getItem('userData')).id;

            // URL API yang akan dituju (gantilah dengan URL API sesuai kebutuhan Anda)
            const apiUrl = "http://localhost:8080/api/v1/customer/"+(userId);

            // Konfigurasi untuk permintaan PUT
            const requestOptions = {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                    // Tambahkan header lain jika diperlukan (misalnya token otentikasi)
                },
                body: JSON.stringify(updatedData)
            };

            // Lakukan permintaan PUT menggunakan fetch
            fetch(apiUrl, requestOptions)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(responseData => {
                    // Tanggapan sukses dari server setelah pembaruan
                    console.log('Update successful:', responseData);
                    alert("Berhasil Memperbaharui Profile")
                })
                .catch(error => {
                    // Tanggapan gagal atau jaringan error
                    console.error('Update Error:', error);
                    // Tambahkan logika penanganan kesalahan di sini
                });
        }
    </script>
</div>
</body>
</html>