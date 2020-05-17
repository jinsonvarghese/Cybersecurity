#!/bin/bash
if [ $# -eq 0 ]
  then
    echo ""
    echo "Please provide a target to scan."
    echo "Syntax: vapt google.com"
    echo ""
    exit
fi
if echo $1 | grep -q "https://\|http://\|www.\|HTTPS://\|HTTP://\|WWW."
then
	echo ""
	echo "Syntax Error!"
	echo "Please strip the protocol and provide just the domain name. Example: google.com"
	echo ""
	exit
fi
echo ""
echo "-------------------------Vulnerability Assessment & Penetration Testing Toolkit-------------------------"
echo "----------------------------------------Jinson Varghese Behanan-----------------------------------------"
echo "------------------------------------https://www.jinsonvarghese.com/-------------------------------------"
echo ""
echo ""
url=$1
echo ""
echo ""
echo "Checking for HTTP Security Headers:"
echo ""
echo ""
if curl -s -I $url | grep -q "Moved Permanently\|302 Found\|Moved Temporarily"
then
	if curl -s -I https://www.$url | grep -q "strict-transport-security\|Strict-Transport-Security"
	then
		echo "Strict Transport Security Header is Present."
		echo ""
	else
		echo "Strict Transport Security Header is Missing."
		echo ""
	fi
	if curl -s -I https://www.$url | grep -q "x-frame-options\|X-Frame-Options"
	then
		echo "X-Frame-Options Header is Present."
		echo ""
	else
		echo "X-Frame-Options Header is Missing."
		echo ""
	fi
	if curl -s -I https://www.$url | grep -q "x-xss-protection\|X-XSS-Protection"
	then
		echo "X-XSS-Protection Header is Present."
		echo ""
	else
		echo "X-XSS-Protection Header is Missing."
		echo ""
	fi
	if curl -s -I https://www.$url | grep -q "x-content-type-options\|X-Content-Type-Options"
	then
		echo "X-Content-Type-Option Header is Present."
		echo ""
	else
		echo "X-Content-Type-Option Header is Missing."
		echo ""
	fi
else
	if curl -s -I $url | grep -q "strict-transport-security\|Strict-Transport-Security" 
	then
		echo "Strict Transport Security Header is Present."
		echo ""
	else
		echo "Strict Transport Security Header is Missing."
		echo ""
	fi
	if curl -s -I $url | grep -q "x-frame-options\|X-Frame-Options"
	then
		echo "X-Frame-Options Header is Present."
		echo ""
	else
		echo "X-Frame-Options Header is Missing."
		echo ""
	fi
	if curl -s -I $url | grep -q "x-xss-protection\|X-XSS-Protection"
	then
		echo "X-XSS-Protection Header is Present."
		echo ""
	else
		echo "X-XSS-Protection Header is Missing."
		echo ""
	fi
	if curl -s -I $url | grep -q "x-content-type-options\|X-Content-Type-Options"
	then
		echo "X-Content-Type-Option Header is Present."
		echo ""
	else
		echo "X-Content-Type-Option Header is Missing."
		echo ""
	fi
fi
echo ""
echo "==========================================================================="
echo ""
echo "Checking Subdomains:"
echo ""
amass enum -d $url
echo ""
echo "==========================================================================="
echo ""
echo "Running SSL Tests:"
testssl.sh $url
echo ""
echo "==========================================================================="
echo ""
echo ""
echo "Running Nmap Scripts:"
echo ""
echo ""
echo "Basic Nmap Scan:"
echo ""
nmap -sV -Pn $url
echo ""
echo ""
echo "Scanning for Vulnerable Services:"
echo ""
nmap --script nmap-vulners -sV $url
echo ""
echo ""
echo "Cipher Test:"
echo ""
nmap -sV --script ssl-enum-ciphers -p 443 $url
echo ""
echo ""
echo "Diffie Hellman Test:"
echo ""
nmap --script ssl-dh-params $url
echo ""
echo ""
echo "DNS-Brute Test:"
echo ""
nmap -p 80 --script dns-brute.nse $url
echo ""
echo ""
echo "Heartbleed Test:"
echo ""
nmap -p 443 --script ssl-heartbleed $url
echo ""
echo ""
echo "HTTP-ENUM Test:"
echo ""
nmap --script http-enum $url
echo ""
echo ""
echo "HTTP-Title Test:"
echo ""
nmap --script http-title -sV -p 80 $url
echo ""
echo ""
echo "Slowris Test:"
echo ""
nmap -Pn --script http-slowloris-check $url
echo ""
echo ""
echo "Poodle Test:"
echo ""
nmap -sV --version-light --script ssl-poodle -p 443 $url
echo ""
echo ""
echo "==========================================================================="
echo ""
echo ""
echo "Running Nikto:"
echo ""
nikto -h $url
echo ""
echo ""
echo "All tests have been completed."
echo ""
echo ""
exit
