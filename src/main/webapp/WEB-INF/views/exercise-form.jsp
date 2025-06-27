<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>
            <c:choose>
                <c:when test="${exercise.exerciseId == 0}">Thêm bài tập</c:when>
                <c:otherwise>Sửa bài tập</c:otherwise>
            </c:choose>
            (Phiên ${exercise.sessionId})
        </title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-6">

        <div class="max-w-md mx-auto bg-white shadow-md rounded-lg p-6">
            <h2 class="text-xl font-semibold mb-4">
                <c:choose>
                    <c:when test="${exercise.exerciseId == 0}">Thêm bài tập</c:when>
                    <c:otherwise>Sửa bài tập</c:otherwise>
                </c:choose>
                (Phiên ${exercise.sessionId})
            </h2>

            <form action="${pageContext.request.contextPath}/exercises/${exercise.exerciseId == 0 ? 'add' : 'edit'}"
                  method="post" class="space-y-4">

                <!-- Hidden fields -->
                <input type="hidden" name="exerciseId" value="${exercise.exerciseId}" />
                <input type="hidden" name="sessionId"  value="${exercise.sessionId}" />

                <!-- Title -->
                <div>
                    <label class="block font-medium mb-1">Tiêu đề:</label>
                    <input type="text"
                           name="title"
                           value="${exercise.title}"
                           required
                           class="w-full border px-3 py-2 rounded" />
                </div>

                <!-- Description -->
                <div>
                    <label class="block font-medium mb-1">Mô tả:</label>
                    <textarea name="description"
                              rows="4"
                              class="w-full border px-3 py-2 rounded">${exercise.description}</textarea>
                </div>

                <!-- Due Date -->
                <div>
                    <label class="block font-medium mb-1">Hạn nộp:</label>
                    <input type="date"
                           name="dueDate"
                           value="${exercise.dueDate}"
                           class="w-full border px-3 py-2 rounded" />
                </div>

                <!-- Buttons -->
                <div class="flex gap-4">
                    <button type="submit"
                            class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition">
                        Lưu
                    </button>
                    <a href="${pageContext.request.contextPath}/exercises?sessionId=${exercise.sessionId}"
                       class="text-gray-600 underline hover:text-gray-800">
                        Hủy
                    </a>
                </div>

            </form>
        </div>

    </body>
</html>
