<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Teacher - Tutor Scheduling</title>
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
                    <button class="bg-green-600 text-white text-sm font-semibold py-1 px-3 rounded-lg ml-2 hover:bg-green-700">Sign out</button>
                </div>
            </div>
        </header>
        <div class="flex">
            <aside class="w-64 bg-white shadow-lg min-h-screen p-4">
                <nav>
                    <ul>
                        <li class="mb-4"><a href="#" data-section="overview" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Dashboard</a></li>
                        <li class="mb-4"><a href="#" data-section="schedule" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Time table</a></li>
                        <li class="mb-4"><a href="#" data-section="assignments" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Exercises</a></li>
                        <li class="mb-4"><a href="#" data-section="materials" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Study Materials</a></li>
                        <li class="mb-4"><a href="#" data-section="settings" class="block nav-button p-3 rounded-lg text-gray-700 font-medium hover:bg-blue-100">Account</a></li>
                    </ul>
                </nav>
            </aside>
            <main class="flex-1 p-8">
                <div id="overview" class="section" style="display: block;">
                    <h2 class="text-2xl font-bold mb-6">Overview</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-blue-100 text-blue-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m-4 4h10M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold">Class</h3>
                                    <p class="text-2xl font-bold">5</p>
                                    <p class="text-sm text-gray-500">Registered</p>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white shadow rounded-lg p-6">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-green-100 text-green-600 rounded-full p-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24 " stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m2 4H7m10-8H7m7-4h.01" />
                                    </svg>
                                </div>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold">Student</h3>
                                    <p class="text-2xl font-bold">15</p>
                                    <p class="text-sm text-gray-500">Registered</p>
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
                <div id="schedule" class="section" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Thời Khóa Biểu</h2>
                    <table class="timetable">
                        <thead>
                            <tr>
                                <th>Thời gian</th>
                                <th>Thứ 2</th><th>Thứ 3</th><th>Thứ 4</th>
                                <th>Thứ 5</th><th>Thứ 6</th><th>Thứ 7</th><th>CN</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Sáng (08-11h)</td>
                                <td id="monMorning"></td>
                                <td id="tueMorning"></td>
                                <td id="wedMorning"></td>
                                <td id="thuMorning"></td>
                                <td id="friMorning"></td>
                                <td id="satMorning"></td>
                                <td id="sunMorning"></td>
                            </tr>
                            <tr>
                                <td>Chiều (13-16h)</td>
                                <td id="monAfternoon"></td>
                                <td id="tueAfternoon"></td>
                                <td id="wedAfternoon"></td>
                                <td id="thuAfternoon"></td>
                                <td id="friAfternoon"></td>
                                <td id="satAfternoon"></td>
                                <td id="sunAfternoon"></td>
                            </tr>
                            <tr>
                                <td>Tối (18-21h)</td>
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
                    <form id="addForm" class="grid grid-cols-4 gap-4 mt-8">
                        <select id="daySel" name="day" class="border p-2">
                            <option value="mon">Thứ 2</option>
                            <option value="tue">Thứ 3</option>
                            <option value="wed">Thứ 4</option>
                            <option value="thu">Thứ 5</option>
                            <option value="fri">Thứ 6</option>
                            <option value="sat">Thứ 7</option>
                            <option value="sun">Chủ Nhật</option>
                        </select>
                        <select id="slotSel" name="slot" class="border p-2">
                            <option value="morning">Sáng</option>
                            <option value="afternoon">Chiều</option>
                            <option value="evening">Tối</option>
                        </select>
                        <select id="subjectSel" name="subjectId" class="border p-2">
                            <c:forEach var="sub" items="${subjectList}">
                                <option value="${sub.subjectId}">${sub.name}</option>
                            </c:forEach>
                        </select>
                        <button id="addBtn" type="button" class="bg-blue-600 text-white py-2 rounded">Thêm ca học</button>
                    </form>
                </div>
                <div id="assignments" class="section" style="display: none;">
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
                        </tbody>
                    </table>
                </div>
                <div id="materials" class="section" style="display: none;">
                    <h2 class="text-2xl font-bold mb-4">Tài Liệu Học</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-white shadow rounded-lg p-6">
                            <h3 class="text-lg font-semibold">Tài Liệu Toán</h3>
                            <p class="text-gray-500">Bài giảng về...</p>
                            <a href="#" class="text-blue-600 hover:underline">Tải xuống</a>
                        </div>
                    </div>
                    <button class="mt-4 bg-blue-600 text-white py-2 px-4 rounded hover:bg-blue-700">Upload Tài Liệu</button>
                </div>
                <div id="settings" class="section" style="display: none;">
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
            /* ============================================================
             * 1. Biến toàn cục lấy từ JSP
             * ========================================================== */
            const ctx = "${pageContext.request.contextPath}";   //  "/MVCEnvironment" hoặc ""
            const loggedTutorId = ${loggedTutorId};

            /* ============================================================
             * 2. Trợ giúp TKB
             * ========================================================== */
            const makeCellId = (d, s) => d + s[0].toUpperCase() + s.slice(1);

            function buildSessionDiv(s) {
                const div = document.createElement("div");
                div.className = "schedule-item";
                div.dataset.id = s.sessionId;
                div.innerHTML = `
        <span>${s.subjectName}<br/>${s.tutorName}<br/>${s.slot}</span>
        <div class="tooltip">GV: ${s.tutorName}<br/>Số HS: ${s.booked}/${s.capacity}</div>
        <div class="progress-bar"><div class="progress" style="width:${s.capacity? s.booked*100/s.capacity:0}%"></div></div>
        <div class="delete-tooltip">Xóa</div>
    `;

                /* ─── xoá ─── */
                div.querySelector(".delete-tooltip").addEventListener("click", async e => {
                    e.stopPropagation();
                    if (!confirm("Xóa ca học?"))
                        return;
                    const res = await fetch(`${ctx}/sessions/delete/${s.sessionId}`, {method: "POST"});
                                if (res.ok)
                                    div.parentElement.innerHTML = "";
                                else
                                    alert("Xóa không thành công!");
                            });
                            return div;
                        }

                        function renderSession(s) {
                            const cell = document.getElementById(makeCellId(s.day, s.slot));
                            if (!cell)
                                return;
                            cell.innerHTML = "";
                            cell.appendChild(buildSessionDiv(s));
                        }

                        /* ============================================================
                         * 3. DOM ready
                         * ========================================================== */
                        document.addEventListener("DOMContentLoaded", () => {

                            /* ---- a. Chuyển tab ---- */
                            const nav = document.querySelectorAll("nav a");
                            const sec = document.querySelectorAll(".section");
                            const show = id => {
                                sec.forEach(x => x.style.display = x.id === id ? "block" : "none");
                                nav.forEach(a => {
                                    const act = a.dataset.section === id;
                                    a.classList.toggle("bg-blue-100", act);
                                    a.classList.toggle("text-blue-600", act);
                                });
                            };
                            nav.forEach(a => a.addEventListener("click", e => {
                                    e.preventDefault();
                                    show(a.dataset.section);
                                }));
                            show("overview");

                            /* ---- b. Render dữ liệu server ---- */
            <c:forEach var="s" items="${sessionList}">
                            renderSession({
                                sessionId:${s.sessionId}, tutorId:${s.tutorId}, subjectId:${s.subjectId},
                                day: "${s.day}", slot: "${s.slot}",
                                location: "${s.location}", fee:${s.fee}, capacity:${s.capacity}, status: "${s.status}",
                                tutorName: "${s.tutorName}", subjectName: "${s.subjectName}", booked:${s.booked}
                            });
            </c:forEach>

                            /* ---- c. Thêm ca học ---- */
                            document.getElementById("addBtn").addEventListener("click", async () => {
                                const payload = {
                                    tutorId: loggedTutorId,
                                    subjectId: +document.getElementById("subjectSel").value,
                                    day: document.getElementById("daySel").value,
                                    slot: document.getElementById("slotSel").value,
                                    location: null,
                                    fee: 0,
                                    capacity: 10,
                                    status: "scheduled"
                                };

                                try {
                                    const res = await fetch(`${ctx}/sessions/add`, {
                                        method: 'POST',
                                        headers: {'Content-Type': 'application/json'},
                                        body: JSON.stringify(payload)
                                    });

                                    if (res.status === 409) {
                                        alert("Đã có ca học này!");
                                        return;
                                    }
                                    if (!res.ok) {
                                        alert(`Thêm thất bại [${res.status}]`);
                                        return;
                                    }

                                    const saved = await res.json();
                                    renderSession(saved);
                                } catch (e) {
                                    console.error(e); alert("Lỗi mạng!");
                                }
                            });
                        });
        </script>


    </body>
</html>