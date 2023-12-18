<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Toko Petani</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class='flex items-start px-80 py-16 justify-between'>
        <div>
            <h1 class='text-3xl font-bold text-gray-700 mb-5 '>Selamat Datang !</h1>
            <p class='text-gray-700 font-thin mb-12 '>Belum Punya Akun? <a href="/daftar" class='text-teal-500'>Daftar</a></p>
            <form action="/loginSuccess" method="post" class='flex flex-col gap-6'>
                <div class=''>
                    <p class='text-xl'>Username</p>
                    <input
                            type="text"
                            class='outline-none border w-96 px-7 py-4 rounded-full'
                            name='username'
                    />
                </div>
                <div>
                    <p class='text-xl'>Password</p>
                    <input
                            type="password"
                            class='outline-none border w-96 px-7 py-4 rounded-full'
                            name='password'
                    />
<%--                    <div class="text-red-500 mt-4">--%>
<%--                        Email/Password Anda Salah, Coba Lagi--%>
<%--                    </div>--%>
                </div>
                <p class='text-right mb-8'>Lupa Password ?</p>
                <div class='flex justify-evenly'>
                    <button class='px-6 py-3 border'>G</button>
                    <button class='px-6 py-3 border'>F</button>
                </div>
                <button class='bg-teal-500 py-4 text-white font-bold rounded-full'>Masuk</button>
            </form>
        </div>
        <div class=''>
            <div class='flex items-center gap-5 justify-end'>
                <h4 class=''>Hubungi Kami</h4>
                <button>
                    <a href="/">
                        Home
                    </a>
                </button>
            </div>
            <img src="/assets/asian_farmers_03.jpg" alt="">
        </div>
    </div>

</body>
</html>