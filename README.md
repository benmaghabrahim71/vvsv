# Avox Hosting Website

A modern web hosting company website with clean URLs and PHP backend.

## Features

- **Clean URLs**: All pages are accessible without file extensions (e.g., `avoxhosting.site/index` instead of `avoxhosting.site/index.html`)
- **PHP Backend**: Converted from static HTML to PHP for better functionality
- **Modern Design**: Responsive design with Bootstrap and custom animations
- **Security**: Enhanced security with .htaccess protection
- **Performance**: Optimized with compression and caching

## URL Structure

All pages are now accessible with clean URLs:

- Home: `/` or `/index`
- Minecraft Hosting: `/minecraft`
- MTA Hosting: `/mta`
- SAMP Hosting: `/samp`
- VPS Hosting: `/vps-hosting`
- Discord Hosting: `/discord-hosting`
- Partners: `/partners`
- Terms of Service: `/terms-of-service`
- Privacy Policy: `/privacy-policy`
- Announcement Manager: `/ann`

## Server Requirements

- Apache web server with mod_rewrite enabled
- PHP 7.4 or higher
- .htaccess support

## Installation

1. Upload all files to your web server
2. Ensure Apache mod_rewrite is enabled
3. The .htaccess file will automatically handle clean URLs
4. Access the site at your domain

## File Structure

```
avoxox-main/
├── index.php              # Home page
├── minecraft.php          # Minecraft hosting page
├── mta.php               # MTA hosting page
├── samp.php              # SAMP hosting page
├── vps-hosting.php       # VPS hosting page
├── discord-hosting.php   # Discord hosting page
├── partners.php          # Partners page
├── terms-of-service.php  # Terms of service
├── privacy-policy.php    # Privacy policy
├── ann.php              # Announcement manager (admin)
├── .htaccess            # URL rewriting rules
├── assets/              # CSS, JS, and images
└── README.md           # This file
```

## Clean URL Examples

Instead of:
- `avoxhosting.site/index.html`
- `avoxhosting.site/minecraft.html`
- `avoxhosting.site/vps-hosting.html`

Users can now access:
- `avoxhosting.site/index`
- `avoxhosting.site/minecraft`
- `avoxhosting.site/vps-hosting`

## Security Features

- .htaccess protection for sensitive files
- Security headers enabled
- Backup file access prevention
- XSS protection headers

## Performance Optimizations

- Gzip compression enabled
- Static file caching (1 year)
- Optimized image formats (WebP support)
- Minified CSS and JavaScript

## Admin Access

The announcement manager is available at `/ann` with password protection.

## Support

For technical support or questions about the website setup, please contact the development team.