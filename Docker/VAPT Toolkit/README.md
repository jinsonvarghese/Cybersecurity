# Vulnerability Assessment & Penetration Testing Toolkit

A toolkit aiming to help **automate** some of the initial tests done when starting VAPT on a target web application.
https://hub.docker.com/r/jinsonvarghese/vapt

# What it does currently

Scans include checks for missing HTTP security headers, subdomains, ssl issues, port scans, service vulnerabilities, etc. by leveraging popular tools like Nikto, Nmap, TestSSL and others. 

+ More tools will be added in the future.
+ This toolkit can be set up using Docker on Linux or MacOS.

# Steps to set it up

+ Pull the image from Docker Hub: `docker pull jinsonvarghese/vapt`
+ Run the image and enter the Ubuntu base system terminal: `docker run -it jinsonvarghese/vapt`
+ Run a scan on any website using the command `vapt {{URL}}`, for example `vapt google.com`

# Tips

+ After the initial setup, save time by setting up aliases to run the docker image or start/attach container.
+ For those unfamiliar, to restart and enter the toolkit's base terminal on a stopped container, run `docker start {{CONTAINER ID}} && docker attach {{CONTAINER ID}}`.

# Report bugs

+ Email: contact@jinsonvarghese.com
+ Website: https://www.jinsonvarghese.com
+ GitHub: https://github.com/jinsonvarghese/Cybersecurity
