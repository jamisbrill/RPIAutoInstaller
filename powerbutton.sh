sudo apt update
sudo apt install python3-gpiozero # installpython
#script for button press 
echo "#!/usr/bin/env python3 
from gpiozero import Button
import os
Button(21).wait_for_press()
os.system("sudo poweroff") " >> shutdown-press-simple.py

chmod a+x shutdown-press-simple.py
echo  "echo '~pi/shutdown-press-simple.py'" >> /etc/rc.local
#




#Power button tutorial thanks to , turned into a simple script.
#https://www.makeuseof.com/tag/add-power-button-raspberry-pi/#
