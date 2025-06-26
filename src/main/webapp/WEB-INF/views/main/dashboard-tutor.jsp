<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tutor Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body{
                font-family: Arial, sans-serif
            }
            .nav-button{
                transition:background .2s,transform .2s
            }
            .nav-button:hover{
                background:#3b82f6;
                transform:scale(1.05);
                color:#fff
            }
            .timetable{
                border-collapse:collapse;
                width:100%;
                min-width:800px;
                margin-top:1rem
            }
            .timetable th{
                background:#007bff;
                color:#fff;
                padding:.75rem;
                text-align:center;
                border:1px solid #dee2e6
            }
            .timetable td{
                border:1px solid #dee2e6;
                padding:.5rem;
                text-align:center;
                height:80px;
                vertical-align:top
            }
            .schedule-item{
                background:#fff3cd;
                padding:.25rem;
                border-radius:.25rem;
                font-size:.875rem;
                cursor:pointer;
                position:relative
            }
            .tooltip{
                display:none;
                position:absolute;
                background:#333;
                color:#fff;
                padding:.5rem;
                border-radius:.25rem;
                top:-100%;
                left:50%;
                transform:translateX(-50%);
                white-space:nowrap;
                font-size:.75rem;
                z-index:10
            }
            .schedule-item:hover .tooltip{
                display:block
            }
        </style>
    </head>
    <body class="bg-gray-100">

        <!-- ============ HEADER ============ -->
        <header class="bg-blue-600 text-white py-6">
            <div class="container mx-auto flex justify-between items-center">
                <h1 class="text-3xl font-bold">Dashboard Giáo Viên</h1>
                <div class="flex gap-2">
                    <button class="bg-green-700 px-3 py-1 rounded">Profile</button>
                    <button class="bg-green-600 px-3 py-1 rounded">Sign out</button>
                </div>
            </div>
        </header>

        <!-- ============ BODY ============ -->
        <div class="flex">

            <!-- ------ Sidebar ------ -->
            <aside class="w-64 bg-white shadow-lg p-4">
                <nav>
                    <ul>
                        <li class="mb-4"><a href="#" data-section="overview"  class="nav-button block p-3 rounded">Dashboard</a></li>
                        <li class="mb-4"><a href="#" data-section="schedule"  class="nav-button block p-3 rounded">Time table</a></li>
                        <li class="mb-4"><a href="#" data-section="assignments"class="nav-button block p-3 rounded">Exercises</a></li>
                        <li class="mb-4"><a href="#" data-section="materials"  class="nav-button block p-3 rounded">Study Materials</a></li>
                        <li class="mb-4"><a href="#" data-section="settings"   class="nav-button block p-3 rounded">Account</a></li>
                    </ul>
                </nav>
            </aside>

            <!-- ------ Main content ------ -->
            <main class="flex-1 p-8">

                <!-- ===== OVERVIEW ===== -->
                <div id="overview" class="section">
                    <h2 class="text-2xl font-bold mb-6">Overview</h2>
                </div>

                <!-- ===== SCHEDULE ===== -->
                <div id="schedule" class="section" style="display:none;">
                    <h2 class="text-2xl font-bold mb-4">Thời Khóa Biểu</h2>

                    <table class="timetable">
                        <thead>
                            <tr>
                                <th>Thời gian</th>
                                <th>Thứ 2</th>
                                <th>Thứ 3</th>
                                <th>Thứ 4</th>
                                <th>Thứ 5</th>
                                <th>Thứ 6</th>
                                <th>Thứ 7</th>
                                <th>CN</th>
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
                            <tr><td>Chiều (13-16h)</td>
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

                    <!-- ===== FORM GỬI YÊU CẦU CA HỌC ===== -->
                    <h3 class="text-xl font-bold mt-6 mb-2">Đăng ký ca học (gửi Admin duyệt)</h3>

                    <form:form action="${pageContext.request.contextPath}/sessions/request"
                               method="post"
                               modelAttribute="session"
                               cssClass="grid grid-cols-4 gap-4 mt-4">

                        <form:select path="day" cssClass="border p-2">
                            <form:option value="mon" label="Monday"/>
                            <form:option value="tue" label="Tuesday"/>
                            <form:option value="wed" label="Wednesday"/>
                            <form:option value="thu" label="Thursday"/>
                            <form:option value="fri" label="Friday"/>
                            <form:option value="sat" label="Saturday"/>
                            <form:option value="sun" label="Sunday"/>
                        </form:select>


                        <form:select path="slot" cssClass="border p-2">
                            <form:option value="1" label="Morning"/>
                            <form:option value="2" label="Afternoon"/>
                            <form:option value="3" label="Evening"/>
                        </form:select>


                        <form:select path="subject_id" cssClass="border p-2">
                            <c:forEach var="sub" items="${subjectList}">
                                <option value="${sub.subject_id}">${sub.name}</option>
                            </c:forEach>
                        </form:select>
                        <!-- Để đăng ký ca dạy gán theo tutor_id -->
                        <form:hidden path="tutor_id" value="${loggedTutorId}"/>
                        <div>
                            <label for="name" class="form-label">Location</label>
                            <form:input path="location" class="form-control" required="true"/>
                        </div>

                        <button type="submit"
                                class="bg-blue-600 text-white py-2 rounded col-span-1">
                            Gửi yêu cầu
                        </button>
                    </form:form>

                    <c:if test="${not empty flashMsg}">
                        <p class="text-green-600 mt-2">${flashMsg}</p>
                    </c:if>
                    <c:if test="${not empty flashErr}">
                        <p class="text-red-600 mt-2">${flashErr}</p>
                    </c:if>

                </div>

                <!-- ===== CÁC TAB KHÁC (statics) ===== -->
                <div id="assignments" class="section" style="display:none;">…</div>
                <div id="materials"   class="section" style="display:none;">…</div>
                <div id="settings"    class="section" style="display:none;">…</div>

            </main>
        </div>

        <footer class="bg-blue-600 text-white py-4 mt-8 text-center">
            <div class="container mx-auto text-center">
                <p>© 2025 Online Tutor Scheduling. All rights reserved.</p>
            </div>
        </footer>

        <!-- ============ SCRIPT CHUYỂN TAB ============ -->
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const nav = document.querySelectorAll("nav a");
                const sec = document.querySelectorAll(".section");
                const show = id => {
                    sec.forEach(x => x.style.display = x.id === id ? "block" : "none");
                    nav.forEach(a => {
                        const active = a.dataset.section === id;
                        a.classList.toggle("bg-blue-100", active);
                        a.classList.toggle("text-blue-600", active);
                    });
                };
                nav.forEach(a => a.addEventListener("click", e => {
                        e.preventDefault();
                        show(a.dataset.section);
                    }));
                show("overview");
            });
        </script>
    </body>
</html>
