#!/bin/bash
#This colour
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
clear
BANNERS () {
printf "${white}
 _______                      ______                 _ 
(_______)                    / _____)               | |
 _____   _____  ___ _   _   ( (____  _____ ____   __| |
|  ___) (____ |/___) | | |   \____ \| ___ |  _ \ / _  |
| |_____/ ___ |___ | |_| |   _____) ) ____| | | ( (_| |
|_______)_____(___/ \__  |  (______/|_____)_| |_|\____|
www.graylife.co    (____/  ${lightgreen} SMTP SENDER FOR LINUX${white}\n
"
}
BANNERS
OPTIONS () {
printf "${lightgreen}[>]${white} SMTP HOST                    : "
read smtp
printf "${lightgreen}[>]${white} PORT                         : "
read port
printf "${lightgreen}[>]${white} USERNAME                     : "
read user
printf "${lightgreen}[>]${white} PASSWORD                     : "
read password
printf "${lightgreen}[>]${white} TLS/SSL (LEAVE IF NONE)      : "
read ssltls
printf "${lightgreen}[>]${white} MAIL FROM                    : "
read mailfrom
printf "${lightgreen}[>]${white} SEND TO                      : "
read mailto
}
OPTIONS
SWAKS_SEND () {
printf "${lightgreen}############## SEND SMTP USING SWAKS ##############${white}\n"
swaks --to $mailto --from $mailfrom -s $smtp:$port $ssltls --body "[LIVE] SMTP SENDER BY GRAYLIFE.CO" -au $user -ap $password
}
SWAKS_SEND
RETURNS () {
printf "${white}WANT TRY OTHER SMTP ? (${lightgreen}Y${white}/${red}N${white}) : "
read return_smtp
if [[ $return_smtp == "Y" ]]; then
clear
BANNERS
OPTIONS
SWAKS_SEND
RETURNS
else
printf "THANKS FOR USING THIS TOOLS ! SEE YOU !\n"
printf "DON'T FORGET TO VISIT HTTPS://GRAYLIFE.CO\n"
exit
fi
}
RETURNS
