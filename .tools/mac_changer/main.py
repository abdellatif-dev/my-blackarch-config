#! /bin/python3
import subprocess as sub
from sys import argv
from sys import exit
from os import geteuid
from time import sleep

if geteuid() != 0:
    exit("must run as root")

else:
	if len(argv) == 3:
		option = argv[1]
		inter = argv[2]
		options = ["-e", "-a", "-A", "-p", "-r"]

		print(f"changing mac address {inter}\n")
		sleep(1)

		# ifconfig <interfac_name> down
		sub.call(f"ifconfig {inter} down", shell=True)

		# macchanger

		if option in options:
			sub.call(f"macchanger {option} {inter}", shell=True)
		else:
			sub.call(f"ifconfig {inter} up", shell=True)
			exit(f"option {option} is not available")

		sub.call(f"ifconfig {inter} up", shell=True)

		sleep(1)
		print(f"\n{inter} is ready")

	elif argv[1] == "-h":
		print("""-m XX:XX:XX:XX:XX:XX Set the MAC to XX:XX:XX:XX:XX:XX\n-e Don't change the vendor bytes\n-a Set random vendor MAC of the same kind\n-A random vendor MAC of any kind\n-p Reset to original, permanent hardware MAC\n-r Set fully random MAC\n\n-h for help""")

	elif len(argv) == 4 and argv[1] == "-m":
		option = argv[1]
		mac = argv[2]
		inter = argv[3]

		print(f"changing mac address {inter}\n")
		sleep(1)

		sub.call(f"ifconfig {inter} down", shell=True)

		sub.call(f"ifconfig {inter} hw ether {mac}", shell=True)
		sub.call(f"ifconfig {inter}", shell=True)

		sub.call(f"ifconfig {inter} up", shell=True)

		sleep(1)
		print(f"{inter} is ready")

	else:
		print('''usage: changemac <options> <interfac_name>\nchangemac -h for help''')
