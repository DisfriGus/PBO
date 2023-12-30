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
            <h1 class='text-[30px] font-bold text-[#444B59] mb-5 '>Welcome To Our Website</h1>
            <p class='text-[#444B59] font-thin mb-12 '>Don't have an account, <a href="/Signup" class='text-[#23886D]'>Sign Up</a></p>
            <div class='flex flex-col gap-6'>
                <div>
                    <p class='text-[24px]'>Username</p>
                    <input type="text" class='outline-none border w-[400px] px-7 py-4 rounded-full' id='email' />
                </div>
                <div>
                    <p class='text-[24px]'>Password</p>
                    <input type="password" class='outline-none border w-[400px] px-7 py-4 rounded-full' id='password' />
                    <div class="error-message text-red-500 mt-4"></div>
                </div>
                <p class='text-right mb-20'><a href="/forgot-password">Forget Password ?</a></p>
                <div class='flex justify-evenly'>
                    <button class='px-6 py-3 border' onclick="handleLoginGoogle()">G</button>
                    <button class='px-6 py-3 border'>F</button>
                    <button class='px-6 py-3 border'>A</button>
                </div>
                <button class='bg-[#23886D] py-[16px] text-white font-bold rounded-full' onclick="handleSubmit()">Sign In</button>
            </div>
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
    <script>
        function handleSubmit() {
            const email = encodeURIComponent(document.getElementById('email').value);
            const password = encodeURIComponent(document.getElementById('password').value);

            const url = `http://localhost:8080/api/v1/customer`;

            fetch(url, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    const user = data.find(item => item.username === email && item.password === password);

                    if (user) {
                        // Handle successful login and display the user data
                        console.log('Login successful', user);
                        // Store user data in localStorage
                        localStorage.setItem('userData', JSON.stringify(user));
                        location.href="/loginSuccess"
                        // Assuming there is a function to display user data, implement it accordingly

                    } else {
                        // Handle case when user is not found
                        console.log('User not found');
                        const errorMessageElement = document.querySelector('.error-message');
                        errorMessageElement.innerHTML = 'Invalid email or password';
                    }
                })

        }

        function displayData(data) {
            // Implement the logic to display the data on the page
            // For example, you can log the data to the console or update a DOM element
            console.log('Data:', data);
        }
    </script>
</body>
</html>