<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Upload Study Material</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-8">

        <h2 class="text-2xl font-bold mb-6">Upload Study Material</h2>

        <form:form modelAttribute="material"
                   action="${pageContext.request.contextPath}/materials/upload"
                   method="post" enctype="multipart/form-data"
                   cssClass="max-w-lg bg-white p-6 shadow rounded space-y-4">

            <div>
                <label class="block font-medium">Title</label>
                <form:input path="title" cssClass="w-full border p-2 rounded" required="true"/>
            </div>

            <div>
                <label class="block font-medium">Description</label>
                <form:textarea path="description" cssClass="w-full border p-2 rounded" rows="3"/>
            </div>

            <div>
                <label class="block font-medium">Choose file (.pdf, .docx…)</label>
                <input type="file" name="file" class="w-full border p-2 rounded" required>
            </div>

            <button class="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700">
                Upload
            </button>
        </form:form>

    <c:if test="${not empty msg}">
        <p class="text-green-600 mt-4">${msg}</p>
    </c:if>

</body>
</html>
