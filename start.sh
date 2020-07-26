echo "Welcome to N-Pot Honeypot, Developed by Subhajit"
echo " "
echo "Choose option"
echo "1. Honeypot with Advance Config port + Netdata"
echo "2. Wordpress honeypot"
echo "3. Scan the network "

read useroption


case $useroption in

  1)
echo " "
    echo " "
netdata -p 5555
echo ""
   sudo ./Gamechanger.rb

    ;;

  2)
    echo -n "wordpot" 
    echo " "
   cd wordpot
ls
sudo python wordpot.py
    ;;
  3)
    echo -n "Scan the network" 
    echo " "
	echo "Enter your domain / IP : "
read  domain

  nmap -p-  $domain  > scanresults.txt
cat scanresults.txt 
    ;;
  *)
    echo -n "unknown" 
    echo " "
    ;;
esac
