<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Giáo Viên - Tutor Scheduling</title>
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
            .schedule-item:hover .tooltip {
                display: block;
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
            .delete-tooltip {
                display: none;
                position: absolute;
                background-color: #333;
                color: white;
                padding: 0.5rem;
                border-radius: 0.25rem;
                z-index: 10;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                white-space: nowrap;
                font-size: 0.75rem;
                cursor: pointer;
            }
            .schedule-item:hover .delete-tooltip {
                display: block;
            }
        </style>
    </head>
    <body class="bg-gray-100">
        <header class="bg-blue-600 text-white py-6 relative">
            <div class="container mx-auto flex justify-between items-center">
                <h1 class="text-3xl font-bold">Dashboard Giáo Viên</h1>
                <div class="flex items-center">
                    <a href="#" class="text-white mr-4" aria-label="Thông Báo">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                        </svg>
                    </a>
                    <button class="bg-green-700 text-white text-sm font-semibold py-1 px-3 rounded-lg hover:bg-green-800">Profile</button>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-green-600 text-white text-sm font-semibold py-1 px-3 rounded-lg ml-2 hover:bg-green-700">Sign out</a>
                </div>
            </div>
        </header>
        <div class="flex">
            <aside class="w-64 bg-white shadow-lg min-h-screen p-4">
                <nav>
                    <ul>
                        <li class="mb-4"><a href="#" data-section="overview" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Dashboard</a></li>
                        <li class="mb-4"><a href="#" data-section="schedule" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Lịch Học</a></li>
                        <li class="mb-4"><a href="#" data-section="assignments" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Bài Tập</a></li>
                        <li class="mb-4"><a href="#" data-section="materials" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Tài Liệu Học</a></li>
                        <li class="mb-4"><a href="#" data-section="settings" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Cài Đặt</a></li>
                    </ul>
                </nav>
            </aside>
            <main class="flex-1 p-8">
                <div id="overview" style="display: block;">
                    <h2 class="text-2xl font-bold mb-6">Tổng Quan</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-blue-100 text-blue-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m-4 4h10M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold">Lớp Học</h3>
                                    <p class="text-2xl font-bold">5</p>
                                    <p class="text-sm text-gray-500">Đã đăng ký</p>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-green-100 text-green-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m2 4H7m10-8H7m7-4h.01" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold">Học Sinh</h3>
                                    <p class="text-2xl font-bold">15</p>
                                    <p class="text-sm text-gray-500">Đã đăng ký</p>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-yellow-100 text-yellow-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-3.866 0-7 3.134-7 7h14c0-3.866-3.134-7-7-7z" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h2 class="text-lg font-semibold">Đánh Giá</h2>
                                    <p class="text-2xl font-bold">4.5</p>
                                    <p class="text-sm text-gray-500">Trung bình</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="schedule" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Thời Khóa Biểu</h2>
                    <table class="timetable">
                        <thead>
                            <tr>
                                <th>Thời gian</th>
                                <th>Thứ 2<br>09/06/2025</th>
                                <th>Thứ 3<br>10/06/2025</th>
                                <th>Thứ 4<br>11/06/2025</th>
                                <th>Thứ 5<br>12/06/2025</th>
                                <th>Thứ 6<br>13/06/2025</th>
                                <th>Thứ 7<br>14/06/2025</th>
                                <th>Chủ nhật<br>15/06/2025</th>
                            </tr>
                        </thead>
                        <tbody id="timetableBody">
                            <tr>
                                <td>Sáng (08:00-11:00)</td>
                                <td id="monMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'mon' && s.slot == 1}">
                                            <div class="schedule-item" data-day="mon" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="tueMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'tue' && s.slot == 1}">
                                            <div class="schedule-item" data-day="tue" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="wedMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'wed' && s.slot == 1}">
                                            <div class="schedule-item" data-day="wed" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="thuMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'thu' && s.slot == 1}">
                                            <div class="schedule-item" data-day="thu" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="friMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'fri' && s.slot == 1}">
                                            <div class="schedule-item" data-day="fri" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="satMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'sat' && s.slot == 1}">
                                            <div class="schedule-item" data-day="sat" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <demand class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                            <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="sunMorning">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'sun' && s.slot == 1}">
                                            <div class="schedule-item" data-day="sun" data-slot="morning" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Morning</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 08:00-11:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>Chiều (13:00-16:00)</td>
                                <td id="monAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'mon' && s.slot == 2}">
                                            <div class="schedule-item" data-day="mon" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="tueAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'tue' && s.slot == 2}">
                                            <div class="schedule-item" data-day="tue" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="wedAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'wed' && s.slot == 2}">
                                            <div class="schedule-item" data-day="wed" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="thuAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'thu' && s.slot == 2}">
                                            <div class="schedule-item" data-day="thu" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="friAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'fri' && s.slot == 2}">
                                            <div class="schedule-item" data-day="fri" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="satAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'sat' && s.slot == 2}">
                                            <div class="schedule-item" data-day="sat" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="sunAfternoon">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'sun' && s.slot == 2}">
                                            <div class="schedule-item" data-day="sun" data-slot="afternoon" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Afternoon</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 13:00-16:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                            <tr>
                                <td>Tối (18:00-21:00)</td>
                                <td id="monEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'mon' && s.slot == 3}">
                                            <div class="schedule-item" data-day="mon" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="tueEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'tue' && s.slot == 3}">
                                            <div class="schedule-item" data-day="tue" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="wedEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'wed' && s.slot == 3}">
                                            <div class="schedule-item" data-day="wed" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="thuEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'thu' && s.slot == 3}">
                                            <div class="schedule-item" data-day="thu" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="friEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'fri' && s.slot == 3}">
                                            <div class="schedule-item" data-day="fri" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="satEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'sat' && s.slot == 3}">
                                            <div class="schedule-item" data-day="sat" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td id="sunEvening">
                                    <c:forEach var="s" items="${sessions}">
                                        <c:if test="${s.day_of_week == 'sun' && s.slot == 3}">
                                            <div class="schedule-item" data-day="sun" data-slot="evening" data-id="${s.id}">
                                                <span>${s.subject_id}<br>${s.tutor_id}<br>Evening</span>
                                                <div class="tooltip">Giáo viên: ${s.tutor_id}<br>Môn: ${s.subject_id}<br>Thời gian: 18:00-21:00<br>Số học sinh: ${s.studentCount}/10</div>
                                                <div class="progress-bar"><div class="progress" style="width: ${s.studentCount * 10}%;"></div></div>
                                                <div class="delete-tooltip">Xóa ca học</div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="mt-8">
                        <h3 class="text-xl font-bold mb-4">Đăng ký Lớp Học</h3>
                        <form:form action="${pageContext.request.contextPath}/sessions/register" method="post" cssClass="grid grid-cols-5 gap-4">
                            <select name="day" class="border p-2 col-span-1">
                                <option value="mon">Thứ 2</option>
                                <option value="tue">Thứ 3</option>
                                <option value="wed">Thứ 4</option>
                                <option value="thu">Thứ 5</option>
                                <option value="fri">Thứ 6</option>
                                <option value="sat">Thứ 7</option>
                                <option value="sun">Chủ nhật</option>
                            </select>
                            <select name="slot" class="border p-2 col-span-1">
                                <option value="1">Sáng (08:00-11:00)</option>
                                <option value="2">Chiều (13:00-16:00)</option>
                                <option value="3">Tối (18:00-21:00)</option>
                            </select>
                            <select name="subjectId" class="border p-2 col-span-1">
                                <c:forEach var="sub" items="${subjectList}">
                                    <option value="${sub.subject_id}">${sub.name}</option>
                                </c:forEach>
                            </select>
                            <input name="location" placeholder="Location" class="border p-2 col-span-1" required/>
                            <button class="bg-blue-600 text-white rounded col-span-1">Đăng ký lớp học</button>
                        </form:form>
                        <c:if test="${not empty msg}">
                            <p class="text-green-700 mt-3">${msg}</p>
                        </c:if>
                        <c:if test="${not empty err}">
                            <p class="text-red-600 mt-3">${err}</p>
                        </c:if>
                    </div>
                </div>
                <div id="assignments" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Danh Sách Bài Tập Đã Giao</h2>
                    <table class="min-w-full bg-white rounded-lg shadow overflow-hidden">
                        <thead class="bg-blue-600 text-white">
                            <tr>
                                <th class="px-6 py-3 text-left">Tên Bài Tập</th>
                                <th class="px-6 py-3 text-left">Môn Học</th>
                                <th class="px-6 py-3 text-left">Hạn Nộp</th>
                                <th class="px-6 py-3 text-left">Số Học Sinh Đã Nộp</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-700">
                            <tr class="border-b">
                                <td class="px-6 py-4">Bài tập 1: Hình học</td>
                                <td class="px-6 py-4">Toán</td>
                                <td class="px-6 py-4">15/06/2025</td>
                                <td class="px-6 py-4">10/15</td>
                            </tr>
                            <tr class="border-b">
                                <td class="px-6 py-4">Bài tập 2: Từ vựng</td>
                                <td class="px-6 py-4">Tiếng Anh</td>
                                <td class="px-6 py-4">16/06/2025</td>
                                <td class="px-6 py-4">12/15</td>
                            </tr>
                            <tr>
                                <td class="px-6 py-4">Bài tập 3: Thí nghiệm</td>
                                <td class="px-6 py-4">Vật Lý</td>
                                <td class="px-6 py-4">17/06/2025</td>
                                <td class="px-6 py-4">8/15</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="materials" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Tài Liệu Học</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">Tài Liệu Toán</h3>
                            <p class="text-gray-500">Bài giảng về...</p>
                            <a href="#" class="text-blue-600 hover:underline">Tải xuống</a>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">Tài Liệu Tiếng Anh</h3>
                            <p class="text-gray-500">Bài giảng về...</p>
                            <a href="#" class="text-blue-600 hover:underline">Tải xuống</a>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">Tài Liệu Vật Lý</h3>
                            <p class="text-gray-500">Bài giảng về...</p>
                            <a href="#" class="text-blue-600 hover:underline">Tải xuống</a>
                        </div>
                    </div>
                    <button class="mt-4 bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700">Upload Tài Liệu</button>
                </div>
                <div id="settings" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Cài Đặt</h2>
                    <div class="bg-white shadow rounded-lg p-6">
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Tên</label>
                            <input type="text" class="w-full p-2 border rounded" value="Tên giáo viên">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Email</label>
                            <input type="email" class="w-full p-2 border rounded" value="email@example.com">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Đổi mật khẩu</label>
                            <input type="password" class="w-full p-2 border rounded" placeholder="Mật khẩu mới">
                        </div>
                        <button class="bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700">Lưu</button>
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
                const navLinks = document.querySelectorAll('nav a');
                const sections = document.querySelectorAll('main > div');

                // Hàm ẩn tất cả các section
                function hideAllSections() {
                    sections.forEach(section => section.style.display = 'none');
                }

                // Hàm hiển thị section theo ID
                function showSection(id) {
                    const section = document.getElementById(id);
                    console.log('Showing section:', id, section); // Debug: Kiểm tra section được hiển thị
                    if (section) {
                        section.style.display = 'block';
                    } else {
                        console.error('Section not found:', id); // Debug: Báo lỗi nếu section không tồn tại
                    }
                }

                // Hàm đặt link đang hoạt động
                function setActiveLink(link) {
                    navLinks.forEach(l => l.classList.remove('bg-blue-100', 'text-blue-600'));
                    link.classList.add('bg-blue-100', 'text-blue-600');
                }

                // Xử lý sự kiện click cho các nav link
                navLinks.forEach(link => {
                    link.addEventListener('click', function (e) {
                        e.preventDefault();
                        const sectionId = this.getAttribute('data-section');
                        console.log('Clicked on:', sectionId); // Debug: Kiểm tra link được click
                        hideAllSections();
                        showSection(sectionId);
                        setActiveLink(this);
                    });
                });

                // Xử lý xóa ca học
                document.querySelectorAll('.schedule-item').forEach(item => {
                    item.addEventListener('contextmenu', (e) => {
                        e.preventDefault();
                        if (confirm('Bạn có muốn xóa ca học?')) {
                            const id = item.getAttribute('data-id');
                            fetch(`${pageContext.request.contextPath}/sessions/delete/${id}`, {method: 'DELETE'})
                                                        .then(response => {
                                                            if (response.ok) {
                                                                item.parentElement.removeChild(item); // Xóa phần tử khỏi DOM nếu thành công
                                                            } else {
                                                                alert('Xóa thất bại');
                                                            }
                                                        })
                                                        .catch(() => alert('Lỗi khi xóa ca học')); // Báo lỗi nếu fetch thất bại
                                            }
                                        });
                                    });

                                    // Khởi tạo trạng thái ban đầu
                                    hideAllSections();
                                    showSection('overview');
                                    setActiveLink(document.querySelector('nav a[data-section="overview"]'));
                                });
        </script>
    </body>
</html>