# ServerStatus
PowerShell script that checks the status of Apache2.4 and IIS7 in services.msc.
The script loads the date the status was checked and then add the following services status to a text file. 
Before appending the data, the D partition is checked if it exists. If the partition is existing the text file will be position in that partition, if not then the status.txt file will be written on the same location the script is runned.

For a best use of this script I recommend to implement it with scheduler task.  

run the script in powershell

.\ServerStatus.ps1


# CheckOpenPort 

PowerShell script that scan for open port on your ip address to further identificate the PID that uses that port

run the script in powershell

.\CheckOpenPort.ps1
