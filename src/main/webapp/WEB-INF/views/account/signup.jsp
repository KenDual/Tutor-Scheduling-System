<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <title>
            SIGN UP
        </title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="<c:url value='/assets/css/nucleo-icons.css'/>" rel="stylesheet" />
        <link href="<c:url value='/assets/css/nucleo-svg.css'/>"  rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="<c:url value='/assets/css/material-dashboard.css?v=3.2.0'/>" rel="stylesheet" />
        <style>
            .page-header{
                background-size:cover;
                background-position:center;
            }
        </style>
    </head>

    <body class="bg-gray-200">
        <div class="container-fluid p-0 position-sticky z-index-sticky top-0">
            <div class="row">
                <div class="col-12">
                    <!-- Navbar -->

                    <!-- End Navbar -->
                </div>
            </div>
        </div>
        <main class="main-content  mt-0">
            <div class="page-header align-items-start min-vh-100"
                 style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
                <span class="mask bg-gradient-dark opacity-6"></span>
                <div class="container my-auto">
                    <div class="row">
                        <div class="col-lg-4 col-md-8 col-12 mx-auto">
                            <div class="card z-index-0 fadeIn3 fadeInBottom">
                                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                    <div class="bg-gradient-dark shadow-dark border-radius-lg py-3 pe-1">
                                        <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">SIGN IN</h4>
                                        <div class="row mt-3">
                                            <div class="col-2 text-center ms-auto">
                                                <a class="btn btn-link px-3" href="javascript:;">
                                                    <i class="fa fa-facebook text-white text-lg"></i>
                                                </a>
                                            </div>
                                            <div class="col-2 text-center px-1">
                                                <a class="btn btn-link px-3" href="javascript:;">
                                                    <i class="fa fa-github text-white text-lg"></i>
                                                </a>
                                            </div>
                                            <div class="col-2 text-center me-auto">
                                                <a class="btn btn-link px-3" href="javascript:;">
                                                    <i class="fa fa-google text-white text-lg"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form action="${pageContext.request.contextPath}/signup" method="post" class="text-start">
                                        <div class="d-flex justify-content-center gap-3 my-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                       name="role" id="rStudent" value="student" checked>
                                                <label class="form-check-label" for="rStudent">Student</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                       name="role" id="rTutor" value="tutor">
                                                <label class="form-check-label" for="rTutor">Tutor</label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio"
                                                       name="role" id="rTutor" value="admin">
                                                <label class="form-check-label" for="rAdmin">Admin</label>
                                            </div>
                                        </div>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label">Full name</label>
                                            <input type="text" name="fullName" class="form-control" required>
                                        </div>
                                        <div class="input-group input-group-outline my-3">
                                            <label class="form-label">Email</label>
                                            <input type="email" name="email" class="form-control" required>
                                        </div>

                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label">Password</label>
                                            <input type="password" name="password" class="form-control" required>
                                        </div>

                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label">Confirm password</label>
                                            <input type="password" name="confirm" class="form-control" required>
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn bg-gradient-dark w-100 my-4 mb-2">Sign up</button>
                                        </div>
                                        <c:if test="${not empty err}">
                                            <div class="alert alert-danger text-center py-2">${err}</div>
                                        </c:if>
                                        <c:if test="${not empty msg}">
                                            <div class="alert alert-success text-center py-2">${msg}</div>
                                        </c:if>
                                        <p class="mt-4 text-sm text-center">
                                            Already have an account?
                                            <a href="${pageContext.request.contextPath}/login" class="text-primary text-gradient font-weight-bold">Log in</a>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer position-absolute bottom-2 py-2 w-100">
                    <div class="container-fluid p-0 position-sticky z-index-sticky top-0">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-12 col-md-6 my-auto">
                                <div class="copyright text-center text-sm text-white text-lg-start">
                                    ©
                                    <script>
                                        document.write(new Date().getFullYear())
                                    </script>,
                                    made with <i class="fa fa-heart" aria-hidden="true"></i> by
                                    <a class="font-weight-bold text-white" target="_blank">Bo Tam AI Thu.</a>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                                    <li class="nav-item">
                                        <a href="https://github.com/KenDual/Tutor-Scheduling-System" class="nav-link text-white" target="_blank">About
                                            Us</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </main>
        <script src="<c:url value='/assets/js/core/popper.min.js'/>"></script>
        <script src="<c:url value='/assets/js/core/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/perfect-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/smooth-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/material-dashboard.min.js?v=3.2.0'/>"></script>
        <script>
                                        var win = navigator.platform.indexOf('Win') > -1;
                                        if (win && document.querySelector('#sidenav-scrollbar')) {
                                            var options = {
                                                damping: '0.5'
                                            };
                                            Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                                        }
        </script>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="<c:url value='/assets/js/material-dashboard.min.js?v=3.2.0'/>"></script>
    </body>
</html>