<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <title>
            LOG IN
        </title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="<c:url value='/assets/css/nucleo-icons.css'/>" rel="stylesheet" />
        <link href="<c:url value='/assets/css/nucleo-svg.css'/>" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <!-- Material Icons -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="<c:url value='/assets/css/material-dashboard.css?v=3.2.0'/>" rel="stylesheet" />
        <style>
            .page-header{
                background-size: cover;
                background-position: center;
            }
        </style>    
    </head>

    <body class="bg-gray-200">
        <div class="container-fluid p-0 position-sticky z-index-sticky top-0">
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
                                            <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">LOG IN</h4>
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
                                        <form action="${pageContext.request.contextPath}/forgot-password"
                                              method="post" class="text-start">

                                            <div class="input-group input-group-outline my-3">
                                                <label class="form-label">Email</label>
                                                <input name="email" type="email" class="form-control"
                                                       value="${email}">
                                            </div>

                                            <div class="input-group input-group-outline mb-3">
                                                <label class="form-label">New password</label>
                                                <input name="newPassword" type="password"
                                                       class="form-control" required>
                                            </div>

                                            <button type="submit"
                                                    class="btn bg-gradient-dark w-100 my-4 mb-2">Reset</button>

                                            <c:if test="${not empty err}">
                                                <div class="alert alert-danger text-center py-2">${err}</div>
                                            </c:if>
                                            <c:if test="${not empty msg}">
                                                <div class="alert alert-success text-center py-2">${msg}</div>
                                            </c:if>
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
                                            document.write(new Date().getFullYear());
                                        </script>,
                                        made with <i class="fa fa-heart" aria-hidden="true"></i> by
                                        <a class="font-weight-bold text-white" target="_blank">Bo Tam AI Thu.</a>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                                        <li class="nav-item">
                                            <a href="https://www.creative-tim.com/presentation" class="nav-link text-white" target="_blank">About
                                                Us</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </main>
        </div>
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