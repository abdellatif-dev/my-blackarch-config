#hash-identifier:
  hash-identifier

#cracking:
	john --wordlist=~/.tools/wordlists/rockyou.txt hash.txt

#md5:
	john -format=raw-md5 --wordlist=~/.tools/wordlists/rockyou.txt hash.txt

#raw-sha1:
	john -format=raw-sha1 --wordlist=~/.tools/wordlists/rockyou.txt hash.txt

#SHA256:
	john -format=raw-sha256 --wordlist=~/.tools/wordlists/rockyou.txt  hash.txt

#Bcrypt
	john -format=bcrypt --wordlist=~/.tools/wordlists/rockyou.txt  hash.txt

#NTLM:
	john -format=nt --wordlist=~/.tools/wordlists/rockyou.txt  hash.txt

#SHA512:
	john --wordlist=~/.tools/wordlists/rockyou.txt hash.txt
	#$6$<Salt>$<hash>