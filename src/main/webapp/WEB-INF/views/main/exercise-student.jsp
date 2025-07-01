<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="<c:url value='/assets/img/apple-icon.png'/>">
        <link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.png'/>">
        <title>Exercise</title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="<c:url value='/assets/css/nucleo-icons.css'/>" rel="stylesheet" />
        <link href="<c:url value='/assets/css/nucleo-svg.css'/>" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="<c:url value='/assets/css/material-dashboard.css?v=3.2.0'/>" rel="stylesheet" />
        <style>
            .card-header {
                background: linear-gradient(90deg, #4e73df, #224abe);
                color: white;
            }
            .table th, .table td {
                padding: 1rem;
                vertical-align: middle;
            }
            .table thead th {
                border-bottom: 2px solid #dee2e6;
            }
            .table tbody tr:hover {
                background-color: #f8f9fc;
            }
            .form-control {
                border-radius: 0.25rem;
            }
            .btn-primary {
                background-color: #4e73df;
                border-color: #4e73df;
            }
            .btn-primary:hover {
                background-color: #2e59d9;
                border-color: #2653d4;
            }
            .btn-success {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-success:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            }
            .add-btn {
                margin-top: 1rem;
            }
            .submitted-item {
                margin-top: 1rem;
            }
        </style>
    </head>
    <body class="g-sidenav-show bg-gray-100">
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-radius-lg fixed-start ms-2 bg-white my-2" id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-dark opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
                <a class="navbar-brand px-4 py-3 m-0" href="https://github.com/KenDual/Tutor-Scheduling-System" target="_blank">
                    <img src="<c:url value='/assets/img/logo-ct-dark.png'/>" class="navbar-brand-img" width="26" height="26" alt="main_logo">
                    <span class="ms-1 text-sm text-dark">Tutor Scheduling Web</span>
                </a>
            </div>
            <hr class="horizontal dark mt-0 mb-2">
            <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/dashboard-student"><i class="material-symbols-rounded opacity-5">dashboard</i><span class="nav-link-text ms-1">Dashboard</span></a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/timetable-student"><i class="material-symbols-rounded opacity-5">table_view</i><span class="nav-link-text ms-1">Timetable</span></a></li>
                    <li class="nav-item"><a class="nav-link active bg-gradient-dark text-white" href="${pageContext.request.contextPath}/exercise-student"><i class="material-symbols-rounded opacity-5">checklist</i><span class="nav-link-text ms-1">Exercise</span></a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="${pageContext.request.contextPath}/material-student"><i class="material-symbols-rounded opacity-5">notifications</i><span class="nav-link-text ms-1">Study material</span></a></li>
                    <li class="nav-item mt-3"><h6 class="ps-4 ms-2 text-uppercase text-xs text-dark font-weight-bolder opacity-5">Account pages</h6></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="<c:url value='/profile'/>"><i class="material-symbols-rounded opacity-5">person</i><span class="nav-link-text ms-1">Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="<c:url value='/logout'/>"><i class="material-symbols-rounded opacity-5">login</i><span class="nav-link-text ms-1">Log out</span></a></li>
                </ul>
            </div>
            <div class="sidenav-footer position-absolute w-100 bottom-0">
                <div class="mx-3"><a class="btn btn-outline-dark mt-4 w-100" href="<c:url value='/about-us'/>" type="button">Documentation</a></div>
            </div>
        </aside>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
            <nav class="navbar navbar-main navbar-expand-lg px-0 mx-3 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
                <div class="container-fluid py-1 px-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Student Exercise</li>
                        </ol>
                    </nav>
                    <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                        <div class="ms-md-auto pe-md-3 d-flex align-items-center"></div>
                        <ul class="navbar-nav d-flex align-items-center justify-content-end">
                            <li class="mt-1">
                                <a class="github-button" href="https://github.com/KenDual/Tutor-Scheduling-System" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star KenDual/Tutor-Scheduling-System on GitHub">Star</a>
                            </li>
                            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                                    <div class="sidenav-toggler-inner"><i class="sidenav-toggler-line"></i><i class="sidenav-toggler-line"></i><i class="sidenav-toggler-line"></i></div>
                                </a>
                            </li>
                            <li class="nav-item px-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0"><i class="material-symbols-rounded fixed-plugin-button-nav">settings</i></a>
                            </li>
                            <li class="nav-item dropdown pe-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="material-symbols-rounded">notifications</i>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="#">No new notifications</a></li>
                                </ul>
                            </li>
                            <li class="nav-item d-flex align-items-center">
                                <a class="nav-link text-body font-weight-bold px-0"><i class="material-symbols-rounded">account_circle</i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container-fluid py-2">
                <div class="row">
                    <div class="col-12">
                        <div class="card my-4">
                            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-dark shadow-dark border-radius-lg pt-4 pb-3">
                                    <h6 class="text-white text-capitalize ps-3">Exercise</h6>
                                </div>
                            </div>
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                    <c:if test="${empty exercises}">
                                        <p>No exercise found!</p>
                                    </c:if>
                                    <table class="table align-items-center mb-0" id="exerciseTable">
                                        <thead>
                                            <tr>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Exercise id</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Session id</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Title</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Description</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Due date</th>
                                            </tr>
                                        </thead>
                                        <tbody id="exerciseTableBody">
                                            <c:forEach var="exercise" items="${exercises}">
                                                <tr>
                                                    <td><h6 class="mb-0 text-sm">${exercise.exerciseId}</h6></td>
                                                    <td><h6 class="mb-0 text-sm">${exercise.sessionId}</h6></td>
                                                    <td><h6 class="mb-0 text-sm">${exercise.title}</h6></td>
                                                    <td><h6 class="mb-0 text-sm">${exercise.description}</h6></td>
                                                    <td><h6 class="mb-0 text-sm">${exercise.dueDate}</h6></td>
                                                    <td>
                                                        <a href="${pageContext.request.contextPath}/exercise-student/delete/${exercise.exerciseId}" 
                                                           class="btn btn-danger btn-sm" 
                                                           onclick="return confirm('You sure you have finish you exercise?')">Finish</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/assets/js/core/popper.min.js'/>"></script>
        <script src="<c:url value='/assets/js/core/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/perfect-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/smooth-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/chartjs.min.js'/>"></script>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="<c:url value='/assets/js/material-dashboard.min.js?v=3.2.0'/>"></script>
    </body>
</html>