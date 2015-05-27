# la: list all
#   -A show all files except . and ..
#   -F file type indicator
#   -G colorized output
#   -h human readable file sizes
#   -l long format
alias la='ls -AFGhl'

# rpi: ssh to raspberry pi
alias rpi='ssh pi@192.168.1.11'

# rpi-scan: scan for open IP addresses to find the raspberry pi
#   -p 22 --open      scan for open port 22's
#   -sV               probe open ports to determine service/version info
#   192.168.0-3.0-20  the range of IP addresses to scan
alias rpi-scan='nmap -p 22 --open -sV 192.168.0-3.0-20'

# encode: encode file
#   for example: `enc -in infile.txt -out oufile.enc`
alias enc='openssl aes-256-cbc -a'
# decode
alias dec='openssl aes-256-cbc -a -d'
