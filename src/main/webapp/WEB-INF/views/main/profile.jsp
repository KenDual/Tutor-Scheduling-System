<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="<c:url value='/assets/img/apple-icon.png'/>">
        <link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.png'/>">
        <title>Profile</title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="<c:url value='/assets/css/nucleo-icons.css'/>" rel="stylesheet" />
        <link href="<c:url value='/assets/css/nucleo-svg.css'/>" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="<c:url value='/assets/css/material-dashboard.css?v=3.2.0'/>" rel="stylesheet"/>
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
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/dashboard-${user.role}">
                            <i class="material-symbols-rounded opacity-5">dashboard</i>
                            <span class="nav-link-text ms-1">Dashboard</span>
                        </a>
                    </li>
                    <c:if test="${user.role == 'student'}">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/timetable-student">
                                <i class="material-symbols-rounded opacity-5">table_view</i>
                                <span class="nav-link-text ms-1">Timetable</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/exercise-student">
                                <i class="material-symbols-rounded opacity-5">checklist</i>
                                <span class="nav-link-text ms-1">Exercise</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/material-student">
                                <i class="material-symbols-rounded opacity-5">notifications</i>
                                <span class="nav-link-text ms-1">Study material</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${user.role == 'tutor'}">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/timetable-tutor">
                                <i class="material-symbols-rounded opacity-5">table_view</i>
                                <span class="nav-link-text ms-1">Timetable</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/exercise-tutor">
                                <i class="material-symbols-rounded opacity-5">checklist</i>
                                <span class="nav-link-text ms-1">Exercise</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="${pageContext.request.contextPath}/material-tutor">
                                <i class="material-symbols-rounded opacity-5">notifications</i>
                                <span class="nav-link-text ms-1">Study material</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="nav-item mt-3">
                        <h6 class="ps-4 ms-2 text-uppercase text-xs text-dark font-weight-bolder opacity-5">Account pages</h6>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active bg-gradient-dark text-white" href="${pageContext.request.contextPath}/profile">
                            <i class="material-symbols-rounded opacity-5">person</i>
                            <span class="nav-link-text ms-1">Profile</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="<c:url value='/logout'/>">
                            <i class="material-symbols-rounded opacity-5">login</i>
                            <span class="nav-link-text ms-1">Log out</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidenav-footer position-absolute w-100 bottom-0">
                <div class="mx-3">
                    <a class="btn btn-outline-dark mt-4 w-100" href="<c:url value='/about-us'/>" type="button">Documentation</a>
                </div>
            </div>
        </aside>
        <div class="main-content position-relative max-height-vh-100 h-100">
            <nav class="navbar navbar-main navbar-expand-lg px-0 mx-3 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
                <div class="container-fluid py-1 px-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Profile</li>
                        </ol>
                    </nav>
                </div>
            </nav>
            <div class="container-fluid px-2 px-md-4">
                <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
                    <span class="mask bg-gradient-dark opacity-6"></span>
                </div>
                <div class="card card-body mx-2 mx-md-2 mt-n6">
                    <div class="row gx-4 mb-2">
                        <div class="col-auto">
                            <div class="avatar avatar-xl position-relative">
                                <img src="<c:url value='/assets/img/profile.png'/>" alt="profile_image" class="w-100 border-radius-lg shadow-sm">
                            </div>
                        </div>
                        <div class="col-auto my-auto">
                            <div class="h-100">
                                <h5 class="mb-1">${user.full_name}</h5>
                                <p class="mb-0 font-weight-normal text-sm">${user.role}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 col-xl-4">
                            <div class="card card-plain h-100">
                                <div class="card-header pb-0 p-3">
                                    <div class="row">
                                        <div class="col-md-8 d-flex align-items-center">
                                            <h6 class="mb-0">Profile Information</h6>
                                        </div>
                                        <div class="col-md-4 text-end">
                                            <a href="javascript:;">
                                                <i class="fas fa-user-edit text-secondary text-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit Profile"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body p-3">
                                    <ul class="list-group">
                                        <li class="list-group-item border-0 ps-0 pt-0 text-sm"><strong class="text-dark">Full Name:</strong> ${user.full_name}</li>
                                        <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Email:</strong> ${user.email}</li>
                                        <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Mobile:</strong> ${user.phone}</li>
                                            
                                        <c:if test="${user.role == 'tutor' && not empty tutor}">
                                            <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Education:</strong> ${tutor.education}</li>
                                            <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Profile:</strong> ${tutor.profile}</li>
                                            <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Fee Default:</strong> ${tutor.fee_default}</li>
                                            </c:if>
                                            
                                            <c:if test="${user.role == 'student' && not empty student}">
                                            <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Grade Level:</strong> ${student.grade_level}</li>
                                            <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark">Learning Goal:</strong> ${student.learning_goal}</li>
                                            </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer py-4">
                <div class="container-fluid">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-6 mb-lg-0 mb-4">
                            <div class="copyright text-center text-sm text-muted text-lg-start">
                                © <script>document.write(new Date().getFullYear())</script>,
                                made with <i class="fa fa-heart"></i> by
                                <a href="https://github.com/KenDual/Tutor-Scheduling-System.git" class="font-weight-bold" target="_blank">Bo Tam AI Thu</a>
                                for a better web.
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script>
                                    var win = navigator.platform.indexOf('Win') > -1;
                                    if (win && document.querySelector('#sidenav-scrollbar')) {
                                        var options = {damping: '0.5'};
                                        Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                                    }
        </script>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="../assets/js/material-dashboard.min.js?v=3.2.0"></script>
    </body>
</html>