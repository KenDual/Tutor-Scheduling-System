
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us – Universe of Knowledge</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap"
              rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
              rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Open Sans', sans-serif
            }

            body {
                background: url('<c:url value="/assets/img/universe.jpg"/>') center/cover fixed no-repeat;
                color: #f8f9fa;
                line-height: 1.7;
                overflow-x: hidden;
                -webkit-font-smoothing: antialiased
            }
            a {
                color: inherit;
                text-decoration: none
            }
            header {
                background: rgba(0, 31, 63, .85);
                padding: 18px 24px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000
            }
            .logo {
                font-size: 26px;
                font-weight: 700;
                letter-spacing: .5px;
                text-shadow: 0 2px 6px #000
            }
            .logo span {
                color: #FFDC00
            }
            nav ul {
                list-style: none;
                display: flex;
                gap: 22px;
                margin-bottom: 0
            }
            nav a {
                padding: 8px 14px;
                border-radius: 6px;
                transition: background .3s
            }
            nav a:hover,
            nav .active {
                background: #0074D9
            }
            .hero {
                padding: 160px 20px 90px;
                text-align: center
            }

            .hero h1 {
                font-size: 48px;
                margin-bottom: 26px;
                text-shadow: 0 4px 12px #000
            }

            .hero p {
                font-size: 22px;
                max-width: 760px;
                margin: 0 auto;
                background: rgba(0, 0, 0, .45);
                padding: 14px 20px;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, .5)
            }

            /* SECTION BASE */
            section {
                padding: 70px 20px
            }

            .section-title {
                font-size: 38px;
                font-weight: 700;
                text-align: center;
                margin-bottom: 46px;
                color: #FFDC00;
                text-shadow: 0 3px 6px rgba(0, 0, 0, .6)
            }

            .section-title::after {
                content: '';
                display: block;
                width: 85px;
                height: 4px;
                background: #FFDC00;
                margin: 20px auto 0;
                border-radius: 2px
            }

            /* CARD HOVER */
            .card {
                transition: transform .3s, box-shadow .3s
            }

            .card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 22px rgba(0, 0, 0, .2)
            }

            /* TEAM CUSTOM */
            .member-card {
                background: rgba(80, 128, 165, .75);
                border: none;
            }

            .member-card img {
                width: 130px;
                height: 130px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #FFDC00;
                margin: 20 auto 14px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, .45);
            }

            .member-card h5 {
                color: #FFDC00;
                margin-bottom: 6px;
            }

            footer {
                background: #001f3f;
                padding: 22px;
                text-align: center;
                margin-top: 70px;
                font-size: 15px;
                position: relative
            }

            .spaceship {
                position: absolute;
                bottom: 12px;
                width: 52px;
                height: 52px;
                animation: fly 15s linear infinite
            }

            @keyframes fly {
                0% {
                    left: -60px
                }

                100% {
                    left: 100%
                }
            }

            @media(max-width:768px) {
                .hero h1 {
                    font-size: 34px
                }

                .hero p {
                    font-size: 18px
                }
            }
        </style>
    </head>

    <body>
        <!-- Header -->
        <header data-aos="fade-down">
            <div class="logo">Universe <span>Knowledge</span></div>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                    <li><a href="" class="active">About us</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/signup">Signup</a></li>
                </ul>
            </nav>
        </header>

        <!-- Hero -->
        <section class="hero" data-aos="fade-up">
            <h1>Online Tutor Scheduling System</h1>
            <p>"Success usually comes to those who are too busy to be looking for it." - Henry David Thoreau</p>
        </section>

        <!-- Who we are -->
        <section class="bg-dark text-light" data-aos="fade-up">
            <div class="container">
                <h2 class="section-title">Who are we?</h2>
                <p class="lead text-center">KenDual Scheduling Web is where we connect each other
                    <strong>gia sư</strong> và <strong>học viên</strong> qua lớp học ảo chất lượng cao.</p>
                <p class="text-center">Sứ mệnh của chúng tôi là mang trải nghiệm học tập cá nhân hoá đến mọi
                    nhà, xoá nhoà giới hạn không gian – thời gian.</p>
            </div>
        </section>

        <!-- Mission & Vision Cards -->
        <section class="bg-dark text-light" data-aos="fade-up">
            <div class="container">
                <h2 class="section-title">Sứ mệnh &amp; Tầm nhìn</h2>
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="card h-100 text-center shadow">
                            <div class="card-body">
                                <i class="fas fa-bullseye fa-2x text-primary mb-3"></i>
                                <h5 class="card-title fw-bold">Sứ mệnh</h5>
                                <p>Mang đến trải nghiệm học tập liền mạch, truyền cảm hứng, giúp học viên
                                    phát triển tối đa tiềm năng và gia sư toả sáng chuyên môn.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card h-100 text-center shadow">
                            <div class="card-body">
                                <i class="fas fa-eye fa-2x text-success mb-3"></i>
                                <h5 class="card-title fw-bold">Tầm nhìn</h5>
                                <p>Trở thành nền tảng dạy học online dẫn đầu Việt Nam, mở rộng ra khu vực,
                                    nơi kiến thức lan toả đến mọi người, mọi nơi.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features -->
        <section class="bg-dark text-light" data-aos="fade-up">
            <div class="container">
                <h2 class="section-title">Những giá trị chúng tôi mang lại</h2>
                <p class="lead text-center mb-5">Không chỉ là công cụ – chúng tôi kiến tạo hành trình học
                    tập.</p>
                <div class="row g-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 text-center shadow feature-card">
                            <div class="card-body">
                                <i class="fas fa-chalkboard fa-2x text-primary mb-3"></i>
                                <h6 class="card-title fw-bold">Lớp học ảo tương tác</h6>
                                <p>Bảng trắng, chia sẻ màn hình, file và chat real-time.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 text-center shadow feature-card">
                            <div class="card-body">
                                <i class="fas fa-calendar-check fa-2x text-success mb-3"></i>
                                <h6 class="card-title fw-bold">Quản lý lịch học</h6>
                                <p>Đặt lịch, nhắc nhở tự động, đồng bộ đa thiết bị.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 text-center shadow feature-card">
                            <div class="card-body">
                                <i class="fas fa-wallet fa-2x text-warning mb-3"></i>
                                <h6 class="card-title fw-bold">Thanh toán linh hoạt</h6>
                                <p>Ví điện tử, chuyển khoản, bảo mật nhiều lớp.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="card h-100 text-center shadow feature-card">
                            <div class="card-body">
                                <i class="fas fa-chart-line fa-2x text-danger mb-3"></i>
                                <h6 class="card-title fw-bold">Thống kê tiến độ</h6>
                                <p>Báo cáo điểm, mức độ hoàn thành bài tập, đánh giá.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Team -->
        <section class="bg-dark text-light" data-aos="fade-up">
            <div class="container">
                <h2 class="section-title">Đội ngũ của chúng tôi</h2>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-4 col-lg-3">
                        <div class="card member-card text-center">
                            <img src="icon/member1.jpg" class="card-img-top" alt="Mai Phú Hải">
                            <div class="card-body">
                                <h5 class="card-title">Mai Phú Hải</h5>
                                <p class="card-text">Member 1</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <div class="card member-card text-center">
                            <img src="icon/member2.png" class="card-img-top" alt="Lâm Chí Bảo">
                            <div class="card-body">
                                <h5 class="card-title">Lâm Chí Bảo</h5>
                                <p class="card-text">Member 2</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <div class="card member-card text-center">
                            <img src="icon/member3.jpg" class="card-img-top" alt="Nguyễn Thụy Hải Vân">
                            <div class="card-body">
                                <h5 class="card-title">Nguyễn Thụy Hải Vân</h5>
                                <p class="card-text">Member 3</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contact -->
        <section class="bg-dark text-white" data-aos="fade-up">
            <div class="container text-center">
                <h2 class="section-title">Contact</h2>
                <p class="lead">Email: maiphuhai123@gmail.com | Hotline: 0123 456 789 | Address: In my heart</p>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <p>©
            <fmt:formatDate value="${now}" pattern="yyyy" /> Vũ Trụ Kiến Thức. All rights reserved.
        </p>
        <img class="spaceship" src="<c:url value="/assets/img/rocket.png"/>" alt="Tàu vũ trụ">
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init({duration: 800, once: false});
    </script>
</body>
</html>