<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Announcement Manager - Avox Hosting</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@0ac23ca/css/all.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="icon" href="assets/images/logo.png" type="image/png" />

    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --primary-color: #667eea;
            --secondary-color: #764ba2;
            --dark-color: #1a1a2e;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --info-color: #17a2b8;
        }

        body {
            background: var(--dark-color);
            min-height: 100vh;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--light-color);
            overflow-x: hidden;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
        }
        ::-webkit-scrollbar-track {
            background: var(--dark-color);
        }
        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 5px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: var(--secondary-color);
        }

        /* Security Shield */
        .security-shield {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 9999;
            background: rgba(0,0,0,0.7);
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
        }
        .security-shield:hover {
            transform: scale(1.1);
            box-shadow: 0 0 30px rgba(102, 126, 234, 0.8);
        }
        .security-shield i {
            font-size: 28px;
            color: var(--primary-color);
        }

        /* Login Modal */
        .login-modal {
            display: flex;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.9);
            z-index: 9998;
            backdrop-filter: blur(10px);
            animation: fadeIn 0.5s;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: var(--dark-color);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            max-width: 500px;
            padding: 40px;
            border: 1px solid var(--primary-color);
            position: relative;
            overflow: hidden;
        }
        .login-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to bottom right,
                transparent 45%,
                rgba(102, 126, 234, 0.1) 50%,
                transparent 55%
            );
            animation: shine 3s infinite linear;
            z-index: 0;
        }
        .login-content {
            position: relative;
            z-index: 1;
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header h2 {
            color: var(--light-color);
            font-weight: 700;
            margin-bottom: 10px;
        }
        .login-header p {
            color: rgba(255,255,255,0.7);
        }
        .login-form .form-group {
            margin-bottom: 25px;
        }
        .login-form .form-label {
            color: var(--light-color);
            font-weight: 600;
            margin-bottom: 10px;
        }
        .login-form .form-control {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: var(--light-color);
            border-radius: 8px;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }
        .login-form .form-control:focus {
            background: rgba(255,255,255,0.15);
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            color: var(--light-color);
        }
        .login-btn {
            background: var(--primary-gradient);
            border: none;
            border-radius: 8px;
            padding: 12px 30px;
            font-weight: 600;
            color: white;
            width: 100%;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        .login-btn::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to bottom right,
                transparent 45%,
                rgba(255,255,255,0.3) 50%,
                transparent 55%
            );
            animation: shine 3s infinite linear;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .login-btn:hover::after {
            opacity: 1;
        }
        .security-level {
            display: flex;
            align-items: center;
            margin-top: 20px;
            padding: 15px;
            background: rgba(0,0,0,0.3);
            border-radius: 8px;
            border-left: 4px solid var(--primary-color);
        }
        .security-level i {
            font-size: 24px;
            margin-right: 15px;
            color: var(--primary-color);
        }
        .security-level-text h5 {
            margin-bottom: 5px;
            color: var(--light-color);
        }
        .security-level-text p {
            margin-bottom: 0;
            color: rgba(255,255,255,0.7);
            font-size: 14px;
        }

        /* Admin Container */
        .admin-container {
            background: rgba(26, 26, 46, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            margin: 50px auto;
            max-width: 900px;
            padding: 40px;
            border: 1px solid rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }
        .admin-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--primary-gradient);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(102, 126, 234, 0.3);
        }
        .header h1 {
            color: var(--light-color);
            font-weight: 700;
            margin-bottom: 10px;
            text-shadow: 0 2px 10px rgba(102, 126, 234, 0.5);
        }
        .header p {
            color: rgba(255,255,255,0.7);
        }

        .form-group {
            margin-bottom: 25px;
        }
        .form-label {
            font-weight: 600;
            color: var(--light-color);
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .form-label i {
            margin-right: 10px;
            color: var(--primary-color);
        }
        .form-control {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: var(--light-color);
            border-radius: 8px;
            padding: 12px 15px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            background: rgba(255,255,255,0.15);
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            color: var(--light-color);
        }
        .form-control::placeholder {
            color: rgba(255,255,255,0.5);
        }

        .btn-primary {
            background: var(--primary-gradient);
            border: none;
            border-radius: 8px;
            padding: 12px 30px;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
            color: white;
        }
        .btn-primary::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to bottom right,
                transparent 45%,
                rgba(255,255,255,0.3) 50%,
                transparent 55%
            );
            animation: shine 3s infinite linear;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .btn-primary:hover::after {
            opacity: 1;
        }

        .btn-secondary {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: var(--light-color);
            border-radius: 8px;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-secondary:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-2px);
            color: var(--light-color);
        }

        .announcement-preview {
            background: var(--primary-gradient);
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
            font-weight: 600;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            transition: all 0.3s ease;
        }
        .announcement-preview:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .status-indicator {
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            display: inline-flex;
            align-items: center;
        }
        .status-indicator i {
            margin-right: 5px;
        }
        .status-active {
            background: var(--success-color);
            color: white;
        }
        .status-inactive {
            background: var(--danger-color);
            color: white;
        }

        .icon-selector {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        .icon-option {
            padding: 10px 15px;
            border: 2px solid rgba(255,255,255,0.2);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 16px;
            background: rgba(255,255,255,0.05);
            color: rgba(255,255,255,0.7);
        }
        .icon-option:hover {
            border-color: var(--primary-color);
            background: rgba(102, 126, 234, 0.2);
            color: white;
            transform: translateY(-2px);
        }
        .icon-option.selected {
            border-color: var(--primary-color);
            background: var(--primary-color);
            color: white;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
        }

        .color-picker {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        .color-option {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            cursor: pointer;
            border: 3px solid transparent;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0,0,0,0.2);
        }
        .color-option:hover {
            transform: scale(1.1);
        }
        .color-option.selected {
            border-color: white;
            transform: scale(1.1);
            box-shadow: 0 0 15px rgba(255,255,255,0.5);
        }

        .alert {
            border-radius: 8px;
            border: none;
            padding: 15px;
            margin-bottom: 20px;
            background: rgba(255,255,255,0.1);
            color: white;
            border-left: 4px solid;
        }
        .alert-success {
            border-left-color: var(--success-color);
        }
        .alert-danger {
            border-left-color: var(--danger-color);
        }
        .alert-info {
            border-left-color: var(--info-color);
        }
        .alert-warning {
            border-left-color: var(--warning-color);
        }

        .navbar {
            background: rgba(26, 26, 46, 0.9) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.3);
            border-bottom: 1px solid rgba(102, 126, 234, 0.2);
        }
        .navbar-brand {
            font-weight: 700;
            color: white !important;
        }
        .navbar-brand span {
            color: var(--primary-color);
        }
        .nav-link {
            color: rgba(255,255,255,0.8) !important;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        .nav-link:hover {
            color: white !important;
            transform: translateY(-2px);
        }
        .nav-link i {
            margin-right: 5px;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes shine {
            from { transform: translateX(-50%) translateY(-50%) rotate(0deg); }
            to { transform: translateX(50%) translateY(50%) rotate(360deg); }
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        .pulse {
            animation: pulse 2s infinite;
        }

        /* Anti-dev tools detection */
        #antiDevTools {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--dark-color);
            z-index: 99999;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
            display: none;
        }
        #antiDevTools h2 {
            color: var(--danger-color);
            margin-bottom: 20px;
        }
        #antiDevTools p {
            color: white;
            margin-bottom: 30px;
            max-width: 600px;
        }
        #antiDevTools i {
            font-size: 60px;
            color: var(--danger-color);
            margin-bottom: 30px;
        }

        /* Anti-Inspection CSS */
        * {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-touch-callout: none;
            -webkit-tap-highlight-color: transparent;
        }

        /* Disable text selection */
        body {
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Disable drag and drop */
        img, a {
            -webkit-user-drag: none;
            -khtml-user-drag: none;
            -moz-user-drag: none;
            -o-user-drag: none;
            user-drag: none;
        }

        /* Disable context menu */
        * {
            -webkit-context-menu: none;
            -moz-context-menu: none;
            -ms-context-menu: none;
            context-menu: none;
        }

        /* Disable outline on focus */
        *:focus {
            outline: none !important;
        }

        /* Disable selection highlight */
        ::selection {
            background: transparent !important;
            color: inherit !important;
        }

        ::-moz-selection {
            background: transparent !important;
            color: inherit !important;
        }
    </style>
</head>
<body>
    <!-- Anti-dev Tools Detection -->
    <div id="antiDevTools">
        <i class="fas fa-lock"></i>
        <h2>Security Alert</h2>
        <p>Developer tools have been detected. For security reasons, this action is prohibited. The incident has been logged and your IP address has been recorded.</p>
        <button class="btn btn-danger" onclick="location.reload()">Reload Page</button>
    </div>

    <!-- Login Modal -->
    <div class="login-modal" id="loginModal">
        <div class="container d-flex align-items-center justify-content-center min-vh-100">
            <div class="login-container">
                <div class="login-content">
                    <div class="login-header">
                        <h2><i class="fas fa-lock"></i> Admin Login</h2>
                        <p>Enter password to access the announcement manager</p>
                    </div>
                    <form id="loginForm" class="login-form">
                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" required>
                        </div>
                        <button type="submit" class="login-btn mb-3">Login</button>
                        <div class="security-level">
                            <i class="fas fa-shield-alt"></i>
                            <div class="security-level-text">
                                <h5>Secure Access</h5>
                                <p>Password-protected admin panel</p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Security Shield -->
    <div class="security-shield" id="securityShield">
        <i class="fas fa-shield-alt"></i>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center" href="index">
                <img class="img-fluid me-2" src="assets/images/logo.png" alt="Avox Hosting Logo" style="height: 40px" />
                Avox <span>Hosting</span>
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container" id="mainContent" style="display: none;">
        <div class="admin-container">
            <div class="header">
                <h1>
                    <i class="fas fa-bullhorn me-2"></i>Announcement Manager
                </h1>
                <p>Create and manage site-wide announcements</p>
            </div>

            <!-- Alert Messages -->
            <div id="alertContainer"></div>

            <form id="announcementForm">
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="announcementText" class="form-label">
                                <i class="fas fa-edit"></i> Announcement Text
                            </label>
                            <textarea class="form-control" id="announcementText" rows="3" placeholder="Enter your announcement message here..." required>Use coupon code Avox-Back for -50% discount on SAMP and MTA services!</textarea>
                        </div>

                        <div class="form-group">
                            <label for="announcementType" class="form-label">
                                <i class="fas fa-tag"></i> Announcement Type
                            </label>
                            <select class="form-control" id="announcementType">
                                <option value="info">Information</option>
                                <option value="warning">Warning</option>
                                <option value="success">Success</option>
                                <option value="danger">Important</option>
                                <option value="promotion" selected>Promotion</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-palette"></i> Icon Selection
                            </label>
                            <div class="icon-selector">
                                <div class="icon-option selected" data-icon="fas fa-gift">🎁</div>
                                <div class="icon-option" data-icon="fas fa-fire">🔥</div>
                                <div class="icon-option" data-icon="fas fa-star">⭐</div>
                                <div class="icon-option" data-icon="fas fa-bell">🔔</div>
                                <div class="icon-option" data-icon="fas fa-heart">❤️</div>
                                <div class="icon-option" data-icon="fas fa-rocket">🚀</div>
                                <div class="icon-option" data-icon="fas fa-trophy">🏆</div>
                                <div class="icon-option" data-icon="fas fa-gem">💎</div>
                                <div class="icon-option" data-icon="fas fa-bolt">⚡</div>
                                <div class="icon-option" data-icon="fas fa-crown">👑</div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-palette"></i> Color Theme
                            </label>
                            <div class="color-picker">
                                <div class="color-option selected" data-color="#667eea" style="background: #667eea"></div>
                                <div class="color-option" data-color="#28a745" style="background: #28a745"></div>
                                <div class="color-option" data-color="#dc3545" style="background: #dc3545"></div>
                                <div class="color-option" data-color="#ffc107" style="background: #ffc107"></div>
                                <div class="color-option" data-color="#17a2b8" style="background: #17a2b8"></div>
                                <div class="color-option" data-color="#6f42c1" style="background: #6f42c1"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-eye"></i> Preview
                            </label>
                            <div id="announcementPreview" class="announcement-preview">
                                <i class="fas fa-gift me-2"></i>
                                <span>Use coupon code <strong style="color: #ffd700;">Avox-Back</strong> for <strong>-50%</strong> discount on SAMP and MTA services!</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-toggle-on"></i> Status
                            </label>
                            <div class="d-flex align-items-center">
                                <span class="status-indicator status-active me-2">
                                    <i class="fas fa-check-circle"></i> Active
                                </span>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="announcementActive" checked />
                                    <label class="form-check-label" for="announcementActive">
                                        Show Announcement
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="animationSpeed" class="form-label">
                                <i class="fas fa-tachometer-alt"></i> Animation Speed
                            </label>
                            <input type="range" class="form-range" id="animationSpeed" min="10" max="40" value="25" />
                            <small class="text-muted">Speed: <span id="speedValue">25</span>s</small>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i> Save & Publish
                            </button>
                            <button type="button" class="btn btn-secondary" id="previewBtn">
                                <i class="fas fa-eye me-1"></i> Preview
                            </button>
                            <button type="button" class="btn btn-outline-secondary" id="clearBtn">
                                <i class="fas fa-trash me-1"></i> Clear
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Security Configuration
        const SECURITY_CONFIG = {
            password: "avox1", // Main password
            loginAttempts: 0,
            maxLoginAttempts: 3,
            lockoutTime: 300000, // 5 minutes in milliseconds
            devToolsCheckInterval: 1000,
            inactivityTimeout: 900000, // 15 minutes in milliseconds
            sessionDuration: 3600000 // 1 hour in milliseconds
        };

        // DOM Elements
        const form = document.getElementById("announcementForm");
        const textArea = document.getElementById("announcementText");
        const typeSelect = document.getElementById("announcementType");
        const preview = document.getElementById("announcementPreview");
        const activeToggle = document.getElementById("announcementActive");
        const speedSlider = document.getElementById("animationSpeed");
        const speedValue = document.getElementById("speedValue");
        const iconOptions = document.querySelectorAll(".icon-option");
        const colorOptions = document.querySelectorAll(".color-option");
        const loginModal = document.getElementById("loginModal");
        const loginForm = document.getElementById("loginForm");
        const securityShield = document.getElementById("securityShield");
        const mainContent = document.getElementById("mainContent");
        const antiDevTools = document.getElementById("antiDevTools");

        // Current announcement data
        let currentAnnouncement = {
            text: "Use coupon code Avox-Back for -50% discount on SAMP and MTA services!",
            type: "promotion",
            icon: "fas fa-gift",
            color: "#667eea",
            active: true,
            speed: 25,
        };

        // Security variables
        let isLoggedIn = false;
        let inactivityTimer;
        let sessionTimer;
        let devToolsCheck;
        let inputBuffer = "";

        // Initialize
        function init() {
            // Ensure login modal is visible by default
            loginModal.style.display = "flex";
            mainContent.style.display = "none";
            
            // Setup event listeners
            setupEventListeners();
            
            // Setup anti-inspection methods
            setupAntiInspection();
            
            // Check for dev tools
            startDevToolsDetection();
            
            // Setup invisible login
            setupInvisibleLogin();
            
            // Setup inactivity timer
            resetInactivityTimer();
            
            // Setup security shield
            setupSecurityShield();
            
            // Load announcement if already exists
            loadAnnouncement();
            updatePreview();
            
            // Focus on password field
            document.getElementById("password").focus();
        }

        // Show login modal
        function showLoginModal() {
            loginModal.style.display = "flex";
            mainContent.style.display = "none";
        }

        // Hide login modal
        function hideLoginModal() {
            loginModal.style.display = "none";
        }

        // Setup event listeners
        function setupEventListeners() {
            // Announcement form
            form.addEventListener("submit", handleSubmit);
            textArea.addEventListener("input", updatePreview);
            typeSelect.addEventListener("change", updatePreview);
            activeToggle.addEventListener("change", updatePreview);
            speedSlider.addEventListener("input", updateSpeed);

            iconOptions.forEach((option) => {
                option.addEventListener("click", selectIcon);
            });

            colorOptions.forEach((option) => {
                option.addEventListener("click", selectColor);
            });

            document.getElementById("previewBtn").addEventListener("click", previewAnnouncement);
            document.getElementById("clearBtn").addEventListener("click", clearForm);

            // Login form
            loginForm.addEventListener("submit", handleLogin);

            // Activity tracking
            document.addEventListener("mousemove", resetInactivityTimer);
            document.addEventListener("keydown", resetInactivityTimer);
            document.addEventListener("click", resetInactivityTimer);
            document.addEventListener("scroll", resetInactivityTimer);
        }

        // Setup security shield
        function setupSecurityShield() {
            securityShield.addEventListener("click", () => {
                if (isLoggedIn) {
                    showSecurityAlert("Session Info", 
                        `Session active for ${Math.floor((SECURITY_CONFIG.sessionDuration - sessionTimer) / 60000)} minutes. 
                        Inactivity timeout in ${Math.floor(inactivityTimer / 60000)} minutes.`);
                } else {
                    showSecurityAlert("Security Status", 
                        "Please login to access security information.");
                }
            });
        }

        // Security alert
        function showSecurityAlert(title, message) {
            const alertContainer = document.getElementById("alertContainer");
            const alert = document.createElement("div");
            alert.className = `alert alert-info animate__animated animate__fadeIn`;
            alert.innerHTML = `
                <strong>${title}:</strong> ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;

            alertContainer.prepend(alert);

            setTimeout(() => {
                alert.classList.add("animate__fadeOut");
                setTimeout(() => alert.remove(), 500);
            }, 5000);
        }

        // Handle login
        function handleLogin(e) {
            e.preventDefault();
            
            const password = document.getElementById("password").value;
            
            if (SECURITY_CONFIG.loginAttempts >= SECURITY_CONFIG.maxLoginAttempts) {
                showLoginAlert("Account locked. Please try again later.", "danger");
                setTimeout(() => {
                    SECURITY_CONFIG.loginAttempts = 0;
                    showLoginAlert("You can now try to login again.", "info");
                }, SECURITY_CONFIG.lockoutTime);
                return;
            }
            
            if (password === SECURITY_CONFIG.password) {
                SECURITY_CONFIG.loginAttempts = 0;
                showLoginAlert("Login successful!", "success");
                
                // Start session after short delay
                setTimeout(() => {
                    hideLoginModal();
                    startSession();
                }, 1000);
            } else {
                SECURITY_CONFIG.loginAttempts++;
                const remainingAttempts = SECURITY_CONFIG.maxLoginAttempts - SECURITY_CONFIG.loginAttempts;
                
                if (remainingAttempts > 0) {
                    showLoginAlert(`Invalid password. ${remainingAttempts} attempts remaining.`, "danger");
                } else {
                    showLoginAlert(`Account locked for ${SECURITY_CONFIG.lockoutTime / 60000} minutes.`, "danger");
                }
            }
        }

        // Start session
        function startSession() {
            isLoggedIn = true;
            mainContent.style.display = "block";
            
            // Start session timer
            sessionTimer = SECURITY_CONFIG.sessionDuration;
            const sessionInterval = setInterval(() => {
                sessionTimer -= 1000;
                if (sessionTimer <= 0) {
                    clearInterval(sessionInterval);
                    endSession();
                }
            }, 1000);
            
            // Reset inactivity timer
            resetInactivityTimer();
        }

        // End session
        function endSession() {
            isLoggedIn = false;
            mainContent.style.display = "none";
            showLoginModal();
            showSecurityAlert("Session Ended", "Your session has expired. Please login again.");
        }

        // Reset inactivity timer
        function resetInactivityTimer() {
            if (!isLoggedIn) return;
            
            clearTimeout(inactivityTimer);
            inactivityTimer = setTimeout(() => {
                endSession();
                showSecurityAlert("Inactivity", "You were logged out due to inactivity.");
            }, SECURITY_CONFIG.inactivityTimeout);
        }

        // Show login alert
        function showLoginAlert(message, type) {
            const alert = document.createElement("div");
            alert.className = `alert alert-${type} alert-dismissible fade show mt-3`;
            alert.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;

            // Remove any existing alerts first
            const existingAlert = loginForm.querySelector(".alert");
            if (existingAlert) {
                existingAlert.remove();
            }

            loginForm.appendChild(alert);
        }

        // Setup invisible login
        function setupInvisibleLogin() {
            document.addEventListener("keydown", (e) => {
                // Only letters and numbers, ignore others
                if (e.key.length === 1) {
                    inputBuffer += e.key.toLowerCase();

                    // Keep buffer max length to 5 (length of "avox1")
                    if (inputBuffer.length > 5) {
                        inputBuffer = inputBuffer.slice(-5);
                    }

                    if (inputBuffer === SECURITY_CONFIG.password) {
                        showSecurityAlert("Hidden Access", "Admin access granted via hidden password.");
                        inputBuffer = "";
                        
                        // If not already logged in, start session directly
                        if (!isLoggedIn) {
                            hideLoginModal();
                            startSession();
                        }
                    }
                }
            });
        }

        // Dev tools detection
        function startDevToolsDetection() {
            devToolsCheck = setInterval(() => {
                const widthThreshold = window.outerWidth - window.innerWidth > 160;
                const heightThreshold = window.outerHeight - window.innerHeight > 160;
                
                if (widthThreshold || heightThreshold) {
                    clearInterval(devToolsCheck);
                    showDevToolsWarning();
                }
            }, SECURITY_CONFIG.devToolsCheckInterval);
        }

        // Show dev tools warning
        function showDevToolsWarning() {
            antiDevTools.style.display = "flex";
            
            // Disable all other content
            document.querySelectorAll("body > *:not(#antiDevTools)").forEach(el => {
                el.style.display = "none";
            });
            
            // Prevent right click
            document.addEventListener("contextmenu", (e) => e.preventDefault());
            
            // Prevent F12, Ctrl+Shift+I, Ctrl+Shift+J, Ctrl+Shift+C, Ctrl+U
            document.addEventListener("keydown", (e) => {
                if (e.key === "F12" || 
                    (e.ctrlKey && e.shiftKey && (e.key === "I" || e.key === "J" || e.key === "C"))) {
                    e.preventDefault();
                }
                
                // Ctrl+U
                if (e.ctrlKey && e.key === "u") {
                    e.preventDefault();
                }
            });
        }

        // Enhanced Anti-Inspection Methods
        function setupAntiInspection() {
            // 1. Disable Right Click
            document.addEventListener("contextmenu", (e) => {
                e.preventDefault();
                showSecurityAlert("Access Denied", "Right-click is disabled for security reasons.");
            });

            // 2. Disable Keyboard Shortcuts
            document.addEventListener("keydown", (e) => {
                // F12 - Developer Tools
                if (e.key === "F12") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Developer tools access is restricted.");
                }
                
                // Ctrl+Shift+I - Developer Tools
                if (e.ctrlKey && e.shiftKey && e.key === "I") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Developer tools access is restricted.");
                }
                
                // Ctrl+Shift+J - Console
                if (e.ctrlKey && e.shiftKey && e.key === "J") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Console access is restricted.");
                }
                
                // Ctrl+Shift+C - Element Inspector
                if (e.ctrlKey && e.shiftKey && e.key === "C") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Element inspector access is restricted.");
                }
                
                // Ctrl+U - View Source
                if (e.ctrlKey && e.key === "u") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "View source is disabled for security reasons.");
                }
                
                // Ctrl+S - Save Page
                if (e.ctrlKey && e.key === "s") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Page saving is disabled for security reasons.");
                }
                
                // Ctrl+P - Print
                if (e.ctrlKey && e.key === "p") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Printing is disabled for security reasons.");
                }
            });

            // 3. Disable Text Selection
            document.addEventListener("selectstart", (e) => {
                e.preventDefault();
            });

            // 4. Disable Drag and Drop
            document.addEventListener("dragstart", (e) => {
                e.preventDefault();
            });

            // 5. Disable Copy
            document.addEventListener("copy", (e) => {
                e.preventDefault();
                showSecurityAlert("Access Denied", "Copying content is disabled for security reasons.");
            });

            // 6. Disable Cut
            document.addEventListener("cut", (e) => {
                e.preventDefault();
                showSecurityAlert("Access Denied", "Cutting content is disabled for security reasons.");
            });

            // 7. Disable Paste
            document.addEventListener("paste", (e) => {
                e.preventDefault();
                showSecurityAlert("Access Denied", "Pasting content is disabled for security reasons.");
            });

            // 8. Enhanced Dev Tools Detection
            let devtools = { open: false, orientation: null };
            
            setInterval(() => {
                const threshold = 160;
                const widthThreshold = window.outerWidth - window.innerWidth > threshold;
                const heightThreshold = window.outerHeight - window.innerHeight > threshold;
                
                if (widthThreshold || heightThreshold) {
                    if (!devtools.open) {
                        devtools.open = true;
                        showDevToolsWarning();
                    }
                } else {
                    devtools.open = false;
                }
            }, 500);

            // 9. Detect iframe embedding
            if (window.self !== window.top) {
                document.body.innerHTML = "<h1>Access Denied</h1><p>This page cannot be embedded in iframes for security reasons.</p>";
            }

            // 10. Disable Back/Forward buttons
            window.addEventListener("beforeunload", (e) => {
                e.preventDefault();
                e.returnValue = "";
            });

            // 11. Disable Print Screen
            document.addEventListener("keydown", (e) => {
                if (e.key === "PrintScreen" || (e.ctrlKey && e.key === "PrintScreen")) {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Print screen is disabled for security reasons.");
                }
            });

            // 12. Disable Save As
            window.addEventListener("beforeunload", (e) => {
                if (e.clientY < 0) {
                    e.preventDefault();
                    e.returnValue = "";
                }
            });

            // 13. Disable View Page Source
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.key === "u") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "View source is disabled for security reasons.");
                }
            });

            // 14. Disable Inspect Element
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "C") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Inspect element is disabled for security reasons.");
                }
            });

            // 15. Disable Console
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "J") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Console access is disabled for security reasons.");
                }
            });

            // 16. Disable Network Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "E") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Network tab access is disabled for security reasons.");
                }
            });

            // 17. Disable Application Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "A") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Application tab access is disabled for security reasons.");
                }
            });

            // 18. Disable Security Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "S") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Security tab access is disabled for security reasons.");
                }
            });

            // 19. Disable Performance Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "P") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Performance tab access is disabled for security reasons.");
                }
            });

            // 20. Disable Memory Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "M") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Memory tab access is disabled for security reasons.");
                }
            });

            // 21. Disable Lighthouse Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "L") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Lighthouse tab access is disabled for security reasons.");
                }
            });

            // 22. Disable Recorder Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "R") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Recorder tab access is disabled for security reasons.");
                }
            });

            // 23. Disable Coverage Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "O") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Coverage tab access is disabled for security reasons.");
                }
            });

            // 24. Disable Web Vitals Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "W") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Web Vitals tab access is disabled for security reasons.");
                }
            });

            // 25. Disable Issues Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "I") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Issues tab access is disabled for security reasons.");
                }
            });

            // 26. Disable Sources Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "S") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Sources tab access is disabled for security reasons.");
                }
            });

            // 27. Disable Timeline Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "T") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Timeline tab access is disabled for security reasons.");
                }
            });

            // 28. Disable Profiler Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "P") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Profiler tab access is disabled for security reasons.");
                }
            });

            // 29. Disable Audits Tab
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "A") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Audits tab access is disabled for security reasons.");
                }
            });

            // 30. Disable Performance Monitor
            document.addEventListener("keydown", (e) => {
                if (e.ctrlKey && e.shiftKey && e.key === "M") {
                    e.preventDefault();
                    showSecurityAlert("Access Denied", "Performance monitor access is disabled for security reasons.");
                }
            });
        }

        // Update preview
        function updatePreview() {
            const text = textArea.value;
            const type = typeSelect.value;
            const active = activeToggle.checked;

            currentAnnouncement.text = text;
            currentAnnouncement.type = type;
            currentAnnouncement.active = active;

            // Update preview content
            preview.innerHTML = `
                <i class="${currentAnnouncement.icon} me-2"></i>
                <span>${text}</span>
            `;

            // Update preview styling based on type
            updatePreviewStyle();
        }

        // Update preview styling
        function updatePreviewStyle() {
            const type = currentAnnouncement.type;
            const color = currentAnnouncement.color;

            let gradient = "";
            switch (type) {
                case "success":
                    gradient = `linear-gradient(135deg, #28a745 0%, #20c997 100%)`;
                    break;
                case "warning":
                    gradient = `linear-gradient(135deg, #ffc107 0%, #fd7e14 100%)`;
                    break;
                case "danger":
                    gradient = `linear-gradient(135deg, #dc3545 0%, #e83e8c 100%)`;
                    break;
                case "promotion":
                    gradient = `linear-gradient(135deg, ${color} 0%, ${adjustColor(color, -20)} 100%)`;
                    break;
                default:
                    gradient = `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`;
            }

            preview.style.background = gradient;
        }

        // Select icon
        function selectIcon(e) {
            iconOptions.forEach((opt) => opt.classList.remove("selected"));
            e.target.classList.add("selected");
            currentAnnouncement.icon = e.target.dataset.icon;
            updatePreview();
        }

        // Select color
        function selectColor(e) {
            colorOptions.forEach((opt) => opt.classList.remove("selected"));
            e.target.classList.add("selected");
            currentAnnouncement.color = e.target.dataset.color;
            updatePreview();
        }

        // Update speed
        function updateSpeed() {
            const speed = speedSlider.value;
            speedValue.textContent = speed;
            currentAnnouncement.speed = parseInt(speed);
        }

        // Handle form submission
        function handleSubmit(e) {
            e.preventDefault();

            if (!textArea.value.trim()) {
                showAlert("Please enter announcement text", "danger");
                return;
            }

            // Save to localStorage
            localStorage.setItem("currentAnnouncement", JSON.stringify(currentAnnouncement));

            showAlert("Announcement saved successfully!", "success");

            // Simulate sending to main page
            setTimeout(() => {
                showAlert("Announcement is now live on the main page!", "success");
            }, 1000);
        }

        // Preview announcement
        function previewAnnouncement() {
            // Create a temporary notification bar for preview
            const tempBar = document.createElement("div");
            tempBar.className = "notification-bar";
            tempBar.style.cssText = `
                background: ${preview.style.background};
                color: white;
                text-align: center;
                padding: 12px 0;
                font-weight: 600;
                font-size: 16px;
                position: fixed;
                top: 80px;
                left: 0;
                right: 0;
                z-index: 1060;
                animation: slideDown 0.5s ease-out;
            `;

            tempBar.innerHTML = `
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <i class="${currentAnnouncement.icon} me-2"></i>
                            <span>${currentAnnouncement.text}</span>
                        </div>
                    </div>
                </div>
            `;

            document.body.appendChild(tempBar);

            setTimeout(() => {
                tempBar.style.animation = "fadeOut 0.5s ease-out";
                setTimeout(() => tempBar.remove(), 500);
            }, 3000);
        }

        // Clear form
        function clearForm() {
            if (confirm("Are you sure you want to clear the form?")) {
                textArea.value = "";
                typeSelect.value = "info";
                activeToggle.checked = true;
                speedSlider.value = 25;
                speedValue.textContent = "25";

                // Reset selections
                iconOptions.forEach((opt) => opt.classList.remove("selected"));
                iconOptions[0].classList.add("selected");

                colorOptions.forEach((opt) => opt.classList.remove("selected"));
                colorOptions[0].classList.add("selected");

                currentAnnouncement = {
                    text: "",
                    type: "info",
                    icon: "fas fa-gift",
                    color: "#667eea",
                    active: true,
                    speed: 25,
                };

                updatePreview();
                showAlert("Form cleared", "info");
            }
        }

        // Load saved announcement
        function loadAnnouncement() {
            const saved = localStorage.getItem("currentAnnouncement");
            if (saved) {
                currentAnnouncement = JSON.parse(saved);

                textArea.value = currentAnnouncement.text;
                typeSelect.value = currentAnnouncement.type;
                activeToggle.checked = currentAnnouncement.active;
                speedSlider.value = currentAnnouncement.speed;
                speedValue.textContent = currentAnnouncement.speed;

                // Set icon selection
                iconOptions.forEach((opt) => {
                    opt.classList.remove("selected");
                    if (opt.dataset.icon === currentAnnouncement.icon) {
                        opt.classList.add("selected");
                    }
                });

                // Set color selection
                colorOptions.forEach((opt) => {
                    opt.classList.remove("selected");
                    if (opt.dataset.color === currentAnnouncement.color) {
                        opt.classList.add("selected");
                    }
                });
            }
        }

        // Show alert
        function showAlert(message, type) {
            const alertContainer = document.getElementById("alertContainer");
            const alert = document.createElement("div");
            alert.className = `alert alert-${type} alert-dismissible fade show`;
            alert.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;

            alertContainer.appendChild(alert);

            setTimeout(() => {
                alert.classList.add("animate__fadeOut");
                setTimeout(() => alert.remove(), 500);
            }, 5000);
        }

        // Utility function to adjust color brightness
        function adjustColor(color, amount) {
            const hex = color.replace("#", "");
            const r = Math.max(0, Math.min(255, parseInt(hex.substr(0, 2), 16) + amount));
            const g = Math.max(0, Math.min(255, parseInt(hex.substr(2, 2), 16) + amount));
            const b = Math.max(0, Math.min(255, parseInt(hex.substr(4, 2), 16) + amount));
            return `#${r.toString(16).padStart(2, "0")}${g.toString(16).padStart(2, "0")}${b.toString(16).padStart(2, "0")}`;
        }

        // Initialize when DOM is loaded
        document.addEventListener("DOMContentLoaded", init);
    </script>
</body>
</html> 
