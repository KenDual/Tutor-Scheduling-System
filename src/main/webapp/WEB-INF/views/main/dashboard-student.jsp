<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Học Sinh - Tutor Scheduling</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
            }

            .nav-button {
                transition: background-color 0.2s, transform 0.2s;
            }

            .nav-button:hover {
                background-color: #3b82f6;
                transform: scale(1.05);
                color: white;
            }

            .timetable {
                border-collapse: collapse;
                width: 100%;
                min-width: 800px;
                margin-top: 1rem;
            }

            .timetable th {
                background-color: #007bff;
                color: white;
                padding: 0.75rem;
                text-align: center;
                border: 1px solid #dee2e6;
            }

            .timetable td {
                border: 1px solid #dee2e6;
                padding: 0.5rem;
                text-align: center;
                height: 80px;
                vertical-align: top;
                position: relative;
            }

            .schedule-item {
                background-color: #fff3cd;
                padding: 0.25rem;
                border-radius: 0.25rem;
                font-size: 0.875rem;
                cursor: pointer;
                position: relative;
            }

            .schedule-item.selected {
                background-color: #d4edda;
                cursor: default;
            }

            .schedule-item.disabled {
                background-color: #e9ecef;
                cursor: not-allowed;
                opacity: 0.6;
            }

            .progress-bar {
                width: 100%;
                background-color: #e9ecef;
                border-radius: 0.25rem;
                height: 0.5rem;
                margin-top: 0.25rem;
            }

            .progress {
                height: 100%;
                background-color: #28a745;
                border-radius: 0.25rem;
                transition: width 0.3s;
            }

            .tooltip {
                display: none;
                position: absolute;
                background-color: #333;
                color: white;
                padding: 0.5rem;
                border-radius: 0.25rem;
                z-index: 10;
                top: -100%;
                left: 50%;
                transform: translateX(-50%);
                white-space: nowrap;
                font-size: 0.75rem;
            }

            .schedule-item:hover .tooltip {
                display: block;
            }
        </style>
    </head>

    <body class="bg-gray-100">
        <header class="bg-blue-600 text-white py-6 relative">
            <div class="container mx-auto flex justify-between items-center">
                <h1 class="text-3xl font-bold">Student Dashboard</h1>
                <div class="flex items-center">
                    <a href="#" class="text-white mr-4" aria-label="Thông Báo">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                        </svg>
                    </a>
                    <button
                        class="bg-green-700 text-white text-sm font-semibold py-1 px-3 rounded-lg hover:bg-green-800">Profile</button>
                    <button
                        class="bg-green-600 text-white text-sm font-semibold py-1 px-3 rounded-lg ml-2 hover:bg-green-700">Log out</button>
                </div>
            </div>
        </header>
        <div class="flex">
            <aside class="w-64 bg-white shadow-lg min-h-screen p-4">
                <nav>
                    <ul>
                        <li class="mb-4">
                            <a href="#" data-section="overview"
                               class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Dash Board</a>
                        </li>
                        <li class="mb-4">
                            <a href="#" data-section="schedule"
                               class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Timetable</a>
                        </li>
                        <li class="mb-4">
                            <a href="#" data-section="assignments"
                               class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Exercises</a>
                        </li>
                        <li class="mb-4">
                            <a href="#" data-section="materials"
                               class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Study materials</a>
                        </li>
                        <li class="mb-4">
                            <a href="#" data-section="settings"
                               class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Account</a>
                        </li>
                    </ul>
                </nav>
            </aside>
            <main class="flex-1 p-8">
                <div id="overview" style="display: block;">
                    <h2 class="text-2xl font-bold mb-6">Overview</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-blue-100 text-blue-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                         stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M7 8h10M7 12h4m-4 4h10M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold">Schedule</h3>
                                    <p class="text-2xl font-bold">3</p>
                                    <p class="text-sm text-gray-500">Up coming class</p>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-green-100 text-green-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                         stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M9 12h6m2 4H7m10-8H7m7-4h.01" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold">Exercises</h3>
                                    <p class="text-2xl font-bold">5</p>
                                    <p class="text-sm text-gray-500">Not yet submitted</p>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-yellow-100 text-yellow-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                                         stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M12 8c-3.866 0-7 3.134-7 7h14c0-3.866-3.134-7-7-7z" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h2 class="text-lg font-semibold">Average grade</h2>
                                    <p class="text-2xl font-bold">8.5</p>
                                    <p class="text-sm text-gray-500">Average semester</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="schedule" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Time table</h2>
                    <table class="timetable">
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Monday<br>09/06/2025</th>
                                <th>Tuesday<br>10/06/2025</th>
                                <th>Wednesday<br>11/06/2025</th>
                                <th>Thursday<br>12/06/2025</th>
                                <th>Friday<br>13/06/2025</th>
                                <th>Saturday<br>14/06/2025</th>
                                <th>Sunday<br>15/06/2025</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Morning (08:00-11:00)</td>
                                <td id="monMorning"></td>
                                <td id="tueMorning"></td>
                                <td id="wedMorning"></td>
                                <td id="thuMorning"></td>
                                <td id="friMorning"></td>
                                <td id="satMorning"></td>
                                <td id="sunMorning"></td>
                            </tr>
                            <tr>
                                <td>Afternoon (13:00-16:00)</td>
                                <td id="monAfternoon"></td>
                                <td id="tueAfternoon"></td>
                                <td id="wedAfternoon"></td>
                                <td id="thuAfternoon"></td>
                                <td id="friAfternoon"></td>
                                <td id="satAfternoon"></td>
                                <td id="sunAfternoon"></td>
                            </tr>
                            <tr>
                                <td>Evening (18:00-21:00)</td>
                                <td id="monEvening"></td>
                                <td id="tueEvening"></td>
                                <td id="wedEvening"></td>
                                <td id="thuEvening"></td>
                                <td id="friEvening"></td>
                                <td id="satEvening"></td>
                                <td id="sunEvening"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="assignments" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Exercise List</h2>
                    <table class="min-w-full bg-white rounded-lg shadow overflow-hidden">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="px-6 py-3 text-left">Exercise Name</th>
                                <th class="px-6 py-3 text-left">Subject</th>
                                <th class="px-6 py-3 text-left">Deadline</th>
                                <th class="px-6 py-3 text-left">Status</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-700">
                            <tr class="border-b">
                                <td class="px-6 py-4">Bài tập 1: Hình học</td>
                                <td class="px-6 py-4">Toán Học</td>
                                <td class="px-6 py-4">15/06/2025</td>
                                <td class="px-6 py-4">Chưa nộp</td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-6 py-4">Bài tập 2: Từ vựng</td>
                                <td class="px-6 py-4">Tiếng Anh</td>
                                <td class="px-6 py-4">16/06/2025</td>
                                <td class="px-6 py-4">Đã nộp</td>
                            </tr>
                            <tr>
                                <td class="px-6 py-4">Bài tập 3: Thí nghiệm</td>
                                <td class="px-6 py-4">Vật Lý</td>
                                <td class="px-6 py-4">17/06/2025</td>
                                <td class="px-6 py-4">Chưa nộp</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="materials" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Study materials</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">Math</h3>
                            <p class="text-gray-500">About...</p>
                            <a href="#" class="text-blue-600 hover:underline">Download</a>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">English</h3>
                            <p class="text-gray-500">About...</p>
                            <a href="#" class="text-blue-600 hover:underline">Download</a>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">Physics</h3>
                            <p class="text-gray-500">About...</p>
                            <a href="#" class="text-blue-600 hover:underline">Download</a>
                        </div>
                    </div>
                </div>
                <div id="settings" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Account</h2
                    <div class="bg-white shadow rounded-lg p-6">
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Full name</label>
                            <input type="text" class="w-full p-2 border rounded" placeholder="Enter your full name">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Email</label>
                            <input type="email" class="w-full p-2 border rounded" placeholder="Enter your email">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Change Password</label>
                            <input type="password" class="w-full p-2 border rounded" placeholder="New password">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Education</label>
                            <input type="text" class="w-full p-2 border rounded" placeholder="Enter your education">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Profile</label>
                            <textarea class="w-full p-2 border rounded" rows="4" cols="50"></textarea>
                        </div>
                        <button class="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700">Save</button>
                    </div>
                </div>
            </main>
        </div>
        <footer class="bg-blue-600 text-white py-4 mt-8">
            <div class="container mx-auto text-center">
                <p>© 2025 Online Tutor Scheduling. All rights reserved.</p>
            </div>
        </footer>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                console.log("JavaScript is running!");
                const navLinks = document.querySelectorAll('nav a');
                const sections = document.querySelectorAll('main > div');
                let selectedSlots = new Set();

                console.log("Found nav links:", navLinks);
                if (navLinks.length === 0) {
                    console.error("No nav links found! Check your HTML structure.");
                }

                function hideAllSections() {
                    sections.forEach(section => section.style.display = 'none');
                }

                function showSection(id) {
                    document.getElementById(id).style.display = 'block';
                }

                function setActiveLink(link) {
                    navLinks.forEach(l => l.classList.remove('bg-blue-100', 'text-blue-600'));
                    link.classList.add('bg-blue-100', 'text-blue-600');
                }

                navLinks.forEach(link => {
                    link.addEventListener('click', function (e) {
                        e.preventDefault();
                        const sectionId = this.getAttribute('data-section');
                        console.log("Clicked section:", sectionId);
                        hideAllSections();
                        showSection(sectionId);
                        setActiveLink(this);
                    });
                });

                document.querySelectorAll('.schedule-item').forEach(item => {
                    item.addEventListener('click', function (e) {
                        if (this.classList.contains('disabled') || this.classList.contains('selected'))
                            return;

                        const day = this.getAttribute('data-day');
                        const slot = this.getAttribute('data-slot');
                        const key = `${day}-${slot}`;

                                        if (selectedSlots.size >= 3) {
                                            alert('Bạn đã chọn tối đa 3 ca học trong tuần!');
                                            return;
                                        }

                                        if (selectedSlots.has(key)) {
                                            selectedSlots.delete(key);
                                            this.classList.remove('selected');
                                        } else {
                                            const dayCount = new Set([...selectedSlots].map(k => k.split('-')[0])).size;
                                            if (dayCount >= 3) {
                                                alert('Bạn chỉ được chọn tối đa 3 ngày trong tuần!');
                                                return;
                                            }
                                            selectedSlots.add(key);
                                            this.classList.add('selected');
                                        }

                                        updateDisabledSlots();
                                    });
                                });

                                function updateDisabledSlots() {
                                    const days = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
                                    const slots = ['morning', 'afternoon', 'evening'];
                                    document.querySelectorAll('.schedule-item').forEach(item => {
                                        const day = item.getAttribute('data-day');
                                        const slot = item.getAttribute('data-slot');
                                        const key = `${day}-${slot}`;
                                                        if (selectedSlots.has(key)) {
                                                            item.classList.add('selected');
                                                        } else {
                                                            item.classList.remove('selected');
                                                        }
                                                        if (selectedSlots.size >= 3 || (new Set([...selectedSlots].map(k => k.split('-')[0])).size >= 3 && !selectedSlots.has(key))) {
                                                            if (!item.classList.contains('selected')) {
                                                                item.classList.add('disabled');
                                                            }
                                                        } else {
                                                            item.classList.remove('disabled');
                                                        }
                                                    });
                                                }

                                                hideAllSections();
                                                showSection('overview');
                                                setActiveLink(document.querySelector('nav a[data-section="overview"]'));
                                                updateDisabledSlots();
                                            });
        </script>
    </body>

</html>