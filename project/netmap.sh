
#! /bin/bash

#echo "------------------------------------------------------------------------------------------------------"
                    
           # echo -e  "\e[1;33m            
                                              #  Miss(@&%*#+=)you ):-          

#\e[0m"



echo -e "\e[1;33m                                            Vulnerability Detection Tool                                \e[0m     "





#echo "------------------------------------------------------------------------------------------------------"



echo -e "\e[1;33m                                                                                CREATED BY : missyou(nandhu..)  \e[0m"


echo -e  "\e[1;32m    


welcome to vulnerability scanner:)-                      


 \e[0m"


echo -e "\e[1;34mStarting to run the script...\e[0m"




spinner() {
    local i sp n
    sp='missyou '
    n=${#sp}
    printf ' '
    while sleep 0.05; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

printf 'setting up weapons '
spinner &

sleep 4  # sleeping for 10 seconds is important work

kill "$!" # kill the spinner
printf '\n'




# VARIABLE ASSIGNMENT
# Show hostname:
HOST=$(hostname)
# User executing the script:
CURRENTUSER=$(whoami)
# Current date:
CURRENTDATE=$(date +%F)
# Host IP address:
IPADDRESS=$(hostname -I | cut -d ' ' -f1)

# SHOW MESSAGES
echo "Today is $CURRENTDATE"
echo "Hostname: $HOST ($IPADDRESS)"

sleep 1
echo "Enter  Target IP Address:"
read iptarget


if [[ $iptarget =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Valid IP Address"
else
  echo "Invalid IP Address. Quitting..."
  exit
fi


#INFINITE LOOP
for (( ; ; ))
do
{
#STARTING

echo -e "\e[1;33m [0]  Ping Scan (Check Whether Host is Up)\e[0m"
echo -e "\e[1;33m [1]  Simple Port Scan \e[0m"
echo -e "\e[1;33m [2]  Stealth Port Scan \e[0m"
echo -e "\e[1;31m [3]  Version Detection\e[0m"
echo -e "\e[1;33m [4]  Whois Lookup \e[0m"
echo -e "\e[1;33m [5]  Os scan \e[0m"
echo -e "\e[1;33m [6]  Nslookup \e[0m"
echo -e "\e[1;37m [7]  Vuln scan using all ports\e[0m"
echo -e "\e[1;31m [8]  Check Directories and Subdomains (Dirb)(write 8 for http and 8s for https) \e[0m"
echo -e "\e[1;31m [9]  Nikto Tool\e[0m"
echo -e "\e[1;31m [10] SQLMAP (Check for Sql Injection Vulnerabilities)\e[0m"
echo -e "\e[1;31m [11] Aggressive Scan (or) Deep Scan \e[0m"
echo -e "\e[1;33m [12]  Discoverying Network \e[0m"
echo -e "\e[1;36m [f]  Fix Missing Files and Install Required Tools \e[0m"
echo -e "\e[1;35m [x]  EXIT \e[0m"
echo "-"
echo -e "\e[1;37m Yellow [] are safe to use, while Red [] should be done only if you have permission, because these scans might be illegal in your Country \e[0m"
echo "-"

echo "Enter  your Option:"
read option

if [ "$option" = 0 ];
then
    nmap -sn -Pn $iptarget
fi

if [ "$option" = 1 ];
then
   sudo nmap -p1-1000 -Pn $iptarget
fi

if [ "$option" = 2 ];
then
    sudo nmap -sS -Pn $iptarget
fi

if [ "$option" = 3 ];
then
    nmap -sV -Pn -T4 $iptarget   
fi

if [ "$option" = 4 ];
then
       whois $iptarget
fi

if [ "$option" = 5 ];
then
 #    echo "NS"
  #   host -t ns google.com
   #  echo "MX"  
    # host -t mx google.com
    sudo nmap -O  -T4 -Pn   $iptarget  
fi

if [ "$option" = 6 ];
then
     nslookup $iptarget  
fi

if [ "$option" = 7 ];
then
     nmap --script=vuln -sC -p- -Pn  $iptarget  
fi

if [ "$option" = 8 ];
then
     dirb http://$iptarget
 
fi

if [ "$option" = "8s" ];
then
     dirb https://$iptarget
 
fi

if [ "$option" = 9 ];
then
     nikto -host $iptarget
 
fi

if [ "$option" = 10 ];
then
     sqlmap $iptarget
fi
if [ "$option" = 11 ];
then
 nmap -sV -A -p- -T4 -Pn  $iptarget
 
 fi


 if [ "$option" = 12 ];
then
   sudo netdiscover -r $iptarget
fi



if [ "$option" = "f" ];
then
     apt-get install -y nmap
     apt-get install -y nslookup
     apt-get install -y whois
     apt-get install -y ipcalc
     apt-get install -y nikto 
     apt-get install -y dirb  
     apt-get install -y sqlmap  
     echo "Done"
     break  
fi

if [ "$option" = "x" ];
then
     echo "Quitting (OR) miss ou):-"
     break  
fi

echo "-------------------------------------------------------------------"
read -n 1 -s -r -p "Press any key to continue..."
clear


                      

}
done
#INFINITE LOOP


