$(function(){$(document).scroll(function(){var $nav=$(".fixed-top");$nav.toggleClass('scrolled',$(this).scrollTop()>$nav.height())})})

// Rain Effect
function createRaindrops() {
    const rainContainer = document.createElement('div');
    rainContainer.id = 'rain-container';
    document.body.appendChild(rainContainer);
    
    for (let i = 0; i < 50; i++) {
        const raindrop = document.createElement('div');
        raindrop.className = 'raindrop';
        raindrop.style.left = Math.random() * 100 + '%';
        raindrop.style.animationDelay = Math.random() * 5 + 's';
        raindrop.style.animationDuration = (Math.random() * 2 + 3) + 's';
        raindrop.style.height = (Math.random() * 20 + 30) + 'px';
        raindrop.style.opacity = 0.5;
        rainContainer.appendChild(raindrop);
    }
}

// Security Protection
function addSecurityProtection() {
    // Disable Ctrl+S (Save)
    document.addEventListener('keydown', function(e) {
        if ((e.ctrlKey || e.metaKey) && e.key === 's') {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
    });

    // Disable right-click context menu
    document.addEventListener('contextmenu', function(e) {
        e.preventDefault();
        return false;
    });

    // Disable F12, Ctrl+Shift+I, Ctrl+U
    document.addEventListener('keydown', function(e) {
        if (e.key === 'F12' || 
            ((e.ctrlKey || e.metaKey) && e.shiftKey && e.key === 'I') ||
            ((e.ctrlKey || e.metaKey) && e.key === 'u')) {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
    });

    // Disable image dragging
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.addEventListener('dragstart', function(e) {
            e.preventDefault();
            return false;
        });
        img.style.userSelect = 'none';
        img.style.webkitUserSelect = 'none';
        img.style.mozUserSelect = 'none';
        img.style.msUserSelect = 'none';
    });

    // Disable text selection
    document.body.style.userSelect = 'none';
    document.body.style.webkitUserSelect = 'none';
    document.body.style.mozUserSelect = 'none';
    document.body.style.msUserSelect = 'none';

    // Disable copy
    document.addEventListener('copy', function(e) {
        e.preventDefault();
        return false;
    });

    // Disable cut
    document.addEventListener('cut', function(e) {
        e.preventDefault();
        return false;
    });

    // Disable paste
    document.addEventListener('paste', function(e) {
        e.preventDefault();
        return false;
    });

    // Disable print
    document.addEventListener('keydown', function(e) {
        if ((e.ctrlKey || e.metaKey) && e.key === 'p') {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
    });

    // Disable view source
    document.addEventListener('keydown', function(e) {
        if ((e.ctrlKey || e.metaKey) && e.key === 'u') {
            e.preventDefault();
            e.stopPropagation();
            return false;
        }
    });

    // Disable developer tools (Desktop only)
    let devtools = {open: false, orientation: null};
    setInterval(() => {
        // Only check on desktop devices (screen width > 768px)
        if (window.innerWidth > 768) {
            const threshold = 160;
            const widthThreshold = window.outerWidth - window.innerWidth > threshold;
            const heightThreshold = window.outerHeight - window.innerHeight > threshold;
            if (widthThreshold || heightThreshold) {
                if (!devtools.open) {
                    devtools.open = true;
                    document.body.innerHTML = '<div style="text-align:center;padding:50px;color:red;font-size:24px;">Developer tools detected. Access denied.</div>';
                }
            }
        }
    }, 1000);
}

// Initialize rain effect and security when page loads
$(document).ready(function() {
    createRaindrops();
    addSecurityProtection();
});
