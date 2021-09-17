#!/bin/bash
#slowdns (Dexter Eskalarte)
slow()
{
echo "installing slowdns..."
wget --no-check-certificate "https://raw.githubusercontent.com/EskalarteDexter/Slowdns/main/slowdns.sh/" -O /usr/bin/slowdns
}
slow1()
{
echo "autorekonek-slowdns..."
wget --no-check-certificate "https://raw.githubusercontent.com/EskalarteDexter/Slowdns/main/autorekonek-slowdns.sh" -O /usr/bin/autorekonek-slowdns
}
slow2
{
echo "installing dna-client..."
wget --no-check-certificate "https://raw.githubusercontent.com/EskalarteDexter/Slowdns/main/dns-client-v19" -O /usr/bin/dns-client
}
chmod +x /usr/bin/slowdns
chmod +x /usr/bin/dns-client
chmod +x /usr/bin/autorekonek-slowdns
rm -r ~/install.sh
mkdir -p ~/akun/
touch ~/akun/slowdns.txt
touch ~/akun/ipmodem.txt 
slow
slow1
slow2
sleep 2
echo "install complete"
echo "to start the tool please run the command 'slowdns'"
				
