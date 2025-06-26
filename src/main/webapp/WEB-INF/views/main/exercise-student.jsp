<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <title>Exercise</title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700,900" />
        <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@24,400,0,0" />
        <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.2.0" rel="stylesheet" />
        <style>
            .card-header {
                background: linear-gradient(90deg, #4e73df, #224abe);
                color: white;
            }

            .table th,
            .table td {
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
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-radius-lg fixed-start ms-2 bg-white my-2"
               id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-dark opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
                   aria-hidden="true" id="iconSidenav"></i>
                <a class="navbar-brand px-4 py-3 m-0" href="https://github.com/KenDual/Tutor-Scheduling-System" target="_blank">
                    <img src="../assets/img/logo-ct-dark.png" class="navbar-brand-img" width="26" height="26" alt="main_logo">
                    <span class="ms-1 text-sm text-dark">Scheduling System</span>
                </a>
            </div>
            <hr class="horizontal dark mt-0 mb-2">
            <div class="collapse navbar-collapse w-auto" id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="../pages/dashboard.html">
                            <i class="material-symbols-rounded opacity-5">dashboard</i>
                            <span class="nav-link-text ms-1">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="../pages/timetable.html">
                            <i class="material-symbols-rounded opacity-5">table_view</i>
                            <span class="nav-link-text ms-1">Timetable</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active bg-gradient-dark text-white" href="../pages/exercise.html">
                            <i class="material-symbols-rounded opacity-5">table_view</i>
                            <span class="nav-link-text ms-1">Exercise</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="../pages/study-material.html">
                            <i class="material-symbols-rounded opacity-5">notifications</i>
                            <span class="nav-link-text ms-1">Study material</span>
                        </a>
                    </li>
                    <li class="nav-item mt-3">
                        <h6 class="ps-4 ms-2 text-uppercase text-xs text-dark font-weight-bolder opacity-5">Account pages</h6>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="../pages/profile.html">
                            <i class="material-symbols-rounded opacity-5">person</i>
                            <span class="nav-link-text ms-1">Profile</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="../pages/log-in.html">
                            <i class="material-symbols-rounded opacity-5">login</i>
                            <span class="nav-link-text ms-1">Log out</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="sidenav-footer position-absolute w-100 bottom-0">
                <div class="mx-3">
                    <a class="btn btn-outline-dark mt-4 w-100"
                       href="https://www.creative-tim.com/learning-lab/bootstrap/overview/material-dashboard?ref=sidebarfree"
                       type="button">Documentation</a>
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
                            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Student Dashboard</li>
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
                                <a href="../pages/sign-in.html" class="nav-link text-body font-weight-bold px-0">Login</a>
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
                                    <h6 class="text-white text-capitalize ps-3">Exercice</h6>
                                </div>
                            </div>
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                    <table class="table align-items-center mb-0" id="exerciseTable">
                                        <thead>
                                            <tr>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Tên bài t?p</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Gi?ng viên
                                                </th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Deadline</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">T?i bài t?p
                                                </th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">N?p bài t?p
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="exerciseTableBody">
                                            <tr>
                                                <td>
                                                    <h6 class="mb-0 text-sm">Bài t?p toán ch??ng 1</h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 text-sm">Lâm Chí B?o</h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 text-sm">2025-06-29T12:00</h6>
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-success" onclick="downloadExercise(1)">T?i xu?ng</button>
                                                </td>
                                                <td>
                                                    <input type="file" class="form-control form-control-sm" id="submissionFile1">
                                                    <button class="btn btn-sm btn-primary mt-1" onclick="submitExercise(1)">N?p</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <h6 class="mb-0 text-sm">Bài t?p toán ch??ng 2</h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 text-sm">Lâm Chí B?o</h6>
                                                </td>
                                                <td>
                                                    <h6 class="mb-0 text-sm">2025-07-01T14:00</h6>
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-success" onclick="downloadExercise(2)">T?i xu?ng</button>
                                                </td>
                                                <td>
                                                    <input type="file" class="form-control form-control-sm" id="submissionFile2">
                                                    <button class="btn btn-sm btn-primary mt-1" onclick="submitExercise(2)">N?p</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="submittedExercises" class="mt-3"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Core JS Files -->
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script src="../assets/js/material-dashboard.min.js?v=3.2.0"></script>
        <script>
                                  let exerciseCount = 2;

                                  function downloadExercise(rowId) {
                                      const exerciseName = document.querySelector(`#exerciseTableBody tr:nth-child(${rowId}) td:first-child h6`).textContent;
                                      alert(`?ang t?i file cho ${exerciseName}. (Tính n?ng mô ph?ng, file m?u không th?c s? t?i xu?ng)`);
                                      // ? ?ây b?n có th? thêm logic t?i file th?c t? n?u có server
                                  }

                                  function submitExercise(rowId) {
                                      const fileInput = document.getElementById(`submissionFile${rowId}`);
                                      const submittedExercisesDiv = document.getElementById('submittedExercises');
                                      const exerciseName = document.querySelector(`#exerciseTableBody tr:nth-child(${rowId}) td:first-child h6`).textContent;

                                      if (fileInput.files.length === 0) {
                                          alert("Vui lòng ch?n file ?? n?p!");
                                          return;
                                      }

                                      const fileName = fileInput.files[0].name;
                                      const submissionTime = new Date().toLocaleString('vi-VN', {timeZone: 'Asia/Ho_Chi_Minh'});

                                      const submissionInfo = `
              <div class="alert alert-success submitted-item" role="alert">
                <strong>N?p bài thành công!</strong><br>
                Tên bài t?p: ${exerciseName}<br>
                File n?p: ${fileName}<br>
                Th?i gian n?p: ${submissionTime}
              </div>
            `;

                                      submittedExercisesDiv.innerHTML += submissionInfo;

                                      // Reset input
                                      fileInput.value = '';
                                  }
        </script>
    </body>

</html>