<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Admin Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="bg-white p-8 rounded shadow-md w-full max-w-md">
            <h2 class="text-2xl font-bold text-center text-red-700 mb-6">Admin Login</h2>

            <form action="${pageContext.request.contextPath}/admin/login" method="post">

                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" id="email" name="email" required
                           class="w-full px-3 py-2 border rounded focus:outline-none focus:border-blue-500"
                           value="${param.email != null ? param.email : ''}">
                </div>

                <div class="mb-6">
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-3 py-2 border rounded focus:outline-none focus:border-blue-500">
                </div>

                <c:if test="${not empty error}">
                    <div class="text-red-600 text-sm mb-4">${error}</div>
                </c:if>

                <button type="submit"
                        class="w-full py-2 bg-red-600 text-white rounded hover:bg-red-700 transition">
                    Login
                </button>
            </form>
        </div>
    </body>
</html>
