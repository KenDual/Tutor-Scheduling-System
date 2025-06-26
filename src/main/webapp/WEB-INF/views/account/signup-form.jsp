<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi"><head>
        <meta charset="UTF-8">
        <title>Sign up - Tutor Scheduling</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="signup-container bg-white p-8 rounded shadow-md w-full max-w-md">
            <h2 class="text-2xl font-bold text-center mb-6">Sign up</h2>

            <!-- Thông báo -->
            <c:if test="${not empty err}">
                <div class="text-red-600 text-sm mb-4">${err}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="text-green-600 text-sm mb-4">${msg}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/signup" method="post">
                <!-- Role -->
                <label class="block mb-3">
                    <span class="text-sm">Role</span><br>
                    <input type="radio" name="role" value="student" required> Student&nbsp;&nbsp;
                    <input type="radio" name="role" value="tutor"> Tutor
                </label>

                <!-- Full name -->
                <label class="block mb-3">
                    <span class="text-sm">Full name</span>
                    <input type="text" name="fullName" required
                           class="w-full px-3 py-2 border rounded focus:outline-none">
                </label>

                <!-- Email -->
                <label class="block mb-3">
                    <span class="text-sm">Email</span>
                    <input type="email" name="email" required
                           class="w-full px-3 py-2 border rounded focus:outline-none"
                           value="${param.email != null ? param.email : ''}">
                </label>

                <!-- Password -->
                <label class="block mb-3">
                    <span class="text-sm">Password</span>
                    <input type="password" id="pwd" name="password" required
                           class="w-full px-3 py-2 border rounded focus:outline-none">
                </label>

                <!-- Confirm -->
                <label class="block mb-6">
                    <span class="text-sm">Confirm password</span>
                    <input type="password" id="confirm" required
                           class="w-full px-3 py-2 border rounded focus:outline-none">
                </label>

                <button type="submit"
                        class="w-full py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    Sign up
                </button>

                <div class="login-link text-center mt-3">
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-blue-600 hover:underline">
                        Already have an account? Login
                    </a>
                </div>
            </form>
        </div>

        <script>
            document.querySelector("form").addEventListener("submit", e => {
                if (document.getElementById("pwd").value !==
                        document.getElementById("confirm").value) {
                    alert("Mật khẩu xác nhận không khớp!");
                    e.preventDefault();
                }
            });
        </script>
    </body></html>
