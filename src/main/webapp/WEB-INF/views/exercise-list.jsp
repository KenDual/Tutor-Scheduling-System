<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Exercises for Session ${sessionId}</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-6">

        <div class="max-w-4xl mx-auto bg-white shadow-md rounded-lg p-6">
            <!-- Header + Add Button -->
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold">
                    Exercises for Session ID: <span class="text-blue-600">${sessionId}</span>
                </h2>
                <c:if test="${sessionScope.user.role == 'tutor'}">
                    <a href="${pageContext.request.contextPath}/exercises/add?sessionId=${sessionId}"
                       class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition">
                        + Add New Exercise
                    </a>
                </c:if>
            </div>

            <!-- Table -->
            <table class="min-w-full bg-white">
                <thead>
                    <tr class="text-left border-b-2 border-gray-200">
                        <th class="py-3 px-4 font-medium text-gray-700">Title</th>
                        <th class="py-3 px-4 font-medium text-gray-700">Description</th>
                        <th class="py-3 px-4 font-medium text-gray-700">Due Date</th>
                            <c:if test="${sessionScope.user.role == 'tutor'}">
                            <th class="py-3 px-4 font-medium text-gray-700 text-center">Actions</th>
                            </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="e" items="${exercises}">
                        <tr class="border-b hover:bg-gray-50">
                            <td class="py-2 px-4">${e.title}</td>
                            <td class="py-2 px-4">${e.description}</td>
                            <td class="py-2 px-4">
                                <c:choose>
                                    <c:when test="${not empty e.dueDate}">
                                        ${e.dueDate}
                                    </c:when>
                                    <c:otherwise>—</c:otherwise>
                                </c:choose>
                            </td>
                            <c:if test="${sessionScope.user.role == 'tutor'}">
                                <td class="py-2 px-4 text-center space-x-2">
                                    <a href="${pageContext.request.contextPath}/exercises/edit/${e.exerciseId}"
                                       class="text-blue-600 hover:underline">Edit</a>
                                    <a href="${pageContext.request.contextPath}/exercises/delete/${e.exerciseId}"
                                       onclick="return confirm('Are you sure you want to delete this exercise?');"
                                       class="text-red-600 hover:underline">Delete</a>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty exercises}">
                        <tr>
                            <td colspan="4" class="py-4 px-4 text-center text-gray-500">No exercises found.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

    </body>
</html>
