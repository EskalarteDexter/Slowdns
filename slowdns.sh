#!/bin/bash
#slowdns (Dexter Eskalarte)
stop () {
host="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $1}')" 
route="$(cat /root/akun/ipmodem.txt | grep -i ipmodem | cut -d= -f2 | tail -n1)" 
killall -q badvpn-tun2socks dns-client fping
route del 1.1.1.1 gw "$route" metric 0 2>/dev/null
route del "$host" gw "$route" metric 0 2>/dev/null
ip link delete tun1 2>/dev/null
/etc/init.d/dnsmasq restart 2>/dev/null
}
host2="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $1}')" 
user2="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $2}')" 
pass2="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $3}')" 
ns2="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $4}')" 
udp2="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $5}')"
pubkey2="$(cat /root/akun/server.pub)" 
clear
echo '
 /$$$$$$$                       /$$                        
| $$__  $$                     | $$                        
| $$  \ $$  /$$$$$$  /$$   /$$/$$$$$$    /$$$$$$   /$$$$$$ 
| $$  | $$ /$$__  $$|  $$ /$$/_  $$_/   /$$__  $$ /$$__  $$
| $$  | $$| $$$$$$$$ \  $$$$/  | $$    | $$$$$$$$| $$  \__/
| $$  | $$| $$_____/  >$$  $$  | $$ /$$| $$_____/| $$      
| $$$$$$$/|  $$$$$$$ /$$/\  $$ |  $$$$/|  $$$$$$$| $$      
|_______/  \_______/|__/  \__/  \___/   \_______/|__/ 
'
echo "Inject slowdns by: Dexter Eskalarte"
echo "1. Sett Profile"
echo "2. Start Inject"
echo "3. Stop Inject"
echo "4. Enable auto booting & auto rekonek"
echo "5. Disable auto booting & auto rekonek"
echo "e. exit"
read -p "(default tools: 2) : " tools
[ -z "${tools}" ] && tools="2"
if [ "$tools" = "1" ]; then

echo "Enter ip/host" 
read -p "default ip/host: $host2 : " host
[ -z "${host}" ] && host="$host2"

echo "Enter username" 
read -p "default username: $user2 : " user
[ -z "${user}" ] && user="$user2"

echo "Enter password" 
read -p "default password: $pass2 : " pass
[ -z "${pass}" ] && pass="$pass2"

echo "Enter NS" 
read -p "default NS: $ns2 : " ns
[ -z "${ns}" ] && ns="$ns2"

echo "Enter pubkey" 
read -p "default pubkey: $pubkey2 : " pubkey
[ -z "${pubkey}" ] && pubkey="$pubkey2"

echo "Enter udpgw port" 
read -p "default udpgw: $udp2 : " udp
[ -z "${udp}" ] && udp="$udp2"
badvpn="badvpn-tun2socks --tundev tun1 --netif-ipaddr 10.0.0.2 --netif-netmask 255.255.255.0 --socks-server-addr 127.0.0.1:1080 --udpgw-remote-server-addr 127.0.0.1:$udp --udpgw-connection-buffer-size 65535 --udpgw-transparent-dns &"

echo "$pubkey" > /root/akun/server.pub
echo "$host
$user
$pass
$ns
$udp" > /root/akun/slowdns.txt
cat <<EOF> /usr/bin/gproxy-slowdns
$badvpn
EOF
chmod +x /usr/bin/gproxy-slowdns
echo "Set Profile Success"
sleep 2
clear
/usr/bin/slowdns
elif [ "${tools}" = "2" ]; then
cek="$(cat /root/akun/slowdns.txt)"
if [[ -z $cek ]]; then
echo "You haven't created a profile yet"
exit
fi
stop
ipmodem="$(route -n | grep -i 0.0.0.0 | head -n1 | awk '{print $2}')" 
echo "ipmodem=$ipmodem" > /root/akun/ipmodem.txt
host="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $1}')" 
user="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $2}')" 
pass="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $3}')" 
ns="$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $4}')" 
route="$(cat /root/akun/ipmodem.txt | grep -i ipmodem | cut -d= -f2 | tail -n1)"
dns-client -udp 1.1.1.1:53 -pubkey-file /root/akun/server.pub $ns 127.0.0.1:2222 &
sleep 3
sshpass -p $pass ssh -N -D 127.0.0.1:1080 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o HostKeyAlias=$host -p 2222 "$user"@127.0.0.1 &
sleep 5
echo ""
echo "is connecting to the internet"
ip tuntap add dev tun1 mode tun
ifconfig tun1 10.0.0.1 netmask 255.255.255.0
/usr/bin/gproxy-slowdns
route add 1.1.1.1 gw "$route" metric 0
route add "$host" gw "$route" metric 0
route add default gw 10.0.0.2 metric 0
    
echo "#!/bin/bash
#sts (Dexter Eskalarte)
host=$(cat /root/akun/slowdns.txt | tr '\n' ' '  | awk '{print $1}')
fping -l $host" > /usr/bin/ping-slowdns
chmod +x /usr/bin/ping-slowdns
/usr/bin/ping-slowdns > /dev/null 2>&1 &
elif [ "${tools}" = "3" ]; then
stop
echo "Stop Success"
sleep 2
clear
/usr/bin/slowdns
elif [ "${tools}" = "4" ]; then
cat <<EOF>> /etc/crontabs/root

# BEGIN AUTORECONNECT SLOWDNS
*/1 * * * *  autorekonek-slowdns
# END AUTORECONNECT SLOWDNS
EOF
sed -i '/^$/d' /etc/crontabs/root 2>/dev/null
/etc/init.d/cron restart
echo "Enable Success"
sleep 2
clear
/usr/bin/slowdns
elif [ "${tools}" = "5" ]; then
sed -i "/^# BEGIN AUTOREKONEKSLOWDNS/,/^# END AUTORECONNECT SLOWDNS/d" /etc/crontabs/root > /dev/null
/etc/init.d/cron restart
echo "Disable Success"
sleep 2
clear
/usr/bin/slowdns
elif [ "${tools}" = "e" ]; then
clear
exit
else 
echo -e "$tools: invalid selection."
exit
fi