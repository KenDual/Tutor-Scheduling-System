<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="<c:url value='/assets/img/apple-icon.png'/>">
        <link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.png'/>">
        <title>${exercise.exerciseId == 0 ? 'Thêm bài tập' : 'Sửa bài tập'}</title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="<c:url value='/assets/css/nucleo-icons.css'/>" rel="stylesheet" />
        <link href="<c:url value='/assets/css/nucleo-svg.css'/>" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="<c:url value='/assets/css/material-dashboard.css?v=3.2.0'/>" rel="stylesheet" />
    </head>
    <body class="bg-gray-200">
        <div class="container-fluid p-0 position-sticky z-index-sticky top-0">
            <main class="main-content mt-0">
                <div class="page-header align-items-start min-vh-100"
                     style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
                    <span class="mask bg-gradient-dark opacity-6"></span>
                    <div class="container my-auto">
                        <div class="row">
                            <div class="col-lg-6 col-md-8 col-12 mx-auto">
                                <div class="card z-index-0 fadeIn3 fadeInBottom">
                                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                        <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
                                            <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">
                                                ${exercise.exerciseId == 0 ? 'Thêm bài tập' : 'Sửa bài tập'}
                                            </h4>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <form action="${pageContext.request.contextPath}/exercise-tutor/${exercise.exerciseId == 0 ? 'add' : 'update'}" method="post">
                                            <input type="hidden" name="exerciseId" value="${exercise.exerciseId}" />

                                            <div class="input-group input-group-outline my-3">
                                                <label class="form-label">Tên bài tập</label>
                                                <input name="title" type="text" class="form-control" value="${exercise.title}" required>
                                            </div>

                                            <div class="input-group input-group-outline my-3">
                                                <label class="form-label">Mô tả</label>
                                                <textarea name="description" class="form-control">${exercise.description}</textarea>
                                            </div>

                                            <div class="input-group input-group-outline my-3">
                                                <label class="form-label">Phiên học</label>
                                                <select name="sessionId" class="form-control" required>
                                                    <c:forEach var="session" items="${sessions}">
                                                        <option value="${session.session_id}" 
                                                                ${exercise.sessionId == session.session_id ? 'selected' : ''}>
                                                            ${session.session_code}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                            <div class="input-group input-group-outline my-3">
                                                <label class="form-label">Due Date</label>
                                                <input name="due_date" type="datetime-local" class="form-control" 
                                                       value="${exercise.dueDate != null ? exercise.dueDate.toString().replace(' ', 'T') : ''}" required>
                                            </div>

                                            <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">
                                                ${exercise.exerciseId == 0 ? 'Thêm' : 'Cập nhật'}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="<c:url value='/assets/js/core/popper.min.js'/>"></script>
        <script src="<c:url value='/assets/js/core/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/perfect-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/smooth-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/material-dashboard.min.js?v=3.2.0'/>"></script>
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy tất cả các input trong form
                const inputs = document.querySelectorAll('.input-group-outline input, .input-group-outline textarea, .input-group-outline select');

                inputs.forEach(input => {
                    // Nếu input có giá trị, thêm class 'is-filled'
                    if (input.value) {
                        input.parentElement.classList.add('is-filled');
                    }

                    // Xử lý sự kiện khi input thay đổi
                    input.addEventListener('change', function () {
                        if (this.value) {
                            this.parentElement.classList.add('is-filled');
                        } else {
                            this.parentElement.classList.remove('is-filled');
                        }
                    });
                });
            });
        </script>
    </body>
</html>