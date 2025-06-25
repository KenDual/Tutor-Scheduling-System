<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard – Admin</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-8">
        <h1 class="text-3xl font-bold mb-6">TẤT CẢ CA HỌC</h1>

        <table class="min-w-full bg-white shadow rounded-lg overflow-hidden">
            <thead class="bg-blue-600 text-white">
                <tr>
                    <th class="px-4 py-2 text-left">ID</th>
                    <th class="px-4 py-2 text-left">Tutor</th>
                    <th class="px-4 py-2 text-left">Subject</th>
                    <th class="px-4 py-2 text-left">Day</th>
                    <th class="px-4 py-2 text-left">Slot</th>
                    <th class="px-4 py-2 text-left">Status</th>
                    <th class="px-4 py-2 text-left">Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="s" items="${sessionList}" varStatus="st">
                    <tr class="${st.index % 2 == 0 ? 'bg-gray-50' : ''} hover:bg-gray-100">
                        <td class="px-4 py-2">${s.session_id}</td>
                        <td class="px-4 py-2">${s.session_code}</td>
                        <td class="px-4 py-2">${s.subject_id}</td>
                        <td class="px-4 py-2">${s.location}</td>
                        <td class="px-4 py-2">${s.capacity}</td>
                        <td class="px-4 py-2">${s.status}</td>
                        <td class="px-4 py-2">${s.create_at}</td>
                        <td class="px-4 py-2 capitalize">${s.day}</td>
                        <td class="px-4 py-2 capitalize">${s.slot}</td>

                        <td class="px-4 py-2">
                            <!-- Chỉ hiển thị nút nếu status = pending -->
                            <c:if test="${s.status eq 'pending'}">
                                <form action="${pageContext.request.contextPath}/admin/sessions/approve"
                                      method="post" class="inline">
                                    <input type="hidden" name="id" value="${s.sessionId}"/>
                                    <button class="bg-green-600 text-white px-3 py-1 rounded text-sm">
                                        Approve
                                    </button>
                                </form>

                                <form action="${pageContext.request.contextPath}/admin/sessions/reject"
                                      method="post" class="inline ml-2">
                                    <input type="hidden" name="id" value="${s.sessionId}"/>
                                    <button class="bg-red-600 text-white px-3 py-1 rounded text-sm">
                                        Reject
                                    </button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty sessionList}">
                    <tr><td colspan="7" class="text-center py-4">Chưa có ca học nào.</td></tr>
                </c:if>
            </tbody>
        </table>
    </body>
</html>
