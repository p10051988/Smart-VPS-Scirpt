# VPS MANAGER (GO EDITION) - v2.7.60

**VPS Manager (Go Edition)** is a high-performance server management tool written in **Golang**. It is designed to replace traditional complex control panels and slow shell scripts.

## Core Features
*   **Performance:** Native compiled binary (Linux/AMD64). Zero dependencies.
*   **System Integrity:** Standard system configurations (Systemd, Nginx, UFW) without proprietary layers.
*   **Security:** Integrated ModSecurity (WAF), GeoIP blocking, and Fail2Ban.

## Functionality Overview

### System
*   **System Updates:** Kernel and package management.
*   **Network Optimization:** TCP BBR congestion control.
*   **Resource Management:** SWAP configuration and disk cleanup tools.

### Web Server Stack
*   **Nginx:** Optimized configuration with HTTP/2, Gzip, and Brotli support.
*   **PHP:** Multi-version support (PHP 5.6 - 8.3) via PHP-FPM.
*   **MariaDB:** Automatic performance tuning based on available RAM (InnoDB Buffer Pool optimization).
*   **SSL:** Automated Let's Encrypt certificate issuance and renewal.

### File Management
*   **FileBrowser Integration:** Built-in web-based file manager.
*   **Zero-Config Access:** Accessible via standard Port 80 (Reverse Proxy) at `http://<IP>/files/`. No external firewall configuration required.

### Security
*   **Web Application Firewall (WAF):** ModSecurity integration with OWASP Core Rule Set.
*   **Access Control:** GeoIP filtering and Nginx Rate Limiting.
*   **Intrusion Prevention:** Fail2Ban profiles for SSH and Nginx.

### WordPress Toolkit
*   **WP-CLI Wrapper:** Command-line management for Core, Plugins, and Themes.
*   **Maintenance:** Bulk update and database repair utilities.

## Installation
Run the following command as root:

```bash
curl -LO https://raw.githubusercontent.com/p10051988/Smart-VPS-Scirpt/main/install.sh && bash install.sh
```

## Usage
Execute the `vps` command to open the management interface:

```bash
vps
```

## Technical Notes

### Database Auto-Tuning
The script calculates specific memory allocation for MariaDB:
*   **< 2GB RAM:** Optimized for low-memory footprint (`skip-name-resolve`, reduced buffers).
*   **> 4GB RAM:** Performance mode (50-60% RAM allocation for InnoDB).

### File Manager Proxy
FileBrowser listens on `127.0.0.1:8080` and is exposed via Nginx at `location /files/`. This architecture allows access through the standard HTTP port (80) without modifying cloud security groups (AWS/Oracle/GCP).

---
**License:** Open Source
