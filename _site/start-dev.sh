#!/bin/bash

# Check if SSL certificates exist, create them if they don't
if [ ! -f "localhost-cert.pem" ] || [ ! -f "localhost-key.pem" ]; then
    echo "Creating SSL certificates for local development..."
    openssl req -x509 -newkey rsa:4096 -keyout localhost-key.pem -out localhost-cert.pem -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
    echo "SSL certificates created!"
fi

echo "Starting Jekyll development server with HTTPS..."
echo "Access your site at: https://localhost:4000"
echo "Note: You may see a security warning - click 'Advanced' and 'Proceed to localhost'"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

bundle exec jekyll serve --config _config.yml,_config_dev.yml --host localhost --port 4000 --ssl-cert localhost-cert.pem --ssl-key localhost-key.pem
