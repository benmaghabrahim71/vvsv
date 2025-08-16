// Mobile Menu Toggle
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navCenter = document.querySelector('.nav-center');
    
    if (mobileMenuBtn && navCenter) {
        mobileMenuBtn.addEventListener('click', function() {
            navCenter.classList.toggle('active');
            mobileMenuBtn.classList.toggle('active');
        });
    }
    
    // Close mobile menu when clicking on a link
    const navLinks = document.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            navCenter.classList.remove('active');
            mobileMenuBtn.classList.remove('active');
        });
    });
    
    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        if (!event.target.closest('.nav') && navCenter.classList.contains('active')) {
            navCenter.classList.remove('active');
            mobileMenuBtn.classList.remove('active');
        }
    });
});

// Typing Effect
function typeWriter(element, text, speed = 100) {
    let i = 0;
    element.innerHTML = '';
    
    function type() {
        if (i < text.length) {
            element.innerHTML += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }
    
    type();
}

// Initialize typing effect
document.addEventListener('DOMContentLoaded', function() {
    const typingElement = document.querySelector('.typing-text');
    if (typingElement) {
        const text = typingElement.textContent;
        typeWriter(typingElement, text, 80);
    }
});

// Header background change on scroll - Mobile Optimized
let ticking = false;

function updateHeader() {
    const header = document.querySelector('.header');
    if (header) {
        if (window.scrollY > 50) {
            header.style.background = 'rgba(10, 10, 10, 0.98)';
            header.style.boxShadow = '0 2px 20px rgba(0, 102, 255, 0.1)';
        } else {
            header.style.background = 'rgba(10, 10, 10, 0.95)';
            header.style.boxShadow = 'none';
        }
    }
    ticking = false;
}

window.addEventListener('scroll', function() {
    if (!ticking) {
        requestAnimationFrame(updateHeader);
        ticking = true;
    }
});

// Smooth scrolling for anchor links
document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            
            if (targetElement) {
                const headerHeight = document.querySelector('.header').offsetHeight;
                const targetPosition = targetElement.offsetTop - headerHeight - 20;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
});

// Element animation on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe elements for animation
document.addEventListener('DOMContentLoaded', function() {
    const animatedElements = document.querySelectorAll('.service-card, .feature-card, .pricing-card, .game-type-card');
    
    animatedElements.forEach(element => {
        element.style.opacity = '0';
        element.style.transform = 'translateY(30px)';
        element.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(element);
    });
});

// Counter animation for stats
function animateCounter(element, target, duration = 2000) {
    let start = 0;
    const increment = target / (duration / 16);
    
    function updateCounter() {
        start += increment;
        if (start < target) {
            element.textContent = Math.floor(start);
            requestAnimationFrame(updateCounter);
        } else {
            element.textContent = target;
        }
    }
    
    updateCounter();
}

// Initialize counter animations
document.addEventListener('DOMContentLoaded', function() {
    const counters = document.querySelectorAll('.stat-number');
    
    const counterObserver = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const target = parseInt(entry.target.getAttribute('data-target'));
                animateCounter(entry.target, target);
                counterObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });
    
    counters.forEach(counter => {
        counterObserver.observe(counter);
    });
});

// Button hover effects
document.addEventListener('DOMContentLoaded', function() {
    const buttons = document.querySelectorAll('.hero-cta, .order-btn, .service-btn, .game-type-btn');
    
    buttons.forEach(button => {
        button.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-3px) scale(1.02)';
        });
        
        button.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
});

// Parallax effect for hero section - Mobile Optimized
let parallaxTicking = false;

function updateParallax() {
    const scrolled = window.pageYOffset;
    const hero = document.querySelector('.hero');
    if (hero && window.innerWidth > 768) { // Only on desktop
        const rate = scrolled * -0.5;
        hero.style.transform = `translateY(${rate}px)`;
    }
    parallaxTicking = false;
}

window.addEventListener('scroll', function() {
    if (!parallaxTicking) {
        requestAnimationFrame(updateParallax);
        parallaxTicking = true;
    }
});

