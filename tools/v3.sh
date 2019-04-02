#!/bin/bash
Case $v2ray_transport in
[5-8])
	_transport=$(($v2ray_transport + 1))
	;;
9 | 1[0-5])
	_transport=$(($v2ray_transport + 9))
	;;
16)
	_transport=5
	;;
17)
	_transport=1
	;;
*)
	_transport=$v2ray_transport
	;;
Esac

If [[ $v2ray_transport == 17 ]]; then
	V2ray_id=$(cat /proc/sys/kernel/random/uuid)
Fi

Cat >$backup <<-EOF
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
Mark=v3
#
#

# ---- V2Ray Transmission Protocol-----
V2ray_transport=$_transport

#---- V2Ray Port-----
V2ray_port=$v2ray_port

#---- UUID -----
V2ray_id=$v2ray_id

#---- alterId -----
alterId=$alterId

#---- V2Ray Dynamic Port Start-----
v2ray_dynamicPort_start=$v2ray_dynamicPort_start

#---- V2Ray Dynamic Port End-----
v2ray_dynamicPort_end=$v2ray_dynamicPort_end

#---- Domain Name-----
Domain=$domain

#---- caddy -----
Caddy=$caddy_status

#---- Shadowsocks -----
Shadowsocks=$shadowsocks_status

#---- Shadowsocks Port-----
Ssport=$ssport

#---- Shadowsocks Password-----
Sspass=$sspass

#---- Shadowsocks Encryption Protocol-----
Ssciphers=$ssciphers

#---- Block ads-----
Ban_ad=$blocked_ad_status

#---- Website Camouflage-----
Path_status=$path_status

#---- Camouflaged path -----
Path=$path

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

. $backup
