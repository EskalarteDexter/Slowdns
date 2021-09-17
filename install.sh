#!/bin/bash
#slowdns (Dexter Eskalarte)
wget --no-check-certificate "https://raw.githubusercontent.com/EskalarteDexter/Slowdns/main/slowdns.sh/" -O /usr/bin/slowdns
wget --no-check-certificate "https://raw.githubusercontent.com/EskalarteDexter/Slowdns/main/autorekonek-slowdns.sh" -O /usr/bin/autorekonek-slowdns
wget --no-check-certificate "https://raw.githubusercontent.com/EskalarteDexter/Slowdns/main/dns-client-v19" -O /usr/bin/dns-client
chmod +x /usr/bin/slowdns
chmod +x /usr/bin/dns-client
chmod +x /usr/bin/autorekonek-slowdns
opkg install openvpn-openssl && opkg install ip-full && opkg install openssh-client && opkg install --force-depends *.ipk && opkg install lsof && opkg install fping screen python python3 coreutils-nohup
rm -r ~/*.ipk
rm -r ~/install.sh
mkdir -p ~/akun/
touch ~/akun/slowdns.txt
touch ~/akun/ipmodem.txt 
sleep 2
echo "install complete"
echo "to start the tool please run the command 'slowdns'"
