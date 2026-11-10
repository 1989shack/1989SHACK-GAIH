ports:
    - "8080:80"  # Nextcloud stays 8080 ✅
    - "8082:80"  # Change Mailu from 80 to 8082 to avoid IIS!
    - "8443:443"