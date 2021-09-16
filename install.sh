#!/bin/bash
#slowdns (Wegare)
printf 'ctrl+c' | crontab -e > /dev/null
opkg update && opkg install unzip
cek=$(cat /etc/openwrt_r*)
if [[ $cek == *"LEDE"* ]] && [[ $cek == *"ar71xx"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/lede/ar71xx.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/ar71xx/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/ar71xx
elif [[ $cek == *"LEDE"* ]] && [[ $cek == *"brcm63xx"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/lede/brcm63xx.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/brcm63xx/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/brcm63xx
elif [[ $cek == *"LEDE"* ]] && [[ $cek == *"ramips"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/lede/ramips.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/ramips/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/ramips
elif [[ $cek == *"LEDE"* ]] && [[ $cek == *"sunxi"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/lede/sunxi.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/sunxi/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/sunxi
elif [[ $cek == *"Chaos Calmer"* ]] && [[ $cek == *"ar71xx"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/cc/ar71xx.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/ar71xx/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/ar71xx
elif [[ $cek == *"Chaos Calmer"* ]] && [[ $cek == *"brcm63xx"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/cc/brcm63xx.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/brcm63xx/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/brcm63xx
elif [[ $cek == *"Chaos Calmer"* ]] && [[ $cek == *"ramips"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/cc/ramips.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/ramips/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/ramips
elif [[ $cek == *"Chaos Calmer"* ]] && [[ $cek == *"sunxi"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/cc/sunxi.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/sunxi/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/sunxi
elif [[ $cek == *"OpenWrt"* ]] && [[ $cek == *"aarch64_cortex-a53"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/openwrt/sunxi.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/sunxi/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/sunxi
elif [[ $cek == *"OpenWrt"* ]] && [[ $cek == *"mips_24kc"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/openwrt/ar71xx.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/ar71xx/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/ar71xx
elif [[ $cek == *"OpenWrt"* ]] && [[ $cek == *"mipsel_24kc"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/openwrt/ramips.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/ramips/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/ramips
####elif [[ $cek == *"OpenWrt"* ]] && [[ $cek == *"x86"* ]]; then
#wget --no-check-certificate "https://github.com/wegare123/backup/blob/main/openwrt/i386-pentium.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/i386-pentium/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/i386-pentium
elif [[ $cek == *"OpenWrt"* ]] && [[ $cek == *"x86_64"* ]]; then
wget --no-check-certificate "http://script.psytech-vpn.com/Slowdns/slowfiles/openwrt/x86_64.zip?raw=true" -O ~/ekstrak.zip && unzip ~/ekstrak.zip && cp ~/x86_64/*.ipk ~/ && rm -rf ~/ekstrak.zip && rm -rf ~/x86_64
else
echo -e "your version is not detected!"
exit
fi
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
				
