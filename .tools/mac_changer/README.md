# mac changer

## bash
* sudo ifconfig <interfac_name> down

* sudo ifconfig <interfac_name> hw ether 00:11:22:33:44:55

* or  macchanger <switch> <interfac_name>

### switch 
**  -e,  --ending                 Don't change the vendor bytes
**  -a,  --another                Set random vendor MAC of the same kind
**  -A                            Set random vendor MAC of any kind
**  -p,  --permanent              Reset to original, permanent hardware MAC
**  -r,  --random                 Set fully random MAC



* sudo ifconfig <interfac_name> up
