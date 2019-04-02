#!/bin/bash
Backup="/etc/v2ray/233blog_v2ray_backup.txt"
V2ray_transport=$(sed -n '17p' $backup)
V2ray_port=$(sed -n '19p' $backup)
V2ray_id=$(sed -n '21p' $backup)
v2ray_dynamicPort_start=$(sed -n '23p' $backup)
v2ray_dynamicPort_end=$(sed -n '25p' $backup)
Domain=$(sed -n '27p' $backup)
Caddy_status=$(sed -n '29p' $backup)
Shadowsocks_status=$(sed -n '31p' $backup)
Ssport=$(sed -n '33p' $backup)
Sspass=$(sed -n '35p' $backup)
Ssciphers=$(sed -n '37p' $backup)
Blocked_ad_status=$(sed -n '39p' $backup)
Ws_path_status=$(sed -n '41p' $backup)
Ws_path=$(sed -n '43p' $backup)
Proxy_site=$(sed '$!d' $backup)
If [[ $caddy_status == "true" ]]; then
	Caddy_installed=true
Fi
If [[ $shadowsocks_status == "true" ]]; then
	Shadowsocks=true
Fi
If [[ $blocked_ad_status == "true" ]]; then
	Is_blocked_ad=true
Fi
If [[ $ws_path_status == "true" ]]; then
	Is_ws_path=true
Fi

Cat >/etc/v2ray/233blog_v2ray_backup.conf <<-EOF
# -----------------------------------
# 警告...Please do not modify or delete this file...thanks
# 警告...Please do not modify or delete this file...thanks
# 警告...Please do not modify or delete this file...thanks
# -----------------------------------

# ---- Remind again----
#大胸弟... If you see this... remember not to modify or change this file

# ---- Description----
#嗯...This file is used to back up some settings.
#
#mark=v3
#
#

# ---- V2Ray Transmission Protocol-----
V2ray_transport=$v2ray_transport

#---- V2Ray Port-----
V2ray_port=$v2ray_port

#---- UUID -----
V2ray_id=$v2ray_id

#---- alterId -----
alterId=233

#---- V2Ray Dynamic Port Start-----
v2ray_dynamicPort_start=$v2ray_dynamicPort_start

#---- V2Ray Dynamic Port End-----
v2ray_dynamicPort_end=$v2ray_dynamicPort_end

#---- Domain Name-----
Domain=$domain

#---- caddy -----
Caddy_status=$caddy_installed

#---- Shadowsocks -----
Shadowsocks_status=$shadowsocks

#---- Shadowsocks Port-----
Ssport=$ssport

#---- Shadowsocks Password-----
Sspass=$sspass

#---- Shadowsocks Encryption Protocol-----
Ssciphers=$ssciphers

#---- Block ads-----
Blocked_ad_status=$is_blocked_ad

#---- Website Camouflage-----
Path_status=$is_ws_path

#---- Camouflaged path -----
Path=$ws_path

#---- Disguised URL -----
Proxy_site=$proxy_site

#---- Socks -----
Socks=

#---- Socks Port-----
Socks_port=233

#---- Socks Username-----
Socks_username=233blog

#---- Socks Password-----
Socks_userpass=233blog.com

#---- MTProto -----
Mtproto=

#---- MTProto Port-----
Mtproto_port=233

#---- MTProto User Key -----
Mtproto_secret=lalala

#---- Shield BT -----
Ban_bt=true
		EOF
If [[ -f /usr/local/bin/v2ray ]]; then
	Cp -f /etc/v2ray/233boy/v2ray/v2ray.sh /usr/local/sbin/v2ray
	Chmod +x /usr/local/sbin/v2ray
	Rm -rf $backup
	Rm -rf /usr/local/bin/v2ray
Fi

Echo
Echo -e " Wow... the script is almost stunned..."
Echo
Echo -e "\n $yellow Warning: Please log back in to SSH to avoid the v2ray command not found. $none \n" && exit 1
Echo
Exit 1
