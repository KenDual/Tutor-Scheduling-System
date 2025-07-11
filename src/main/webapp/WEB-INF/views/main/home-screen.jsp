<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trung Tâm Gia Sư - Vũ Trụ Kiến Thức</title>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Open Sans', sans-serif;
            }
            body {
                background: url('<c:url value="/assets/img/universe.jpg"/>') no-repeat center center fixed;
                background-size: cover;
                color: #FFFFFF;
                line-height: 1.6;
                position: relative;
                overflow-x: hidden;
            }
            /* Header */
            header {
                background: rgba(0, 31, 63, 0.8);
                padding: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000;
            }
            .logo {
                font-size: 24px;
                font-weight: bold;
            }
            .logo span {
                color: #FFDC00;
            }
            nav ul {
                list-style: none;
                display: flex;
                gap: 20px;
            }
            nav a {
                color: #FFFFFF;
                text-decoration: none;
                font-size: 16px;
                padding: 10px;
                border-radius: 5px;
                transition: background 0.3s;
            }
            nav a:hover {
                background: #0074D9;
            }
            .hero {
                text-align: center;
                padding: 150px 20px;
                background: transparent;
                position: relative;
                color: #FFFFFF;
            }
            .hero::before {
                content: none;
            }
            .hero>* {
                position: relative;
                z-index: 2;
            }

            .hero h1 {
                font-size: 48px;
                margin-bottom: 20px;
                text-shadow: 0 0 10px rgba(255, 255, 255, 0.8), 2px 2px 4px #000000;
            }
            .hero p {
                font-size: 24px;
                margin-bottom: 30px;
            }
            .hero .btn {
                background: #FFDC00;
                color: #001f3f;
                padding: 15px 30px;
                text-decoration: none;
                border-radius: 5px;
                font-size: 18px;
                font-weight: bold;
                transition: transform 0.3s, box-shadow 0.3s;
                box-shadow: 0 0 10px rgba(255, 220, 0, 0.8);
            }
            .hero .btn:hover {
                transform: scale(1.05);
                box-shadow: 0 0 15px rgba(255, 220, 0, 1);
            }
            .services {
                padding: 50px 20px;
                text-align: center;
                background-color: transparent;
            }
            .services h2 {
                font-size: 36px;
                margin-bottom: 40px;
            }
            .service-grid {
                display: flex;
                justify-content: center;
                gap: 30px;
                flex-wrap: wrap;
            }
            .service {
                width: 25%;
                min-width: 200px;
                padding: 20px;
                background: rgba(80, 128, 165, 0.568);
                border-radius: 10px;
            }
            .service img {
                width: 80px;
                height: 80px;
            }
            .service h3 {
                font-size: 30px;
                margin: 15px 0;
            }
            .testimonials {
                padding: 50px 20px;
                text-align: center;
            }
            .testimonials h2 {
                font-size: 36px;
                margin-bottom: 40px;
            }
            .testimonial {
                display: inline-block;
                width: 30%;
                min-width: 250px;
                padding: 20px;
                background: rgba(80, 128, 165, 0.568);
                border-radius: 10px;
                margin: 10px;
                position: relative;
            }
            .testimonial p {
                font-style: italic;
            }
            footer {
                background: #001f3f;
                padding: 20px;
                text-align: center;
                position: relative;
            }
            .spaceship {
                position: absolute;
                bottom: 10px;
                width: 50px;
                height: 50px;
                animation: fly 15s linear infinite;
            }
            @keyframes fly {
                0% {
                    left: -50px;
                }
                100% {
                    left: 100%;
                }
            }
            .star {
                position: absolute;
                width: 2px;
                height: 2px;
                background: #FFFFFF;
                border-radius: 50%;
                animation: twinkle 2s infinite;
            }
            @keyframes twinkle {
                0%,
                100% {
                    opacity: 1;
                }

                50% {
                    opacity: 0.3;
                }
            }
            @media (max-width: 768px) {
                .hero h1 {
                    font-size: 32px;
                }

                .hero p {
                    font-size: 18px;
                }

                .service {
                    width: 45%;
                }

                .testimonial {
                    width: 80%;
                }

                nav ul {
                    flex-direction: column;
                    align-items: center;
                }
            }
        </style>
    </head>

    <body>
        <!-- Twinkling Stars -->
        <div class="star" style="top: 10%; left: 20%;"></div>
        <div class="star" style="top: 30%; left: 70%;"></div>
        <div class="star" style="top: 50%; left: 40%;"></div>

        <!-- Header -->
        <header>
            <div class="logo">Universe <span>Knowledge</span></div>
            <nav>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/about-us">About us</a></li>
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/signup">Signup</a></li>
                </ul>
            </nav>
        </header>

        <!-- Hero Section -->
        <main>
            <section class="hero">
                <h1>Explore the knowledge universe</h1>
                <p>Your journney begins here</p>
                <a href="${pageContext.request.contextPath}/signup" class="btn">Register now</a>
            </section>

            <!-- Services Section -->
            <section class="services">
                <h2>Our service</h2>
                <div class="service-grid">
                    <div class="service">
                        <img src="<c:url value='/assets/img/science.png'/>" alt="Science">
                        <h3>Science travel</h3>
                        <p>Discover the mysteries of the universe</p>
                    </div>
                    <div class="service">
                        <img src="<c:url value='/assets/img/math.png'/>" alt="Math">
                        <h3>Conquer mathematics</h3>
                        <p>Plan for the stars</p>
                    </div>
                    <div class="service">
                        <img src="<c:url value='/assets/img/language.png'/>" alt="Language">
                        <h3>Discover language</h3>
                        <p>Communicate with planets</p>
                    </div>
                </div>
            </section>

            <!-- Testimonials Section -->
            <section class="testimonials">
                <h2>Our first priorities</h2>
                <div class="testimonial">
                    <p>“Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.”</p>
                    <p>― Roy T. Bennett, The Light in the Heart ―</p>
                </div>
                <div class="testimonial">
                    <p>“When we are no longer able to change a situation, we are challenged to change ourselves.”</p>
                    <p>― Viktor E. Frankl, Man's Search for Meaning ―</p>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer>
            <p>Contact: info@vutrukienthuc.com | 0123-456-789</p>
            <img class="spaceship" src="<c:url value='/assets/img/rocket.png'/>" alt="Tàu vũ trụ">
        </footer>
    </body>
</html>