// Add mobile menu styles dynamically
const mobileMenuStyle = document.createElement('style');
mobileMenuStyle.textContent = `
    @media (max-width: 768px) {
        .nav-center {
            position: fixed;
            top: 100%;
            left: 0;
            right: 0;
            background: rgba(10, 10, 10, 0.98);
            backdrop-filter: blur(20px);
            flex-direction: column;
            padding: 2rem;
            gap: 1rem;
            transform: translateY(-100%);
            transition: transform 0.3s ease;
            border-top: 1px solid rgba(0, 102, 255, 0.2);
            z-index: 999;
        }
        
        .nav-center.active {
            transform: translateY(0);
        }
        
        .nav-link {
            font-size: 1.2rem;
            padding: 1rem 0;
            border-bottom: 1px solid rgba(0, 102, 255, 0.1);
            width: 100%;
            text-align: center;
        }
        
        .nav-link:last-child {
            border-bottom: none;
        }
        
        .mobile-menu-btn {
            display: block;
            transition: transform 0.3s ease;
        }
        
        .mobile-menu-btn.active {
            transform: rotate(90deg);
        }
        
        .mobile-menu-btn i {
            transition: transform 0.3s ease;
        }
        
        .mobile-menu-btn.active i {
            transform: rotate(180deg);
        }
    }
    
    @media (max-width: 480px) {
        .nav-center {
            padding: 1.5rem;
        }
        
        .nav-link {
            font-size: 1.1rem;
            padding: 0.8rem 0;
        }
        
        .hero-title {
            font-size: 2rem !important;
        }
        
        .hero-description {
            font-size: 1rem !important;
        }
        
        .section-title {
            font-size: 1.8rem !important;
        }
        
        .pricing-card,
        .service-card,
        .feature-card,
        .game-type-card {
            padding: 1.5rem !important;
        }
        
        .price {
            flex-direction: column !important;
            gap: 0.2rem !important;
        }
        
        .amount {
            font-size: 2.2rem !important;
        }
        
        .hero-buttons {
            flex-direction: column !important;
            gap: 1rem !important;
        }
        
        .hero-cta {
            width: 100% !important;
            justify-content: center !important;
            padding: 1rem 1.5rem !important;
        }
        
        .service-features {
            flex-direction: column !important;
            align-items: center !important;
        }
        
        .service-features span {
            width: fit-content !important;
        }
        
        .card-features ul {
            padding-left: 0 !important;
        }
        
        .card-features li {
            font-size: 0.9rem !important;
            margin-bottom: 0.8rem !important;
        }
        
        .logo-img {
            width: 30px !important;
            height: 30px !important;
        }
        
        .logo-text {
            font-size: 1rem !important;
        }
        
        .nav {
            padding: 0.5rem 1rem !important;
        }
        
        .client-area-btn {
            padding: 0.5rem 1rem !important;
            font-size: 0.8rem !important;
        }
        
        .container {
            padding: 0 10px !important;
        }
    }
`;

document.head.appendChild(mobileMenuStyle);

// Add loading animation for buttons
document.addEventListener('DOMContentLoaded', function() {
    const orderButtons = document.querySelectorAll('.order-btn');
    
    orderButtons.forEach(button => {
        button.addEventListener('click', function() {
            const originalText = this.textContent;
            this.textContent = 'Processing...';
            this.disabled = true;
            
            // Simulate processing
            setTimeout(() => {
                this.textContent = originalText;
                this.disabled = false;
            }, 2000);
        });
    });
});

// Add keyboard navigation support
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        const navCenter = document.querySelector('.nav-center');
        const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
        
        if (navCenter && navCenter.classList.contains('active')) {
            navCenter.classList.remove('active');
            mobileMenuBtn.classList.remove('active');
        }
    }
});

// Add focus management for accessibility
document.addEventListener('DOMContentLoaded', function() {
    const focusableElements = document.querySelectorAll('a, button, input, textarea, select');
    
    focusableElements.forEach(element => {
        element.addEventListener('focus', function() {
            this.style.outline = '2px solid var(--primary-blue)';
            this.style.outlineOffset = '2px';
        });
        
        element.addEventListener('blur', function() {
            this.style.outline = 'none';
        });
    });
});

// Add smooth reveal animation for sections
const revealObserver = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('revealed');
        }
    });
}, { threshold: 0.1 });

document.addEventListener('DOMContentLoaded', function() {
    const sections = document.querySelectorAll('section');
    sections.forEach(section => {
        revealObserver.observe(section);
    });
});

// Add reveal animation styles
const revealStyle = document.createElement('style');
revealStyle.textContent = `
    section {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.8s ease, transform 0.8s ease;
    }
    
    section.revealed {
        opacity: 1;
        transform: translateY(0);
    }
    
    .hero {
        opacity: 1 !important;
        transform: none !important;
    }
`;

document.head.appendChild(revealStyle);
