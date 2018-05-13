-- Most of this code is comments
-- I am writing this for Noemi class, PUC-Rio

-- Download ESPlorer on this page:
-- https://esp8266.ru/esplorer/
-- To run you will need at least Java 7 installed

------------- Ubuntu ------------------
-- Unzip the file
-- Go to the ESPlorer folder via terminal and run
-- 	java -jar ESPlorer.jar
-- Select 115200 as baud rate (the default is 9600)
-- Click on the "reload" button (close to the AutoScroll)
-- Select your USB port for the esp8266 (mine is /dev/ttyUSB0)
-- Click the big button "open" and will change to "close"
-- If everything went perfect:
-- you can write code on the left,
-- click "upload",
-- select your file .lua to upload
-- click on "reload" to update the esp8266,
-- and click on your file name button to run it

------------- Ubuntu problems ---------
-- You can find a problem when clicking on "open"
-- "Communication with MCU..." forever
-- Try pressing the reset button on esp8266

-- If it didn't help, probably you don't have
-- permission to execute/write/read from this USB port
-- Let's say that your port is "/dev/ttyUSB0"
-- You can check your permissions running via terminal:
--      ls -l /dev/ttyUSB0
-- In case you don't have permission,
-- you can get permission running via terminal:
--      sudo chmod ugo+rwx /dev/ttyUSB0
-- You may want to check if the permission changed
-- And anything that you do may change permission back
-- (remove usb/reset esp8266/time without using/...)
-- Now try clicking "open" again and if still appears
-- "Communication with MCU..." forever
-- Try pressing the reset button on esp8266

-- If your esp8266 have a led, like mine,
-- and is blinking after you connect to the computer
-- or started blinking after doing anything,
-- this probably means that is loosing connection
-- with the USB port, you can check by reloading
-- without stopping to see if your port disappears
-- In this case you should remove your isp8266,
-- wait ~5 seconds and connect again

-- One probably you may have is
-- every time you reset by pressing the button
-- on esp8266, your USB port change
-- Better disconnect the USB and try the same
-- as above

-- If this didn't help, good luck you are on your own

print("Testing")
