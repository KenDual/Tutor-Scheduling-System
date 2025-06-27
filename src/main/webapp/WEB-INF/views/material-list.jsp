<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Study Materials</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-8">

        <h2 class="text-2xl font-bold mb-6">Study Materials</h2>

        <table class="min-w-full bg-white shadow rounded-lg overflow-hidden">
            <thead class="bg-blue-600 text-white">
                <tr>
                    <th class="px-6 py-3 text-left">Title</th>
                    <th class="px-6 py-3 text-left">Description</th>
                    <th class="px-6 py-3 text-left">Uploaded At</th>
                    <th class="px-6 py-3 text-left">Download</th>
                </tr>
            </thead>
            <tbody class="text-gray-700">
                <c:forEach var="m" items="${list}">
                    <tr class="border-b">
                        <td class="px-6 py-4">${m.title}</td>
                        <td class="px-6 py-4">${m.description}</td>
                        <td class="px-6 py-4">
                            <fmt:formatDate value="${m.uploadedAt}" pattern="dd/MM/yyyy HH:mm"/>
                        </td>
                        <td class="px-6 py-4">
                            <a href="${pageContext.request.contextPath}/materials/download/${m.materialId}"
                               class="text-blue-600 hover:underline">
                                Download
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list}">
                    <tr>
                        <td colspan="4" class="px-6 py-4 text-center">
                            No materials uploaded yet.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>

    </body>
</html>
