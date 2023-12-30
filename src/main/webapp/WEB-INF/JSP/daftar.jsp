<%@ page language="java" contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Toko Petani</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class='flex items-center px-[80px] py-[120px] justify-evenly'>
        <div>
            <h1 class='text-[30px] font-bold text-[#444B59] mb-5 '>Selamat Datang !</h1>
            <p class='text-[#444B59] font-thin mb-12 '>Sudah Punya Akun? <a href="/Login" class='text-[#23886D]'>Login</a></p>
            <div class='flex flex-col gap-6'>
                <div class=''>
                    <p class='text-[24px]'>Username</p>
                    <input type="text" class='outline-none border w-[400px] px-7 py-4 rounded-full' id='username' />
                </div>
                <div class=''>
                    <p class='text-[24px]'>Email</p>
                    <input type="text" class='outline-none border w-[400px] px-7 py-4 rounded-full' id='email' />
                </div>
                <div>
                    <p class='text-[24px]'>Password</p>
                    <input type="password" class='outline-none border w-[400px] px-7 py-4 rounded-full' id='password' autoComplete="current-password" />
                </div>
                <div class=''>
                    <p class='text-[24px]'>Phone</p>
                    <input type="number" class='outline-none border w-[400px] px-7 py-4 rounded-full' id='phone' />
                </div>

                <button class='bg-[#23886D] py-[16px] text-white font-bold rounded-full' onclick="handleSubmit()">Sign up</button>

                <div class="error-message text-red-500 mt-4"></div>
            </div>
        </div>
        <div>
            <div class='flex items-center gap-5 justify-end'>
                <h4 class=''>Hubungi Kami</h4>
                <button>
                    <a href="/">
                        <span class='text-[24px]'>Home</span>
                    </a>
                </button>
            </div>
            <img src="/assets/asian_farmers_03.jpg" alt="" />
        </div>
    </div>
    <script>
        // Your JavaScript code goes here
        function handleSubmit() {
            const username = document.getElementById('username').value;
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const phone = document.getElementById('phone').value;

            fetch("http://localhost:8080/api/v1/customer", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    email: email,
                    password: password,
                    username: username,
                    nomorHp: phone.toString(),
                    alamat: '',
                }),
            })
            location.href="/login"
        }
    </script>

</body>

</html>