-- Most of this code is comments
-- I am writing this for Noemi class, PUC-Rio

-- Download ESPlorer on this page:
-- https://esp8266.ru/esplorer/
-- To run you will need at least Java 7 installed

------------- Ubuntu ------------------
-- Unzip the file
-- Go to the ESPlorer folder via terminal and run
-- java -jar ESPlorer.jar
-- Select 115200 as baud rate (the default is 9600)
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
-- Let say that your port is "/dev/ttyUSB0"
-- You can check your permissions running via terminal:
--      ls -l /dev/ttyUSB0
-- In case you don't have permission not,
-- you can get permission running via terminal:
--      sudo chmod ugo+rwx /dev/ttyUSB0
-- You may want to check if the permission changed
-- And anything that you do may change permission back
-- (remove usb/reset esp8266/time without using/...)
-- Now try clicking "open" again and if still appears
-- "Communication with MCU..." forever
-- Try pressing the reset button on esp8266

-- If this didn't help, good luck you are on your own
