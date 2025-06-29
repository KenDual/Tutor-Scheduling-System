<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/assets/img/apple-icon.png"/>">
        <link rel="icon" type="image/png" href="<c:url value="/assets/img/favicon.png"/>">
        <title>
            Timetable
        </title>
        <style>
            .card .table-responsive {
                min-height: 60vh;
            }

            .timetable {
                width: 100%;
                border-collapse: collapse;
                table-layout: fixed;
                border-bottom: 1px solid #dee2e6;
            }

            .timetable tr:last-child th,
            .timetable tr:last-child td {
                border-right: 1px solid #dee2e6 !important;
            }

            .timetable th,
            .timetable td {
                border: 1px solid #dee2e6 !important;
                padding: 18px 10px;
                height: 120px;
                vertical-align: top;
                text-align: center;
                font-size: 14px;
                position: relative;
            }

            .timetable .time-col {
                width: 110px;
                background: #f8f9fa;
                font-weight: 600;
            }

            .timetable thead th {
                position: sticky;
                top: 0;
                z-index: 2;
                background: #f8f9fa;
                font-weight: 600;
                white-space: nowrap;
            }

            .class-info {
                position: relative;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 2px;
            }

            .class-info .admin {
                font-size: 13px;
                color: #6c757d;
            }

            .class-info .tooltip {
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                margin-top: 6px;
                background: #333;
                color: #fff;
                padding: 8px 12px;
                border-radius: 4px;
                font-size: 12px;
                white-space: nowrap;
                box-shadow: 0 2px 8px rgba(0, 0, 0, .15);
                opacity: 0;
                visibility: hidden;
                transition: opacity .2s;
                z-index: 20;
            }

            .class-info:hover .tooltip {
                opacity: 1;
                visibility: visible;
            }

            .class-info .tooltip::before {
                content: "";
                position: absolute;
                top: -6px;
                left: 50%;
                transform: translateX(-50%);
                border: 6px solid transparent;
                border-bottom-color: #333;
            }

            .remove-btn {
                position: absolute;
                top: 5px;
                right: 5px;
                background: #dc3545;
                border: none;
                color: white;
                border-radius: 50%;
                width: 20px;
                height: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                font-size: 12px;
                opacity: 0;
                transition: opacity 0.2s;
            }

            .class-info:hover .remove-btn {
                opacity: 1;
            }

            @media (max-width:992px) {
                .timetable th,
                .timetable td {
                    height: 90px;
                    padding: 12px 6px;
                    font-size: 13px;
                }

                .class-info .admin {
                    font-size: 11px;
                }

                .remove-btn {
                    width: 18px;
                    height: 18px;
                    font-size: 10px;
                }
            }
        </style>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="<c:url value="/assets/css/nucleo-icons.css"/>" rel="stylesheet" />
        <link href="<c:url value="/assets/css/nucleo-svg.css"/> rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="<c:url value="/assets/css/material-dashboard.css?v=3.2.0"/>" rel="stylesheet"/>
    </head>

    <body class="g-sidenav-show  bg-gray-100">
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-radius-lg fixed-start ms-2  bg-white my-2"
               id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-dark opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
                   aria-hidden="true" id="iconSidenav"></i>
                <a class="navbar-brand px-4 py-3 m-0" href="https://github.com/KenDual/Tutor-Scheduling-System"
                   target="_blank">
                    <img src="<c:url value='/assets/img/logo-ct-dark.png'/>" 
                         class="navbar-brand-img" width="26" height="26" alt="main_logo">
                    <span class="ms-1 text-sm text-dark">Scheduling System</span>
                </a>
            </div>
            <hr class="horizontal dark mt-0 mb-2">
            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/dashboard-admin">
                            <i class="material-symbols-rounded opacity-5">dashboard</i>
                            <span class="nav-link-text ms-1">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active bg-gradient-dark text-white" href="${pageContext.request.contextPath}/timetable-admin">
                            <i class="material-symbols-rounded opacity-5">table_view</i>
                            <span class="nav-link-text ms-1">Timetable</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/exercise-admin">
                            <i class="material-symbols-rounded opacity-5">checklist</i>
                            <span class="nav-link-text ms-1">Exercise</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/material-admin">
                            <i class="material-symbols-rounded opacity-5">notifications</i>
                            <span class="nav-link-text ms-1">Study material</span>
                        </a>
                    </li>
                    <li class="nav-item mt-3">
                        <h6 class="ps-4 ms-2 text-uppercase text-xs text-dark font-weight-bolder opacity-5">Account pages</h6>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="<c:url value='/profile'/>">
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
            <div class="sidenav-footer position-absolute w-100 bottom-0 ">
                <div class="mx-3">
                    <a class="btn btn-outline-dark mt-4 w-100" href="/about-us" type="button">Documentation</a>
                </div>
            </div>
        </aside>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
            <!-- Navbar -->
            <nav class="navbar navbar-main navbar-expand-lg px-0 mx-3 shadow-none border-radius-xl" id="navbarBlur"
                 data-scroll="true">
                <div class="container-fluid py-1 px-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Timetable-admin</li>
                        </ol>
                    </nav>
                    <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                        <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                        </div>
                        <ul class="navbar-nav d-flex align-items-center  justify-content-end">

                            <li class="mt-1">
                                <a class="github-button" href="https://github.com/KenDual/Tutor-Scheduling-System"
                                   data-icon="octicon-star" data-size="large" data-show-count="true"
                                   aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
                            </li>
                            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                                    <div class="sidenav-toggler-inner">
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item px-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0">
                                    <i class="material-symbols-rounded fixed-plugin-button-nav">settings</i>
                                </a>
                            </li>
                            <li class="nav-item dropdown pe-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="material-symbols-rounded">notifications</i>
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                                    <li class="mb-2">
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="my-auto">
                                                    <img src="../assets/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        <span class="font-weight-bold">New message</span> from Laur
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        13 minutes ago
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="mb-2">
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="my-auto">
                                                    <img src="../assets/img/small-logos/logo-spotify.svg"
                                                         class="avatar avatar-sm bg-gradient-dark  me-3 ">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        <span class="font-weight-bold">New album</span> by Travis Scott
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        1 day
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                                                    <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1"
                                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                    <title>credit-card</title>
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                                    <g transform="translate(1716.000000, 291.000000)">
                                                    <g transform="translate(453.000000, 454.000000)">
                                                    <path class="color-background"
                                                          d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
                                                          opacity="0.593633743"></path>
                                                    <path class="color-background"
                                                          d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z">
                                                    </path>
                                                    </g>
                                                    </g>
                                                    </g>
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        Payment successfully completed
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        2 days
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item d-flex align-items-center">
                                <a href="../pages/sign-in.html" class="nav-link text-body font-weight-bold px-0">
                                    <i class="material-symbols-rounded">account_circle</i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="container-fluid py-2">
                <div class="row">
                    <div class="col-12">
                        <div class="card my-4">
                            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-dark shadow-dark border-radius-lg pt-4 pb-3">
                                    <h6 class="text-white text-capitalize ps-3">Timetable</h6>
                                </div>
                            </div>
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                    <table class="table timetable">

                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Monday</th>
                                                <th>Tuesday</th>
                                                <th>Wednesday</th>
                                                <th>Thursday</th>
                                                <th>Friday</th>
                                                <th>Saturday</th>
                                                <th>Sunday</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th class="time-col">Morning</th>
                                                <td>
                                                    <div class="class-info">
                                                        <p class="subject mb-0">Toán</p>
                                                        <p class="admin mb-0 text-secondary small">Admin: A</p>
                                                        <div class="tooltip">
                                                            <p><strong>Admin:</strong> A</p>
                                                            <p><strong>Subject:</strong> Toán</p>
                                                            <p><strong>Address:</strong> Phòng 101</p>
                                                        </div>
                                                        <button class="remove-btn" onclick="confirmRemove(this)">X</button>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="class-info">
                                                        <p class="subject mb-0">Toán</p>
                                                        <p class="admin mb-0 text-secondary small">Admin: A</p>
                                                        <div class="tooltip">
                                                            <p><strong>Admin:</strong> D</p>
                                                            <p><strong>Subject:</strong> Lịch Sử</p>
                                                            <p><strong>Address:</strong> Phòng 202</p>
                                                        </div>
                                                        <button class="remove-btn" onclick="confirmRemove(this)">X</button>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th class="time-col">Afternoon</th>
                                                <td></td>
                                                <td>
                                                    <div class="class-info">
                                                        <p class="subject mb-0">Toán</p>
                                                        <p class="admin mb-0 text-secondary small">Admin: A</p>
                                                        <div class="tooltip">
                                                            <p><strong>Admin:</strong> B</p>
                                                            <p><strong>Subject:</strong> Khoa Học</p>
                                                            <p><strong>Address:</strong> Lab 2</p>
                                                        </div>
                                                        <button class="remove-btn" onclick="confirmRemove(this)">X</button>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="class-info">
                                                        <p class="subject mb-0">Toán</p>
                                                        <p class="admin mb-0 text-secondary small">Admin: A</p>
                                                        <div class="tooltip">
                                                            <p><strong>Admin:</strong> E</p>
                                                            <p><strong>Subject:</strong> Mỹ Thuật</p>
                                                            <p><strong>Address:</strong> Xưởng 1</p>
                                                        </div>
                                                        <button class="remove-btn" onclick="confirmRemove(this)">X</button>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <th class="time-col">Evening</th>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="class-info">
                                                        <p class="subject mb-0">Toán</p>
                                                        <p class="admin mb-0 text-secondary small">Admin: A</p>
                                                        <div class="tooltip">
                                                            <p><strong>Admin:</strong> C</p>
                                                            <p><strong>Subject:</strong> Tiếng Anh</p>
                                                            <p><strong>Address:</strong> Library</p>
                                                        </div>
                                                        <button class="remove-btn" onclick="confirmRemove(this)">X</button>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="class-info">
                                                        <p class="subject mb-0">Toán</p>
                                                        <p class="admin mb-0 text-secondary small">Admin: A</p>
                                                        <div class="tooltip">
                                                            <p><strong>Admin:</strong> F</p>
                                                            <p><strong>Subject:</strong> Âm Nhạc</p>
                                                            <p><strong>Address:</strong> Hall 3</p>
                                                        </div>
                                                        <button class="remove-btn" onclick="confirmRemove(this)">X</button>
                                                    </div>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <hr class="my-4">

                                    <form id="register-form" class="row g-3 px-4">
                                        <!-- 1. Chọn ngày -->
                                        <div class="col-md-3">
                                            <label class="form-label fw-bold">Day of week</label>
                                            <select id="daySelect" class="form-select">
                                                <option selected disabled>Choose a day…</option>
                                                <option value="mon">Monday</option>
                                                <option value="tue">Tuesday</option>
                                                <option value="wed">Wednesday</option>
                                                <option value="thu">Thursday</option>
                                                <option value="fri">Friday</option>
                                                <option value="sat">Saturday</option>
                                                <option value="sun">Sunday</option>
                                            </select>
                                        </div>

                                        <!-- 2. Chọn ca – mặc định bị khoá -->
                                        <div class="col-md-3">
                                            <label class="form-label fw-bold">Timeslot</label>
                                            <select id="slotSelect" class="form-select" disabled>
                                                <option selected disabled>Choose a slot…</option>
                                                <option value="morning">Morning</option>
                                                <option value="afternoon">Afternoon</option>
                                                <option value="evening">Evening</option>
                                            </select>
                                        </div>

                                        <!-- 3. Nhập môn học – mặc định bị khoá -->
                                        <div class="col-md-4">
                                            <label class="form-label fw-bold">Subject</label>
                                            <input id="subjectInput" type="text" class="form-control" placeholder="Choose a slot first…"
                                                   disabled>
                                        </div>

                                        <!-- 4. Submit -->
                                        <div class="col-md-2 d-flex align-items-end">
                                            <button id="submitBtn" type="submit" class="btn btn-primary w-100" disabled>
                                                Submit
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer py-4  ">
                    <div class="container-fluid">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6 mb-lg-0 mb-4">
                                <div class="copyright text-center text-sm text-muted text-lg-start">
                                    ©
                                    <script>
                                        document.write(new Date().getFullYear())
                                    </script>,
                                    made with <i class="fa fa-heart"></i> by
                                    <a href="https://github.com/KenDual/Tutor-Scheduling-System" class="font-weight-bold" target="_blank">Bo
                                        Tam AI Thu</a>
                                    for a better web.
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                                    <li class="nav-item">
                                        <a href="https://github.com/KenDual/Tutor-Scheduling-System" class="nav-link text-muted"
                                           target="_blank">About
                                            Us</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </main>
        <div class="fixed-plugin">
            <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
                <i class="material-symbols-rounded py-2">settings</i>
            </a>
            <div class="card shadow-lg">
                <div class="card-header pb-0 pt-3">
                    <div class="float-start">
                        <h5 class="mt-3 mb-0">Material UI Configurator</h5>
                        <p>See our dashboard options.</p>
                    </div>
                    <div class="float-end mt-4">
                        <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
                            <i class="material-symbols-rounded">clear</i>
                        </button>
                    </div>
                    <!-- End Toggle Button -->
                </div>
                <hr class="horizontal dark my-1">
                <div class="card-body pt-sm-3 pt-0">
                    <!-- Sidebar Backgrounds -->
                    <div>
                        <h6 class="mb-0">Sidebar Colors</h6>
                    </div>
                    <a href="javascript:void(0)" class="switch-trigger background-color">
                        <div class="badge-colors my-2 text-start">
                            <span class="badge filter bg-gradient-primary" data-color="primary" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-dark active" data-color="dark" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
                        </div>
                    </a>
                    <!-- Sidenav Type -->
                    <div class="mt-3">
                        <h6 class="mb-0">Sidenav Type</h6>
                        <p class="text-sm">Choose between different sidenav types.</p>
                    </div>
                    <div class="d-flex">
                        <button class="btn bg-gradient-dark px-3 mb-2" data-class="bg-gradient-dark"
                                onclick="sidebarType(this)">Dark</button>
                        <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent"
                                onclick="sidebarType(this)">Transparent</button>
                        <button class="btn bg-gradient-dark px-3 mb-2  active ms-2" data-class="bg-white"
                                onclick="sidebarType(this)">White</button>
                    </div>
                    <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
                    <!-- Navbar Fixed -->
                    <div class="mt-3 d-flex">
                        <h6 class="mb-0">Navbar Fixed</h6>
                        <div class="form-check form-switch ps-0 ms-auto my-auto">
                            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
                        </div>
                    </div>
                    <hr class="horizontal dark my-3">
                    <div class="mt-2 d-flex">
                        <h6 class="mb-0">Light / Dark</h6>
                        <div class="form-check form-switch ps-0 ms-auto my-auto">
                            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
                        </div>
                    </div>
                    <hr class="horizontal dark my-sm-4">
                    <a class="btn bg-gradient-info w-100" href="https://www.creative-tim.com/product/material-dashboard-pro">Free
                        Download</a>
                    <a class="btn btn-outline-dark w-100"
                       href="https://www.creative-tim.com/learning-lab/bootstrap/overview/material-dashboard">View documentation</a>
                    <div class="w-100 text-center">
                        <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard"
                           data-icon="octicon-star" data-size="large" data-show-count="true"
                           aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
                        <h6 class="mt-3">Thank you for sharing!</h6>
                        <a href="https://twitter.com/intent/tweet?text=Check%20Material%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard"
                           class="btn btn-dark mb-0 me-2" target="_blank">
                            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
                        </a>
                        <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/material-dashboard"
                           class="btn btn-dark mb-0 me-2" target="_blank">
                            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="<c:url value='/assets/js/core/popper.min.js'/>"></script>
        <script src="<c:url value='/assets/js/core/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/perfect-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/smooth-scrollbar.min.js'/>"></script>
        <script src="<c:url value='/assets/js/plugins/chartjs.min.js'/>"></script>
        <script>
                      var win = navigator.platform.indexOf('Win') > -1;
                      if (win && document.querySelector('#sidenav-scrollbar')) {
                          var options = {
                              damping: '0.5'
                          }
                          Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                      }
        </script>
        <script>
                      // Lấy các phần tử
                      const daySel = document.getElementById('daySelect');
                      const slotSel = document.getElementById('slotSelect');
                      const subjectInp = document.getElementById('subjectInput');
                      const submitBtn = document.getElementById('submitBtn');

                      // Khi chọn ngày ► mở khoá chọn ca
                      daySel.addEventListener('change', () => {
                          slotSel.disabled = false;
                          slotSel.selectedIndex = 0;           // reset nếu user đổi ngày
                          subjectInp.value = '';
                          subjectInp.disabled = true;
                          submitBtn.disabled = true;
                      });

                      // Khi chọn ca ► mở khoá ô nhập môn
                      slotSel.addEventListener('change', () => {
                          subjectInp.disabled = false;
                          subjectInp.placeholder = 'Enter a subject…';
                          submitBtn.disabled = true;
                          subjectInp.value = '';
                          subjectInp.focus();
                      });

                      // Khi gõ môn học ► kích hoạt submit (nếu không trống)
                      subjectInp.addEventListener('input', () => {
                          submitBtn.disabled = subjectInp.value.trim() === '';
                      });

                      // Ngăn submit giả tạo (demo)
                      document.getElementById('register-form')
                              .addEventListener('submit', e => {
                                  e.preventDefault();
                                  // TODO: AJAX gửi dữ liệu về server
                                  alert(
                                          `Đăng ký thành công:\n• Day: ${daySel.value}\n• Slot: ${slotSel.value}\n• Subject: ${subjectInp.value}`
                                          );
                                  // reset form
                                  daySel.selectedIndex = 0;
                                  slotSel.disabled = true;
                                  subjectInp.disabled = true;
                                  submitBtn.disabled = true;
                                  slotSel.selectedIndex = 0;
                                  subjectInp.value = '';
                                  subjectInp.placeholder = 'Choose a slot first…';
                              });

                      function confirmRemove(button) {
                          if (confirm('Are you sure you want to remove this class?')) {
                              button.parentElement.parentElement.style.display = 'none';
                          }
                      }
        </script>
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <script src="<c:url value='/assets/js/material-dashboard.min.js?v=3.2.0'/>"></script>
    </body>

</html>