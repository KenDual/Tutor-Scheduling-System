
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Tutor Scheduling</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background: linear-gradient(135deg, #e0f7fa 0%, #f0f4f8 100%);
                min-height: 100vh;
                margin: 0;
            }
            .header {
                background: linear-gradient(90deg, #1e40af, #3b82f6);
                padding: 2rem 0;
                position: relative;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            .header h1 {
                font-size: 2.5rem;
                font-weight: bold;
                color: white;
                text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
            }
            .header p {
                color: #e0f2fe;
                font-size: 1.1rem;
            }
            .login-buttons {
                position: absolute;
                top: 1.5rem;
                right: 2rem;
            }
            .login-buttons a {
                padding: 0.5rem 1rem;
                border-radius: 0.375rem;
                transition: background-color 0.3s, transform 0.2s;
            }
            .login-buttons a:hover {
                transform: scale(1.05);
            }
            .intro-section {
                padding: 4rem 2rem;
                text-align: center;
                background: url('https://source.unsplash.com/1600x900/?classroom') no-repeat center/cover;
                color: white;
                position: relative;
            }
            .intro-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 0;
            }
            .intro-section > * {
                position: relative;
                z-index: 1;
            }
            .intro-section h2 {
                font-size: 2.25rem;
                font-weight: bold;
                margin-bottom: 1.5rem;
            }
            .intro-section p {
                font-size: 1.125rem;
                max-width: 700px;
                margin: 0 auto 2rem;
            }
            .service-section, .exercise-section {
                padding: 4rem 2rem;
                text-align: center;
            }
            .service-section h3, .exercise-section h3 {
                font-size: 1.875rem;
                font-weight: bold;
                margin-bottom: 2rem;
                color: #1e40af;
            }
            .service-section p, .exercise-section p {
                font-size: 1.125rem;
                color: #4b5563;
                max-width: 800px;
                margin: 0 auto 2rem;
            }
            .service-buttons {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1.5rem;
                max-width: 800px;
                margin: 0 auto;
            }
            .service-button {
                background-color: #93c5fd;
                color: white;
                padding: 1rem;
                border-radius: 0.5rem;
                font-weight: semibold;
                transition: transform 0.2s, background-color 0.2s;
            }
            .service-button:hover {
                transform: scale(1.05);
                background-color: #60a5fa;
            }
            #service-info {
                margin-top: 1.5rem;
                color: #374151;
                max-width: 800px;
                margin-left: auto;
                margin-right: auto;
            }
            footer {
                background: linear-gradient(90deg, #1e40af, #3b82f6);
                padding: 1.5rem 0;
                color: white;
                text-align: center;
            }
        </style>
    </head>

    <body>
        <!-- Header -->
        <header class="header">
            <div class="container mx-auto text-center relative">
                <h1>Online Tutor Scheduling</h1>
                <p class="mt-2">An online learning platform for students and teachers</p>
                <div class="login-buttons">
                    <a href="/MVCEnvironment/login" class="bg-green-700 text-white text-sm font-semibold py-1 px-3 rounded-lg hover:bg-green-800 mr-2">Login</a>
                    <a href="/MVCEnvironment/signup" class="bg-green-600 text-white text-sm font-semibold py-1 px-3 rounded-lg hover:bg-green-700">Sign Up</a>
                </div>
            </div>
        </header>

        <!-- Introduction Section -->
        <section class="intro-section">
            <div class="container mx-auto">
                <h2 class="text-3xl font-bold mb-4">Welcome to Our Platform</h2>
                <p class="text-lg mb-6">
                    Online Tutor Scheduling provides a comprehensive online learning platform for both students and teachers.
                    With a variety of exercises, quizzes, and support services, we make learning easier and more effective.
                </p>
            </div>
        </section>

        <!-- Exercises Section -->
        <section class="exercise-section">
            <div class="container mx-auto">
                <h3 class="text-2xl font-semibold mb-6">Exercises</h3>
                <p class="text-lg mb-6">
                    We provide practice exercises to help students reinforce knowledge and develop skills.
                    Teachers can use these exercises to assess and evaluate student progress effectively.
                </p>
            </div>
        </section>

        <!-- Services Section -->
        <section class="service-section">
            <div class="container mx-auto">
                <h3 class="text-2xl font-semibold mb-6">Services</h3>
                <div class="service-buttons">
                    <button class="service-button" onclick="showService('Contact Us')">Contact Us</button>
                </div>
                <div id="service-info" class="text-center mt-6"></div>
            </div>
        </section>

        <!-- Footer -->
        <footer>
            <div class="container mx-auto">
                <p>© 2025 Online Tutor Scheduling. All rights reserved.</p>
            </div>
        </footer>

        <script>
            // Service information with additional details
            const services = {
                'Login/Sign Up': 'Access personalized features for students and teachers with your account.\nCreate a free account to improve your learning experience.',
                'Exercises': 'Practice with a wide range of exercises tailored to each subject.\nReview your knowledge.',
                'Quizzes': 'Test your knowledge and track progress with interactive quizzes.\nTest yourself with multiple choice questions.',
                'Contact Us': 'Reach out for support or inquiries with our dedicated team.\nPhone: 0987654321\nEmail: Jipoo@gmail.com\nEmail: Puhigh@gmail.com\nEmail: Hivant@gmail.com'
            };

            // Show service details
            function showService(service) {
                const serviceInfo = document.getElementById('service-info');
                const text = services[service] || `You selected ${service}.`;
                serviceInfo.innerHTML = text.replace(/\n/g, '<br>'); // Replace newlines with <br> for HTML rendering
            }
        </script>
    </body>

</html>