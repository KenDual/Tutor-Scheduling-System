<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - Tutor Scheduling</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .signup-container {
                background-color: white;
                padding: 2rem;
                border-radius: 0.5rem;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }
            .signup-form h2 {
                text-align: center;
                margin-bottom: 1.5rem;
                color: #1e40af;
            }
            .signup-form input {
                width: 100%;
                padding: 0.75rem;
                margin-bottom: 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.25rem;
                transition: border-color 0.2s;
            }
            .signup-form input:focus {
                outline: none;
                border-color: #3b82f6;
            }
            .signup-form button {
                width: 100%;
                padding: 0.75rem;
                background-color: #3b82f6;
                color: white;
                border: none;
                border-radius: 0.25rem;
                cursor: pointer;
                transition: background-color 0.2s;
            }
            .signup-form button:hover {
                background-color: #2563eb;
            }
            .signup-form .login-link {
                text-align: center;
                margin-top: 0.5rem;
            }
            .signup-form .login-link a {
                color: #3b82f6;
                text-decoration: none;
            }
            .signup-form .login-link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <div class="signup-container">
            <div class="signup-form">
                <h2 class="text-2xl font-bold">Sign up</h2>
                <form:form action="/signup" method="post" modelAttribute="userAccount">
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700">Username</label>
                        <input type="text" id="username" placeholder="Nhập tên người dùng" required>
                    </div>
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                        <input type="email" id="email" placeholder="Nhập email" required>
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                        <input type="password" id="password" placeholder="Nhập mật khẩu" required>
                    </div>
                    <div>
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-700">Confirm password</label>
                        <input type="password" id="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                    </div>
                    <button type="submit">Sign up</button>
                    <div class="login-link">
                        <a href="/MVCEnvironment/login">Already have an account? Login</a>
                    </div>
                </form:form>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.getElementById('signupForm');
                form.addEventListener('submit', (e) => {
                    e.preventDefault();
                    const username = document.getElementById('username').value;
                    const email = document.getElementById('email').value;
                    const password = document.getElementById('password').value;
                    const confirmPassword = document.getElementById('confirmPassword').value;

                    if (password !== confirmPassword) {
                        alert('Mật khẩu và xác nhận mật khẩu không khớp!');
                        return;
                    }

                    // Thêm logic kiểm tra đăng ký tại đây (ví dụ: API call)
                    console.log('Đăng ký với:', {username, email, password});
                    alert('Đăng ký thành công! (Mô phỏng)');
                    // Chuyển hướng đến trang login sau khi đăng ký (cần điều chỉnh URL)
                    // window.location.href = 'login.html';
                });
            });
        </script>
    </body>

</html>