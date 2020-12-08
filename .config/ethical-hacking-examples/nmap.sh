#init:
	sudo nmap -sC -sS $IP

#init + vuln:
		sudo nmap -sC -sS --script http-slowloris-check $IP

#vuln:
	sudo nmap --script http-slowloris-check $IP
	sudo nmap --script vuln $IP

#ports:
	sudo nmap -p- $IP

#version:
	sudo nmap -sV $IP

#save in file:
	sudo nmap -sC -sS --script http-slowloris-check -oN scan $IP
