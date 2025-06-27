<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>All Sessions</title></head>
<body>
  <h2>Danh sách Sessions</h2>
  <table border="1" cellpadding="5">
    <tr>
      <th>Code</th><th>Location</th><th>Capacity</th><th>Status</th><th>Created</th><th>Exercises</th>
    </tr>
    <c:forEach var="s" items="${sessions}">
      <tr>
        <td>${s.sessionCode}</td>
        <td>${s.location}</td>
        <td>${s.capacity}</td>
        <td>${s.status}</td>
        <td><fmt:formatDate value="${s.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        <td>
          <a href="${pageContext.request.contextPath}/exercises?sessionId=${s.sessionId}">
            Xem Exercises
          </a>
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
