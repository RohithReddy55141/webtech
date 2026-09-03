<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-system="about:blank" indent="yes"/>

    <xsl:template match="/">
        <html lang="en" data-theme="dark">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Saveetha University | Course Analytics &amp; Enrollment Hub</title>
                
                <!-- Google Fonts & Font Awesome Icons -->
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="crossorigin"/>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&amp;family=Outfit:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
                
                <!-- Linked Stylesheet -->
                <link rel="stylesheet" type="text/css" href="style (2).css"/>
            </head>
            <body>
                <!-- Ambient Background Glowing Blobs -->
                <div class="ambient-blob blob-1"></div>
                <div class="ambient-blob blob-2"></div>
                <div class="ambient-blob blob-3"></div>

                <div class="app-container">
                    
                    <!-- ================= TOP NAVIGATION BAR ================= -->
                    <nav class="top-nav">
                        <div class="nav-brand">
                            <div class="brand-icon">
                                <i class="fa-solid fa-graduation-cap"></i>
                            </div>
                            <div class="brand-text">
                                <span class="brand-title">SAVEETHA</span>
                                <span class="brand-subtitle">ACADEMIC ANALYTICS</span>
                            </div>
                        </div>

                        <div class="nav-status">
                            <span class="pulse-indicator"></span>
                            <span class="status-text">XSLT 2.0 Engine Active</span>
                        </div>

                        <div class="nav-actions">
                            <button id="themeToggleBtn" class="glass-btn icon-btn" title="Toggle Light/Dark Theme" onclick="toggleTheme()">
                                <i class="fa-solid fa-moon" id="themeIcon"></i>
                            </button>
                        </div>
                    </nav>


                    <!-- ================= HERO SECTION ================= -->
                    <header class="hero-section">
                        <div class="hero-content">
                            <div class="hero-badge">
                                <i class="fa-solid fa-chart-line"></i> Semester Enrollment Overview
                            </div>
                            <h1>Course Enrollment &amp; Capacity Intelligence</h1>
                            <p>Real-time interactive course analytics dashboard transformed dynamically from structured XML data.</p>
                        </div>
                    </header>


                    <!-- ================= KPI METRICS DASHBOARD ================= -->
                    <section class="kpi-grid">
                        
                        <div class="kpi-card">
                            <div class="kpi-icon icon-blue">
                                <i class="fa-solid fa-user-graduate"></i>
                            </div>
                            <div class="kpi-data">
                                <span class="kpi-label">Total Students Enrolled</span>
                                <h2 id="kpiTotalStudents">0</h2>
                                <span class="kpi-subtext"><i class="fa-solid fa-arrow-trend-up"></i> Across selected courses</span>
                            </div>
                        </div>

                        <div class="kpi-card">
                            <div class="kpi-icon icon-purple">
                                <i class="fa-solid fa-book-bookmark"></i>
                            </div>
                            <div class="kpi-data">
                                <span class="kpi-label">Active Courses</span>
                                <h2 id="kpiTotalCourses">0</h2>
                                <span class="kpi-subtext">Theory &amp; Practical modules</span>
                            </div>
                        </div>

                        <div class="kpi-card">
                            <div class="kpi-icon icon-emerald">
                                <i class="fa-solid fa-chart-pie"></i>
                            </div>
                            <div class="kpi-data">
                                <span class="kpi-label">Avg Capacity Occupancy</span>
                                <h2 id="kpiAvgFill">0%</h2>
                                <span class="kpi-subtext">Seat allocation efficiency</span>
                            </div>
                        </div>

                        <div class="kpi-card">
                            <div class="kpi-icon icon-amber">
                                <i class="fa-solid fa-fire-flame-curved"></i>
                            </div>
                            <div class="kpi-data">
                                <span class="kpi-label">High Enrollment (&gt;40)</span>
                                <h2 id="kpiHighEnrollment">0</h2>
                                <span class="kpi-subtext">High-demand subject ratio</span>
                            </div>
                        </div>

                    </section>


                    <!-- ================= INTERACTIVE TOOLBAR ================= -->
                    <section class="controls-toolbar">
                        
                        <!-- Search Box -->
                        <div class="search-box">
                            <i class="fa-solid fa-magnifying-glass search-icon"></i>
                            <input type="text" id="searchInput" placeholder="Search by course code, name, faculty, or department..." oninput="filterAndRender()"/>
                            <button id="clearSearchBtn" class="clear-search-btn" onclick="clearSearch()" style="display: none;">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>

                        <!-- Filter Pills -->
                        <div class="filter-pills">
                            <button class="pill-btn active" data-filter="all" onclick="setFilter('all', this)">
                                <i class="fa-solid fa-layer-group"></i> All Courses
                            </button>
                            <button class="pill-btn" data-filter="Theory" onclick="setFilter('Theory', this)">
                                <i class="fa-solid fa-book-open"></i> Theory
                            </button>
                            <button class="pill-btn" data-filter="Practical" onclick="setFilter('Practical', this)">
                                <i class="fa-solid fa-flask"></i> Practical
                            </button>
                            <button class="pill-btn" data-filter="high" onclick="setFilter('high', this)">
                                <i class="fa-solid fa-bolt"></i> High Demand (&gt;40)
                            </button>
                        </div>

                        <!-- View Switcher Toggle -->
                        <div class="view-switcher">
                            <button id="btnTableView" class="view-btn active" onclick="setViewMode('table')" title="Table View">
                                <i class="fa-solid fa-table-cells"></i>
                            </button>
                            <button id="btnCardsView" class="view-btn" onclick="setViewMode('cards')" title="Cards Grid View">
                                <i class="fa-solid fa-grip"></i>
                            </button>
                        </div>

                    </section>


                    <!-- ================= MAIN DATA SECTION ================= -->
                    <main class="data-content">
                        
                        <!-- TABLE VIEW CONTAINER -->
                        <div id="tableViewContainer" class="view-container active">
                            <div class="glass-card table-card">
                                <div class="table-responsive">
                                    <table id="coursesTable">
                                        <thead>
                                            <tr>
                                                <th onclick="sortTable(0, 'string')" class="sortable">
                                                    Course Code <i class="fa-solid fa-sort sort-icon"></i>
                                                </th>
                                                <th onclick="sortTable(1, 'string')" class="sortable">
                                                    Course Name <i class="fa-solid fa-sort sort-icon"></i>
                                                </th>
                                                <th onclick="sortTable(2, 'string')" class="sortable">
                                                    Department &amp; Faculty <i class="fa-solid fa-sort sort-icon"></i>
                                                </th>
                                                <th onclick="sortTable(3, 'number')" class="sortable">
                                                    Enrollment &amp; Seats <i class="fa-solid fa-sort sort-icon"></i>
                                                </th>
                                                <th onclick="sortTable(4, 'number')" class="sortable">
                                                    Credits <i class="fa-solid fa-sort sort-icon"></i>
                                                </th>
                                                <th onclick="sortTable(5, 'string')" class="sortable">
                                                    Type <i class="fa-solid fa-sort sort-icon"></i>
                                                </th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                            <xsl:for-each select="courses/course">
                                                <xsl:sort select="students" data-type="number" order="descending"/>
                                                
                                                <tr class="course-row" 
                                                    data-id="{@id}"
                                                    data-code="{code}"
                                                    data-name="{name}"
                                                    data-faculty="{faculty}"
                                                    data-students="{students}"
                                                    data-capacity="{capacity}"
                                                    data-credits="{credits}"
                                                    data-type="{type}"
                                                    data-dept="{department}"
                                                    data-rating="{rating}"
                                                    data-sem="{semester}"
                                                    data-prereq="{prerequisites}">
                                                    
                                                    <!-- CODE -->
                                                    <td>
                                                        <span class="code-badge">
                                                            <xsl:value-of select="code"/>
                                                        </span>
                                                    </td>

                                                    <!-- NAME -->
                                                    <td>
                                                        <div class="name-cell">
                                                            <span class="course-title-text"><xsl:value-of select="name"/></span>
                                                            <span class="rating-text">
                                                                <i class="fa-solid fa-star star-icon"></i> <xsl:value-of select="rating"/>
                                                            </span>
                                                        </div>
                                                    </td>

                                                    <!-- FACULTY & DEPT -->
                                                    <td>
                                                        <div class="faculty-cell">
                                                            <span class="faculty-name"><i class="fa-solid fa-user-tie"></i> <xsl:value-of select="faculty"/></span>
                                                            <span class="dept-tag"><xsl:value-of select="department"/></span>
                                                        </div>
                                                    </td>

                                                    <!-- ENROLLMENT PROGRESS -->
                                                    <td data-sort-val="{students}">
                                                        <div class="enrollment-cell">
                                                            <div class="enrollment-numbers">
                                                                <span class="student-val"><xsl:value-of select="students"/></span>
                                                                <span class="capacity-val">/ <xsl:value-of select="capacity"/></span>
                                                            </div>
                                                            <div class="progress-bar-bg">
                                                                <div class="progress-bar-fill" style="width: {round((students div capacity) * 100)}%;"></div>
                                                            </div>
                                                        </div>
                                                    </td>

                                                    <!-- CREDITS -->
                                                    <td>
                                                        <span class="credit-pill">
                                                            <i class="fa-solid fa-award"></i> <xsl:value-of select="credits"/> Units
                                                        </span>
                                                    </td>

                                                    <!-- TYPE -->
                                                    <td>
                                                        <span class="type-pill type-{type}">
                                                            <xsl:choose>
                                                                <xsl:when test="type='Theory'">
                                                                    <i class="fa-solid fa-book"></i>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <i class="fa-solid fa-flask"></i>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                            <xsl:value-of select="type"/>
                                                        </span>
                                                    </td>

                                                    <!-- ACTION BUTTON -->
                                                    <td>
                                                        <button class="glass-btn table-action-btn" onclick="openModalFromEl(this.parentElement.parentElement)">
                                                            <i class="fa-solid fa-circle-info"></i> Details
                                                        </button>
                                                    </td>

                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                        <!-- CARDS VIEW CONTAINER -->
                        <div id="cardsViewContainer" class="view-container">
                            <div class="cards-grid" id="cardsGrid">
                                <xsl:for-each select="courses/course">
                                    <xsl:sort select="students" data-type="number" order="descending"/>
                                    
                                    <div class="glass-card course-card"
                                        data-id="{@id}"
                                        data-code="{code}"
                                        data-name="{name}"
                                        data-faculty="{faculty}"
                                        data-students="{students}"
                                        data-capacity="{capacity}"
                                        data-credits="{credits}"
                                        data-type="{type}"
                                        data-dept="{department}"
                                        data-rating="{rating}"
                                        data-sem="{semester}"
                                        data-prereq="{prerequisites}">
                                        
                                        <div class="card-header">
                                            <span class="code-badge"><xsl:value-of select="code"/></span>
                                            <span class="type-pill type-{type}"><xsl:value-of select="type"/></span>
                                        </div>

                                        <div class="card-body">
                                            <h3 class="card-title"><xsl:value-of select="name"/></h3>
                                            
                                            <div class="card-meta">
                                                <div class="meta-item">
                                                    <i class="fa-solid fa-user-tie"></i>
                                                    <span><xsl:value-of select="faculty"/></span>
                                                </div>
                                                <div class="meta-item">
                                                    <i class="fa-solid fa-building-columns"></i>
                                                    <span><xsl:value-of select="department"/></span>
                                                </div>
                                            </div>

                                            <div class="card-progress-section">
                                                <div class="progress-labels">
                                                    <span>Students Enrolled</span>
                                                    <strong><xsl:value-of select="students"/> / <xsl:value-of select="capacity"/></strong>
                                                </div>
                                                <div class="progress-bar-bg">
                                                    <div class="progress-bar-fill" style="width: {round((students div capacity) * 100)}%;"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-footer">
                                            <div class="card-stats">
                                                <span class="rating-text">
                                                    <i class="fa-solid fa-star star-icon"></i> <xsl:value-of select="rating"/>
                                                </span>
                                                <span class="credit-pill">
                                                    <i class="fa-solid fa-award"></i> <xsl:value-of select="credits"/> Credits
                                                </span>
                                            </div>
                                            <button class="glass-btn card-action-btn" onclick="openModalFromEl(this.parentElement.parentElement)">
                                                <i class="fa-solid fa-arrow-right"></i>
                                            </button>
                                        </div>

                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>

                        <!-- EMPTY STATE -->
                        <div id="noResultsState" class="empty-state" style="display: none;">
                            <div class="empty-icon"><i class="fa-solid fa-folder-open"></i></div>
                            <h3>No Matching Courses Found</h3>
                            <p>Try adjusting your search keywords or active category filters.</p>
                            <button class="glass-btn primary-btn" onclick="resetAllFilters()">Reset All Filters</button>
                        </div>

                    </main>


                    <!-- ================= COURSE DETAILS MODAL ================= -->
                    <div id="courseModal" class="modal-overlay" onclick="handleModalBackdropClick(event)">
                        <div class="glass-card modal-content">
                            <button class="modal-close-btn" onclick="closeModal()">
                                <i class="fa-solid fa-xmark"></i>
                            </button>

                            <div class="modal-header">
                                <div class="modal-badge-group">
                                    <span id="modalCode" class="code-badge">CODE</span>
                                    <span id="modalType" class="type-pill">TYPE</span>
                                    <span id="modalDept" class="dept-tag">DEPT</span>
                                </div>
                                <h2 id="modalName">Course Name</h2>
                                <p id="modalFaculty" class="modal-subtitle"><i class="fa-solid fa-user-tie"></i> Faculty Name</p>
                            </div>

                            <div class="modal-body">
                                <div class="modal-stats-grid">
                                    <div class="modal-stat-box">
                                        <span class="stat-box-title">Enrolled / Seats</span>
                                        <span id="modalEnrollment" class="stat-box-val">0 / 0</span>
                                        <div class="progress-bar-bg margin-top-xs">
                                            <div id="modalProgressFill" class="progress-bar-fill" style="width: 0%;"></div>
                                        </div>
                                    </div>
                                    <div class="modal-stat-box">
                                        <span class="stat-box-title">Credits</span>
                                        <span id="modalCredits" class="stat-box-val">0</span>
                                    </div>
                                    <div class="modal-stat-box">
                                        <span class="stat-box-title">Rating</span>
                                        <span id="modalRating" class="stat-box-val"><i class="fa-solid fa-star star-icon"></i> 0.0</span>
                                    </div>
                                    <div class="modal-stat-box">
                                        <span class="stat-box-title">Semester</span>
                                        <span id="modalSemester" class="stat-box-val">Term</span>
                                    </div>
                                </div>

                                <div class="modal-section">
                                    <h4><i class="fa-solid fa-list-check"></i> Prerequisites</h4>
                                    <p id="modalPrereq" class="modal-text-box">Prerequisite requirements details.</p>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button class="glass-btn secondary-btn" onclick="closeModal()">Close</button>
                                <button class="glass-btn primary-btn" onclick="alert('Course analysis export copied to clipboard!')">
                                    <i class="fa-solid fa-share-nodes"></i> Share Report
                                </button>
                            </div>
                        </div>
                    </div>


                    <!-- ================= FOOTER ================= -->
                    <footer class="app-footer">
                        <p>Saveetha University Course Enrollment System &amp; Analytics Module</p>
                        <span>Designed with XSLT 2.0 Transformation Architecture &amp; Glassmorphism UI</span>
                    </footer>

                </div>

                <!-- ================= INTERACTIVE SCRIPT LOGIC ================= -->
                <script type="text/javascript">
                <![CDATA[
                    let currentFilter = 'all';
                    let currentView = 'table';
                    let sortDirection = {};

                    document.addEventListener('DOMContentLoaded', () => {
                        filterAndRender();
                    });

                    // Theme Toggle
                    function toggleTheme() {
                        const htmlEl = document.documentElement;
                        const themeIcon = document.getElementById('themeIcon');
                        const isDark = htmlEl.getAttribute('data-theme') === 'dark';
                        
                        if (isDark) {
                            htmlEl.setAttribute('data-theme', 'light');
                            themeIcon.className = 'fa-solid fa-sun';
                        } else {
                            htmlEl.setAttribute('data-theme', 'dark');
                            themeIcon.className = 'fa-solid fa-moon';
                        }
                    }

                    // View Mode Switcher
                    function setViewMode(mode) {
                        currentView = mode;
                        const tableView = document.getElementById('tableViewContainer');
                        const cardsView = document.getElementById('cardsViewContainer');
                        const btnTable = document.getElementById('btnTableView');
                        const btnCards = document.getElementById('btnCardsView');

                        if (mode === 'table') {
                            tableView.classList.add('active');
                            cardsView.classList.remove('active');
                            btnTable.classList.add('active');
                            btnCards.classList.remove('active');
                        } else {
                            tableView.classList.remove('active');
                            cardsView.classList.add('active');
                            btnTable.classList.remove('active');
                            btnCards.classList.add('active');
                        }
                    }

                    // Set Filter Category
                    function setFilter(filter, buttonEl) {
                        currentFilter = filter;
                        document.querySelectorAll('.filter-pills .pill-btn').forEach(btn => btn.classList.remove('active'));
                        buttonEl.classList.add('active');
                        filterAndRender();
                    }

                    // Clear Search Input
                    function clearSearch() {
                        const input = document.getElementById('searchInput');
                        input.value = '';
                        document.getElementById('clearSearchBtn').style.display = 'none';
                        filterAndRender();
                    }

                    // Filter and Render Rows/Cards + Update KPIs
                    function filterAndRender() {
                        const query = document.getElementById('searchInput').value.trim().toLowerCase();
                        const clearBtn = document.getElementById('clearSearchBtn');
                        clearBtn.style.display = query ? 'flex' : 'none';

                        const tableRows = document.querySelectorAll('#tableBody .course-row');
                        const gridCards = document.querySelectorAll('#cardsGrid .course-card');

                        let visibleCount = 0;
                        let totalStudentsSum = 0;
                        let totalCapacitySum = 0;
                        let highEnrollmentCount = 0;

                        tableRows.forEach(row => {
                            const code = row.dataset.code.toLowerCase();
                            const name = row.dataset.name.toLowerCase();
                            const faculty = row.dataset.faculty.toLowerCase();
                            const dept = row.dataset.dept.toLowerCase();
                            const type = row.dataset.type;
                            const students = parseInt(row.dataset.students, 10);
                            const capacity = parseInt(row.dataset.capacity, 10);

                            // Category Match
                            let categoryMatch = false;
                            if (currentFilter === 'all') categoryMatch = true;
                            else if (currentFilter === 'high') categoryMatch = students > 40;
                            else categoryMatch = type === currentFilter;

                            // Text Search Match
                            let searchMatch = !query || code.includes(query) || name.includes(query) || faculty.includes(query) || dept.includes(query);

                            const isVisible = categoryMatch && searchMatch;

                            // Toggle Visibility
                            row.style.display = isVisible ? '' : 'none';

                            // Corresponding Card match
                            const card = document.querySelector(`#cardsGrid .course-card[data-id="${row.dataset.id}"]`);
                            if (card) {
                                card.style.display = isVisible ? 'flex' : 'none';
                            }

                            if (isVisible) {
                                visibleCount++;
                                totalStudentsSum += students;
                                totalCapacitySum += capacity;
                                if (students > 40) highEnrollmentCount++;
                            }
                        });

                        // Empty State Toggle
                        const noResults = document.getElementById('noResultsState');
                        noResults.style.display = visibleCount === 0 ? 'flex' : 'none';

                        // Update KPI Stats
                        document.getElementById('kpiTotalStudents').innerText = totalStudentsSum;
                        document.getElementById('kpiTotalCourses').innerText = visibleCount;
                        document.getElementById('kpiHighEnrollment').innerText = highEnrollmentCount;
                        
                        const avgFill = totalCapacitySum > 0 ? Math.round((totalStudentsSum / totalCapacitySum) * 100) : 0;
                        document.getElementById('kpiAvgFill').innerText = avgFill + '%';
                    }

                    // Sort Table
                    function sortTable(colIndex, dataType) {
                        const tbody = document.getElementById('tableBody');
                        const rows = Array.from(tbody.querySelectorAll('.course-row'));

                        sortDirection[colIndex] = !sortDirection[colIndex];
                        const isAsc = sortDirection[colIndex];

                        rows.sort((a, b) => {
                            let valA, valB;
                            if (dataType === 'number') {
                                if (colIndex === 3) {
                                    valA = parseInt(a.dataset.students, 10);
                                    valB = parseInt(b.dataset.students, 10);
                                } else {
                                    valA = parseInt(a.dataset.credits, 10);
                                    valB = parseInt(b.dataset.credits, 10);
                                }
                            } else {
                                const cellsA = a.getElementsByTagName('td');
                                const cellsB = b.getElementsByTagName('td');
                                valA = cellsA[colIndex].innerText.trim().toLowerCase();
                                valB = cellsB[colIndex].innerText.trim().toLowerCase();
                            }

                            if (valA < valB) return isAsc ? -1 : 1;
                            if (valA > valB) return isAsc ? 1 : -1;
                            return 0;
                        });

                        rows.forEach(row => tbody.appendChild(row));
                    }

                    // Reset All Filters
                    function resetAllFilters() {
                        document.getElementById('searchInput').value = '';
                        const firstPill = document.querySelector('.filter-pills .pill-btn');
                        setFilter('all', firstPill);
                    }

                    // Open Modal from Element
                    function openModalFromEl(el) {
                        const data = el.dataset;
                        document.getElementById('modalCode').innerText = data.code;
                        document.getElementById('modalType').innerText = data.type;
                        document.getElementById('modalDept').innerText = data.dept;
                        document.getElementById('modalName').innerText = data.name;
                        document.getElementById('modalFaculty').innerHTML = '<i class="fa-solid fa-user-tie"></i> Faculty: ' + data.faculty;
                        document.getElementById('modalEnrollment').innerText = data.students + ' / ' + data.capacity;
                        
                        const pct = Math.round((parseInt(data.students, 10) / parseInt(data.capacity, 10)) * 100);
                        document.getElementById('modalProgressFill').style.width = pct + '%';
                        document.getElementById('modalCredits').innerText = data.credits + ' Units';
                        document.getElementById('modalRating').innerHTML = '<i class="fa-solid fa-star star-icon"></i> ' + data.rating;
                        document.getElementById('modalSemester').innerText = data.sem;
                        document.getElementById('modalPrereq').innerText = data.prereq;

                        document.getElementById('courseModal').classList.add('active');
                    }

                    // Close Modal
                    function closeModal() {
                        document.getElementById('courseModal').classList.remove('active');
                    }

                    function handleModalBackdropClick(e) {
                        if (e.target.id === 'courseModal') {
                            closeModal();
                        }
                    }
                ]]>
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>