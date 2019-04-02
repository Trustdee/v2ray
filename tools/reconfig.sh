#!/bin/bash
Uuid=$(cat /proc/sys/kernel/random/uuid)
Cat >/etc/v2ray/233blog_v2ray_backup.conf.tmp <<-EOF
# -----------------------------------
# 警告...Please do not modify or delete this file...thanks
# 警告...Please do not modify or delete this file...thanks
# 警告...Please do not modify or delete this file...thanks
# -----------------------------------

# ---- Remind again----
#大胸弟... If you see this... remember not to modify or change this file

# ---- Description----
#嗯...This file is used to back up some settings.
#我懒... I don't want to use JQ to parse JSON....
# Then extract some important parameters of the V2Ray configuration file
# Then.. When you modify the V2Ray configuration, rewrite it and it will be OK...
#嗯...Stupid way

# ---- V2Ray Transmission Protocol-----
V2ray_transport=$v2ray_transport

#---- V2Ray Port-----
V2ray_port=$v2ray_port

#---- UUID -----
V2ray_id=$uuid

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
Ws_path_status=$is_ws_path

#---- Camouflaged path -----
Ws_path=$ws_path

#---- Disguised URL -----
Proxy_site=$proxy_site
		EOF
Rm -rf $backup
Mv -f /etc/v2ray/233blog_v2ray_backup.conf.tmp /etc/v2ray/233blog_v2ray_backup.conf
Echo
Echo -e " .... wow.. .."
Echo
Echo -e " Please reload the configuration with the command $yellow v2ray reload $none...to avoid the inexplicable problem"
Echo
Exit 1
