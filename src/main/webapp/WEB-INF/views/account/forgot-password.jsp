<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi"><head>
        <meta charset="UTF-8">
        <title>Reset Password - Tutor Scheduling</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="login-container bg-white p-8 rounded shadow-md w-full max-w-md">
            <h2 class="text-2xl font-bold text-center mb-6">Reset Password</h2>

            <c:if test="${not empty err}">
                <div class="text-red-600 text-sm mb-4">${err}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="text-green-600 text-sm mb-4">${msg}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                <!-- Email -->
                <label class="block mb-4">
                    <span class="text-sm">Email</span>
                    <input type="email" name="email" required
                           class="w-full px-3 py-2 border rounded focus:outline-none"
                           value="${param.email != null ? param.email : ''}">
                </label>

                <!-- New password -->
                <label class="block mb-4">
                    <span class="text-sm">New password</span>
                    <input type="password" id="newPwd" name="newPassword" required
                           class="w-full px-3 py-2 border rounded focus:outline-none">
                </label>

                <!-- Confirm -->
                <label class="block mb-6">
                    <span class="text-sm">Confirm new password</span>
                    <input type="password" id="confirmPwd" required
                           class="w-full px-3 py-2 border rounded focus:outline-none">
                </label>

                <button type="submit"
                        class="w-full py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    Update password
                </button>

                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/login"
                       class="text-sm text-blue-600 hover:underline">Back to login</a>
                </div>
            </form>
        </div>

        <script>
            document.querySelector("form").addEventListener("submit", e => {
                if (document.getElementById("newPwd").value !==
                        document.getElementById("confirmPwd").value) {
                    alert("Xác nhận mật khẩu không khớp!");
                    e.preventDefault();
                }
            });
        </script>
    </body></html>
