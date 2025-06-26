<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Student Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">

        <!-- ===== HEADER ===== -->
        <header class="bg-blue-600 text-white py-4">
            <div class="container mx-auto flex justify-between">
                <h1 class="text-2xl font-bold">Student Dashboard</h1>
                <a href="${pageContext.request.contextPath}/logout" class="hover:underline">Log out</a>
            </div>
        </header>

        <!-- ===== MAIN ===== -->
        <div class="p-6">
            <h2 class="text-xl font-bold mb-4">My Timetable</h2>

  <!-- ========== bảng timetable: lấy từ ${sessions} do controller đưa vào ========== -->
            <table class="min-w-full bg-white shadow rounded-lg overflow-hidden">
                <thead class="bg-blue-600 text-white">
                    <tr>
                        <th class="px-4 py-2">Code</th>
                        <th class="px-4 py-2">Day</th>
                        <th class="px-4 py-2">Slot</th>
                        <th class="px-4 py-2">Subject</th>
                        <th class="px-4 py-2">Tutor</th>
                        <th class="px-4 py-2">Location</th>
                        <th class="px-4 py-2">Book</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${sessions}">
                        <tr class="border-b">
                            <td class="px-4 py-2">${s.session_code}</td>
                            <td class="px-4 py-2">${s.day_of_week}</td>
                            <td class="px-4 py-2">
                                <c:choose>
                                    <c:when test="${s.slot==1}">Morning</c:when>
                                    <c:when test="${s.slot==2}">Afternoon</c:when>
                                    <c:otherwise>Evening</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="px-4 py-2">${s.subjectName}</td><!-- subjectName chuẩn bị ở SQL -->
                            <td class="px-4 py-2">${s.tutorName}</td>  <!-- tutorName chuẩn bị ở SQL -->
                            <td class="px-4 py-2">${s.location}</td>
                            <td class="px-4 py-2">
                                <form action="${pageContext.request.contextPath}/bookings/book" method="post">
                                    <input type="hidden" name="sessionId" value="${s.session_id}">
                                    <button class="bg-green-600 text-white px-3 py-1 rounded
                                            hover:bg-green-700">Book</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                    <!-- Nếu không có ca -->
                    <c:if test="${empty sessions}">
                        <tr><td colspan="7" class="text-center py-6 text-gray-500">No class this week</td></tr>
                    </c:if>
                </tbody>
            </table>

            <!-- FLASH -->
            <c:if test="${not empty msg}">
                <p class="text-green-700 mt-4">${msg}</p>
            </c:if>
            <c:if test="${not empty err}">
                <p class="text-red-600 mt-4">${err}</p>
            </c:if>
        </div>
    </body>
</html>
