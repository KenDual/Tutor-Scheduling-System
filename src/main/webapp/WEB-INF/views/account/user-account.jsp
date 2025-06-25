
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
            <thead>
                <tr>
                    <th>Full name</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${signupService}">
                    <tr>
                        <td>${user.full_name}</td>
                        <td>${user.email}</td>
                        <td>${user.password}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty customers}">
                    <tr>
                        <td colspan="5">No customers found!</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </body>
</html>
