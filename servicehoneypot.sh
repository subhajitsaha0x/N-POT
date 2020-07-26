echo "N-POT Starting ............"
echo "  "
echo "  "
echo "  "
sleep  1
echo "Enter host IP :  example.com / 127.0.0.1"
echo "  "
read hostdetails
sleep 3
echo "Scanning network for any existing threats  .................."
echo "  "
echo "  "
echo "Deploying Nmap ...."
sudo nmap -sVC  $hostdetails > scanresults.txt
echo "  "
echo "Launching Network Honeypot ............."
sleep 1
echo "Please wait we are cloning ports and services..... "
sleep 1
echo " "
cat scanresults.txt
echo " "
echo "  "
echo "Logs saved into scanresults.txt"
sleep 1
echo "  "
echo "Choose any one option :"
echo "  "
echo "1. Host is using wordpress "
echo "2. Other "
read wordpress
case $wordpress in

  1) 	echo "Enumerating host directories and vulnerabilities.................."
	echo "  "
	wpscan --url  $hostdetails  >  wordpress_scan_results.txt
	echo "  "
	echo "Checking for open directories and vulnerabilities...................."
	echo "  "
	dirb http://$hostdetails > directories.txt
	echo "  "
	echo "Saved into directories.txt"
	echo "  "
	echo -n "wordpot is starting..." 
    	echo " "
   	cd wordpot
	ls
	sudo python wordpot.py
    ;;

 2) 	echo " "
	echo "Enumerating host directories and vulnerabilities.............."
	echo "  "
	wpscan --url  $hostdetails  >  wordpress_scan_results.txt
	echo "  "
	echo "Checking for open directories and vulnerabilities....................."
	echo "  "
	dirb http://$hostdetails > directories.txt
	echo "  "
	echo "Saved into directories.txt"
	echo "  "
	echo -n "wordpot is starting..." 
    	echo " "
   	
    	echo " Netdata started"
	netdata -p 5555
		echo "  "
	echo "honeypot is starting"
  	 sudo ./NPOT.rb
    ;;
  *)
    echo -n "unknown" 
    echo " "
    ;;
esac