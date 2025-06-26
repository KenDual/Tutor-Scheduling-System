<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>403 – Access Denied</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 flex items-center justify-center min-h-screen">
        <div class="text-center">
            <h1 class="text-5xl font-bold text-red-600 mb-4">403</h1>
            <p class="text-xl">You have no rights to access this page.</p>
            <a href="${pageContext.request.contextPath}/login"
               class="mt-6 inline-block text-blue-600 hover:underline">Return to login page.</a>
        </div>
    </body>
</html>
