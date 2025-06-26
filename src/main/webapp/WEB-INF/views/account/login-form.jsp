<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Nhập - Tutor Scheduling</title>
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
            .login-container {
                background-color: white;
                padding: 2rem;
                border-radius: 0.5rem;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }
            .login-form h2 {
                text-align: center;
                margin-bottom: 1.5rem;
                color: #1e40af;
            }
            .login-form input {
                width: 100%;
                padding: 0.75rem;
                margin-bottom: 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.25rem;
                transition: border-color 0.2s;
            }
            .login-form input:focus {
                outline: none;
                border-color: #3b82f6;
            }
            .login-form button {
                width: 100%;
                padding: 0.75rem;
                background-color: #3b82f6;
                color: white;
                border: none;
                border-radius: 0.25rem;
                cursor: pointer;
                transition: background-color 0.2s;
            }
            .login-form button:hover {
                background-color: #2563eb;
            }
            .login-form .forgot-password {
                text-align: right;
                margin-top: 0.5rem;
            }
            .login-form .forgot-password a {
                color: #3b82f6;
                text-decoration: none;
            }
            .login-form .forgot-password a:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <div class="login-container">
            <div class="login-form">
                <h2 class="text-2xl font-bold">Login</h2>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <!-- Chọn Role -->
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Role</label>

                        <label class="inline-flex items-center mr-6">
                            <input type="radio" name="role" value="student" required
                                   <c:if test="${param.role eq 'student'}">checked</c:if>>
                                   <span class="ml-2">Student</span>
                            </label>

                            <label class="inline-flex items-center">
                                <input type="radio" name="role" value="tutor"
                                <c:if test="${param.role eq 'tutor'}">checked</c:if>>
                                <span class="ml-2">Tutor</span>
                            </label>
                        </div>

                        <!-- Username Form -->
                        <div>
                            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter username" required>
                        </div>

                        <!-- Password Form -->
                        <div>
                            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                            <input type="password" id="password" name="password" placeholder="Enter password" required>
                        </div>
                        <!-- Thông báo lỗi  -->
                    <c:if test="${not empty error}">
                        <div class="text-red-600 text-sm mb-4">${error}</div>
                    </c:if>
                    <button type="submit">Login</button>
                    <div class="forgot-password">
                        <a href="${pageContext.request.contextPath}/forgot-password"
                           class="text-blue-600 hover:underline">
                            Forgot password?
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.querySelector('form');
                form.addEventListener('submit', (e) => {
                    const username = document.getElementById('username').value;
                    const password = document.getElementById('password').value;
                    // Thêm logic kiểm tra đăng nhập tại đây (ví dụ: API call)
                    console.log('Đăng nhập với:', {username, password});
                    alert('Đăng nhập thành công! (Mô phỏng)');
                    // Chuyển hướng đến dashboard sau khi đăng nhập (cần điều chỉnh URL)
                    // window.location.href = 'dashboard.html';
                });
            });
        </script>
    </body>

</html>