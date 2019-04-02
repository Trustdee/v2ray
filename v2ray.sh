#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta = '\ e [95m'
cyan='\e[96m'
none='\e[0m'

# Root
[[ $(id -u) != 0 ]] && echo -e " Oops... Please use ${red}root ${none}user to run ${yellow}~(^_^) ${none}" && Exit 1

_version="v3.09"

cmd="apt-get"

sys_bit=$(uname -m)

if [[ $sys_bit == "i386" || $sys_bit == "i686" ]]; then
	v2ray_bit="32"
elif [[ $sys_bit == "x86_64" ]]; then
	v2ray_bit="64"
else
	Echo -e " Haha... This ${red} spicy chicken script ${none} does not support your system. ${yellow}(-_-) ${none}" && exit 1
be

if [[ -f /usr/bin/yum ]]; then

	cmd="yum"

be

backup="/etc/v2ray/233blog_v2ray_backup.conf"

if [[ -f /usr/bin/v2ray/v2ray && -f /etc/v2ray/config.json ]] && [[ -f $backup && -d /etc/v2ray/233boy/v2ray ]]; then

	. $backup

elif [[ -f /usr/bin/v2ray/v2ray && -f /etc/v2ray/config.json ]] && [[ -f /etc/v2ray/233blog_v2ray_backup.txt && -d /etc/v2ray/233boy/v2ray ]]; then

	. /etc/v2ray/233boy/v2ray/tools/v1xx_to_v3xx.sh

else
	Echo -e " Oh, oh yeah... ${red} error... please reinstall V2Ray${none} ${yellow}~(^_^) ${none}" && exit 1
be

if [[ $mark != "v3" ]]; then
	. /etc/v2ray/233boy/v2ray/tools/v3.sh
be
if [[ $v2ray_transport -ge 18 ]]; then
	dynamicPort=true
	port_range="${v2ray_dynamicPort_start}-${v2ray_dynamicPort_end}"
be
if [[ $path_status ]]; then
	is_path=true
be

uuid=$(cat /proc/sys/kernel/random/uuid)
old_id="e55c8d17-2cf3-b21a-bcf1-eeacb011ed79"
v2ray_server_config="/etc/v2ray/config.json"
v2ray_client_config="/etc/v2ray/233blog_v2ray_config.json"
v2ray_pid=$(pgrep -f /usr/bin/v2ray/v2ray)
caddy_pid=$(pgrep -f /usr/local/bin/caddy)
_v2ray_sh="/usr/local/sbin/v2ray"
v2ray_ver="$(/usr/bin/v2ray/v2ray -version | head -n 1 | cut -d " " -f2)"
. /etc/v2ray/233boy/v2ray/src/init.sh
systemd=true
# _test=true

if [[ $v2ray_ver != v* ]]; then
	v2ray_ver="v$v2ray_ver"
be
if [[ ! -f $_v2ray_sh ]]; then
	mv -f /usr/local/bin/v2ray $_v2ray_sh
	chmod +x $_v2ray_sh
	Echo -e "\n $yellow Warning: Please log back in to SSH to avoid the v2ray command not found. $none \n" && exit 1
be

if [ $v2ray_pid ]; then
	V2ray_status="$green is running $none"
else
	V2ray_status="$red is not running $none"
be
if [[ $v2ray_transport == [45] && $caddy ]] && [[ $caddy_pid ]]; then
	Caddy_run_status="$green is running $none"
else
	Caddy_run_status="$red is not running $none"
be

_load transport.sh
ciphers=(
	aes-128-cfb
	aes-256-cfb
	chacha20
	chacha20-ietf
	aes-128-gcm
	aes-256-gcm
	chacha20-ietf-poly1305
)

get_transport_args() {
	_load v2ray-info.sh
	_v2_args
}
create_vmess_URL_config() {

	[[ -z $net ]] && get_transport_args

	if [[ $v2ray_transport == [45] ]]; then
		cat >/etc/v2ray/vmess_qr.json <<-EOF
		{
			"v": "2",
			"ps": "v2ray6.com_${domain}",
			"add": "${domain}",
			"port": "443",
			"id": "${v2ray_id}",
			"aid": "${alterId}",
			"net": "${net}",
			"type": "none",
			"host": "${domain}",
			"path": "$_path",
			"tls": "tls"
		}
		EOF
	else
		[[ -z $ip ]] && get_ip
		cat >/etc/v2ray/vmess_qr.json <<-EOF
		{
			"v": "2",
			"ps": "v2ray6.com_${ip}",
			"add": "${ip}",
			"port": "${v2ray_port}",
			"id": "${v2ray_id}",
			"aid": "${alterId}",
			"net": "${net}",
			"type": "${header}",
			"host": "${host}",
			"path": "",
			"tls": ""
		}
		EOF
	be
}
view_v2ray_config_info() {

	_load v2ray-info.sh
	_v2_args
	_v2_info
}
get_shadowsocks_config() {
	if [[ $shadowsocks ]]; then

		while :; do
			echo
			Echo -e "$yellow 1. $noneView Shadowsocks configuration information"
			echo
			Echo -e "$yellow 2. $none generates QR code link"
			echo
			Read -p "$(echo -e "Please select [${magenta}1-2$none]:")" _opt
			if [[ -z $_opt ]]; then
				error
			else
				case $_opt in
				1)
					view_shadowsocks_config_info
					break
					;;
				2)
					get_shadowsocks_config_qr_link
					break
					;;
				*)
					error
					;;
				esac
			be

		done
	else
		shadowsocks_config
	be
}
view_shadowsocks_config_info() {
	if [[ $shadowsocks ]]; then
		_load ss-info.sh
	else
		shadowsocks_config
	be
}
get_shadowsocks_config_qr_link() {
	if [[ $shadowsocks ]]; then
		get_ip
		_load qr.sh
		_ss_qr
	else
		shadowsocks_config
	be

}

get_shadowsocks_config_qr_ask() {
	echo
	while :; do
		Echo -e "Do you need to generate $yellow Shadowsocks configuration information $none QR code link [${magenta}Y/N$none]"
		read -p "$(echo -e "默认 [${magenta}N$none]:")" y_n
		[ -z $y_n ] && y_n="n"
		if [[ $y_n == [Yy] ]]; then
			get_shadowsocks_config_qr_link
			break
		elif [[ $y_n == [Nn] ]]; then
			break
		else
			error
		be
	done

}
change_shadowsocks_config() {
	if [[ $shadowsocks ]]; then

		while :; do
			echo
			Echo -e "$yellow 1. $none to modify the Shadowsocks port"
			echo
			Echo -e "$yellow 2. $none to modify the Shadowsocks password"
			echo
			Echo -e "$yellow 3. $none to modify the Shadowsocks encryption protocol"
			echo
			echo -e "$yellow 4. $none关闭 Shadowsocks"
			echo
			Read -p "$(echo -e "Please select [${magenta}1-4$none]:")" _opt
			if [[ -z $_opt ]]; then
				error
			else
				case $_opt in
				1)
					change_shadowsocks_port
					break
					;;
				2)
					change_shadowsocks_password
					break
					;;
				3)
					change_shadowsocks_ciphers
					break
					;;
				4)
					disable_shadowsocks
					break
					;;
				*)
					error
					;;
				esac
			be

		done
	else

		shadowsocks_config
	be
}
shadowsocks_config() {
	echo
	echo
	Echo -e " $red big... you didn't configure Shadowsocks $none... but now you can configure it ^_^"
	echo
	echo

	while :; do
		Echo -e "Do you configure ${yellow}Shadowsocks${none} [${magenta}Y/N$none]"
		read -p "$(echo -e "(默认 [${cyan}N$none]):") " install_shadowsocks
		[[ -z "$install_shadowsocks" ]] && install_shadowsocks="n"
		if [[ "$install_shadowsocks" == [Yy] ]]; then
			echo
			shadowsocks=true
			shadowsocks_port_config
			shadowsocks_password_config
			shadowsocks_ciphers_config
			pause
			open_port $new_ssport
			backup_config +ss
			ssport=$new_ssport
			sspass=$new_sspass
			ssciphers=$new_ssciphers
			config
			clear
			view_shadowsocks_config_info
			# get_shadowsocks_config_qr_ask
			break
		elif [[ "$install_shadowsocks" == [Nn] ]]; then
			echo
			Echo -e " $green has unconfigured Shadowsocks ....$none"
			echo
			break
		else
			error
		be

	done
}
shadowsocks_port_config() {
	local random=$(shuf -i20001-65535 -n1)
	while :; do
		Echo -e "Please enter "$yellow"Shadowsocks"$none" port["$magenta"1-65535"$none"], not the same as "$yellow"V2ray"$none" port"
		Read -p "$(echo -e " (default port: ${cyan}${random}$none):") " new_ssport
		[ -z "$new_ssport" ] && new_ssport=$random
		case $new_ssport in
		$v2ray_port)
			echo
			Echo -e " can't be the same as $cyan V2Ray port $none...."
			echo
			Echo -e " current V2Ray port: ${cyan}$v2ray_port${none}"
			error
			;;
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			if [[ $v2ray_transport == [45] ]]; then
				local tls=ture
			be
			if [[ $tls && $new_ssport == "80" ]] || [[ $tls && $new_ssport == "443" ]]; then
				echo
				Echo -e "Because you are currently using "$green" WebSocket + TLS $none or $green HTTP/2"$none" transport protocol."
				echo
				Echo -e "so you can't select "$magenta"80"$none" or "$magenta"443"$none" port"
				error
			elif [[ $dynamicPort ]] && [[ $v2ray_dynamicPort_start == $new_ssport || $v2ray_dynamicPort_end == $new_ssport ]]; then
				echo
				Echo -e " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: ${cyan}$port_range${none}"
				error
			elif [[ $dynamicPort ]] && [[ $v2ray_dynamicPort_start -lt $new_ssport && $new_ssport -le $v2ray_dynamicPort_end ]]; then
				echo
				Echo -e " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: ${cyan}$port_range${none}"
				error
			elif [[ $socks && $new_ssport == $socks_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the Socks port...current Socks port: ${cyan}$socks_port$none"
				error
			elif [[ $mtproto && $new_ssport == $mtproto_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the MTProto port...current MTProto port: ${cyan}$mtproto_port$none"
				error
			else
				echo
				echo
				echo -e "$yellow Shadowsocks 端口 = $cyan$new_ssport$none"
				echo "----------------------------------------------------------------"
				echo
				break
			be
			;;
		*)
			error
			;;
		esac

	done

}

shadowsocks_password_config() {

	while :; do
		Echo -e "Please enter "$yellow"Shadowsocks"$none" password"
		Read -p "$(echo -e " (default password: ${cyan}233blog.com$none)"): " new_sspass
		[ -z "$new_sspass" ] && new_sspass="233blog.com"
		case $new_sspass in
		*[/$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the password can not contain $red / $none or $red $ $none these two symbols...."
			echo
			error
			;;
		*)
			echo
			echo
			echo -e "$yellow Shadowsocks 密码 = $cyan$new_sspass$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		esac

	done

}

shadowsocks_ciphers_config() {

	while :; do
		Echo -e "Please select "$yellow"Shadowsocks"$none" encryption protocol [${magenta}1-7$none]"
		for ((i = 1; i <= ${#ciphers[*]}; i++)); do
			ciphers_show="${ciphers[$i - 1]}"
			echo
			echo -e "$yellow $i. $none${ciphers_show}"
		done
		echo
		Read -p "$(echo -e " (default encryption protocol: ${cyan}${ciphers[6]}$none)"):" ssciphers_opt
		[ -z "$ssciphers_opt" ] && ssciphers_opt=7
		case $ssciphers_opt in
		[1-7])
			new_ssciphers=${ciphers[$ssciphers_opt - 1]}
			echo
			echo
			Echo -e "$yellow Shadowsocks Encryption Protocol = $cyan${new_ssciphers}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		*)
			error
			;;
		esac

	done
}

change_shadowsocks_port() {
	echo
	while :; do
		echo -e "请输入 "$yellow"Shadowsocks"$none" 端口 ["$magenta"1-65535"$none"]"
		Read -p "$(echo -e "(current port: ${cyan}$ssport$none):") " new_ssport
		[ -z "$new_ssport" ] && error && continue
		case $new_ssport in
		$ssport)
			echo
			Echo " Same as the current port....modify a chicken"
			error
			;;
		$v2ray_port)
			echo
			Echo -e " can't be the same as $cyan V2Ray port $none...."
			error
			;;
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			if [[ $v2ray_transport == [45] ]]; then
				local tls=ture
			be
			if [[ $tls && $new_ssport == "80" ]] || [[ $tls && $new_ssport == "443" ]]; then
				echo
				Echo -e "Because you have chosen "$green"WebSocket + TLS $none or $green HTTP/2"$none" transport protocol."
				echo
				Echo -e "so you can't select "$magenta"80"$none" or "$magenta"443"$none" port"
				error
			elif [[ $dynamicPort ]] && [[ $v2ray_dynamicPort_start == $new_ssport || $v2ray_dynamicPort_end == $new_ssport ]]; then
				echo
				Echo -e " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: ${cyan}$port_range${none}"
				error
			elif [[ $dynamicPort ]] && [[ $v2ray_dynamicPort_start -lt $new_ssport && $new_ssport -le $v2ray_dynamicPort_end ]]; then
				echo
				Echo -e " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: ${cyan}$port_range${none}"
				error
			elif [[ $socks && $new_ssport == $socks_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the Socks port...current Socks port: ${cyan}$socks_port$none"
				error
			elif [[ $mtproto && $new_ssport == $mtproto_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the MTProto port...current MTProto port: ${cyan}$mtproto_port$none"
				error
			else
				echo
				echo
				echo -e "$yellow Shadowsocks 端口 = $cyan$new_ssport$none"
				echo "----------------------------------------------------------------"
				echo
				pause
				backup_config ssport
				del_port $ssport
				open_port $new_ssport
				ssport=$new_ssport
				config
				clear
				view_shadowsocks_config_info
				# get_shadowsocks_config_qr_ask
				break
			be
			;;
		*)
			error
			;;
		esac

	done
}
change_shadowsocks_password() {
	echo
	while :; do
		Echo -e "Please enter "$yellow"Shadowsocks"$none" password"
		Read -p "$(echo -e "(current password: ${cyan}$sspass$none)"): " new_sspass
		[ -z "$new_sspass" ] && error && continue
		case $new_sspass in
		$sspass)
			echo
			Echo " Same as the current password....modify a chicken"
			error
			;;
		*[/$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the password can not contain $red / $none or $red $ $none these two symbols...."
			echo
			error
			;;
		*)
			echo
			echo
			echo -e "$yellow Shadowsocks 密码 = $cyan$new_sspass$none"
			echo "----------------------------------------------------------------"
			echo
			pause
			backup_config sspass
			sspass=$new_sspass
			config
			clear
			view_shadowsocks_config_info
			# get_shadowsocks_config_qr_ask
			break
			;;
		esac

	done

}

change_shadowsocks_ciphers() {
	echo
	while :; do
		Echo -e "Please select "$yellow"Shadowsocks"$none" encryption protocol [${magenta}1-${#ciphers[*]}$none]"
		for ((i = 1; i <= ${#ciphers[*]}; i++)); do
			ciphers_show="${ciphers[$i - 1]}"
			echo
			echo -e "$yellow $i. $none${ciphers_show}"
		done
		echo
		Read -p "$(echo -e "(current encryption protocol: ${cyan}${ssciphers}$none)"):" ssciphers_opt
		[ -z "$ssciphers_opt" ] && error && continue
		case $ssciphers_opt in
		[1-7])
			new_ssciphers=${ciphers[$ssciphers_opt - 1]}
			if [[ $new_ssciphers == $ssciphers ]]; then
				echo
				Echo " Same as the current encryption protocol....modify a chicken"
				error && continue
			be
			echo
			echo
			Echo -e "$yellow Shadowsocks Encryption Protocol = $cyan${new_ssciphers}$none"
			echo "----------------------------------------------------------------"
			echo
			pause
			backup_config ssciphers
			ssciphers=$new_ssciphers
			config
			clear
			view_shadowsocks_config_info
			# get_shadowsocks_config_qr_ask
			break
			;;
		*)
			error
			;;
		esac

	done

}
disable_shadowsocks() {
	echo

	while :; do
		Echo -e "Do you want to close ${yellow}Shadowsocks${none} [${magenta}Y/N$none]"
		read -p "$(echo -e "(默认 [${cyan}N$none]):") " y_n
		[[ -z "$y_n" ]] && y_n="n"
		if [[ "$y_n" == [Yy] ]]; then
			echo
			echo
			Echo -e "$yellow close Shadowsocks = $cyan is $none"
			echo "----------------------------------------------------------------"
			echo
			pause
			backup_config -ss
			del_port $ssport
			shadowsocks=''
			config
			# clear
			echo
			echo
			echo
			Echo -e "$green Shadowsocks is off...but you can always re-enable Shadowsocks...as long as you like $none"
			echo
			break
		elif [[ "$y_n" == [Nn] ]]; then
			echo
			Echo -e " $green has canceled closing Shadowsocks ....$none"
			echo
			break
		else
			error
		be

	done
}
change_v2ray_config() {
	local _menu=(
		"Modify V2Ray Port"
		"Modify V2Ray Transport Protocol"
		"Modify V2Ray Dynamic Port (if available)"
		"Modify User ID (UUID)"
		"Modify TLS domain name (if available)"
		"Modify the path of the split (if possible)"
		"Modify the spoofed URL (if available)"
		"Close site masquerading and path shunting (if available)"
		"Turn on/off ad blocking"
	)
	while :; do
		for ((i = 1; i <= ${#_menu[*]}; i++)); do
			if [[ "$i" -le 9 ]]; then
				echo
				echo -e "$yellow  $i. $none${_menu[$i - 1]}"
			else
				echo
				echo -e "$yellow $i. $none${_menu[$i - 1]}"
			be
		done
		echo
		Read -p "$(echo -e "Please select [${magenta}1-${#_menu[*]}$none]:")" _opt
		if [[ -z $_opt ]]; then
			error
		else
			case $_opt in
			1)
				change_v2ray_port
				break
				;;
			2)
				change_v2ray_transport
				break
				;;
			3)
				change_v2ray_dynamicport
				break
				;;
			4)
				change_v2ray_id
				break
				;;
			5)
				change_domain
				break
				;;
			6)
				change_path_config
				break
				;;
			7)
				change_proxy_site_config
				break
				;;
			8)
				disable_path
				break
				;;
			9)
				blocked_hosts
				break
				;;
			[aA][Ii][aA][Ii] | [Dd][Dd])
				custom_uuid
				break
				;;
			[Dd] | [Aa][Ii] | 233 | 233[Bb][Ll][Oo][Gg] | 233[Bb][Ll][Oo][Gg].[Cc][Oo][Mm] | 233[Bb][Oo][Yy] | [Aa][Ll][Tt][Ee][Rr][Ii][Dd])
				change_v2ray_alterId
				break
				;;
			*)
				error
				;;
			esac
		be
	done
}
change_v2ray_port() {
	if [[ $v2ray_transport == 4 ]]; then
		echo
		Echo -e " Since you are currently using the $yellow WebSocket + TLS $none transport protocol... there is nothing wrong with repairing the V2Ray port."
		echo
		Echo " If you want to use a different port... you can modify the V2Ray transport protocol first.. then modify the V2Ray port"
		echo
		change_v2ray_transport_ask
	elif [[ $v2ray_transport == 5 ]]; then
		echo
		Echo -e " Since you are currently using the $yellow HTTP/2 $none transport protocol... there is nothing wrong with repairing the V2Ray port."
		echo
		Echo " If you want to use a different port... you can modify the V2Ray transport protocol first.. then modify the V2Ray port"
		echo
		change_v2ray_transport_ask
	else
		echo
		while :; do
			Echo -e "Please enter "$yellow"V2Ray"$none" port["$magenta"1-65535"$none"]"
			Read -p "$(echo -e "(current port: ${cyan}${v2ray_port}$none):")" v2ray_port_opt
			[[ -z $v2ray_port_opt ]] && error && continue
			case $v2ray_port_opt in
			$v2ray_port)
				echo
				Echo "Oh... it’s the same as the current port...modify a chicken"
				error
				;;
			[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
				if [[ $dynamicPort ]] && [[ $v2ray_dynamicPort_start == $v2ray_port_opt || $v2ray_dynamicPort_end == $v2ray_port_opt ]]; then
					echo
					Echo -e " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: ${cyan}$port_range${none}"
					error
				elif [[ $dynamicPort ]] && [[ $v2ray_dynamicPort_start -lt $v2ray_port_opt && $v2ray_port_opt -le $v2ray_dynamicPort_end ]]; then
					echo
					Echo -e " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: ${cyan}$port_range${none}"
					error
				elif [[ $shadowsocks && $v2ray_port_opt == $ssport ]]; then
					echo
					Echo -e "Sorry, this port conflicts with the Shadowsocks port...current Shadowsocks port: ${cyan}$ssport$none"
					error
				elif [[ $socks && $v2ray_port_opt == $socks_port ]]; then
					echo
					Echo -e "Sorry, this port conflicts with the Socks port...current Socks port: ${cyan}$socks_port$none"
					error
				elif [[ $mtproto && $v2ray_port_opt == $mtproto_port ]]; then
					echo
					Echo -e "Sorry, this port conflicts with the MTProto port...current MTProto port: ${cyan}$mtproto_port$none"
					error
				else
					echo
					echo
					echo -e "$yellow V2Ray 端口 = $cyan$v2ray_port_opt$none"
					echo "----------------------------------------------------------------"
					echo
					pause
					backup_config v2ray_port
					del_port $v2ray_port
					open_port $v2ray_port_opt
					v2ray_port=$v2ray_port_opt
					config
					clear
					view_v2ray_config_info
					# download_v2ray_config_ask
					break
				be
				;;
			*)
				error
				;;
			esac

		done
	be

}
download_v2ray_config_ask() {
	echo
	while :; do
		Echo -e "Do you need to download V2Ray configuration / generate configuration information link / generate QR code link [${magenta}Y/N$none]"
		read -p "$(echo -e "默认 [${cyan}N$none]:")" y_n
		[ -z $y_n ] && y_n="n"
		if [[ $y_n == [Yy] ]]; then
			download_v2ray_config
			break
		elif [[ $y_n == [Nn] ]]; then
			break
		else
			error
		be
	done

}
change_v2ray_transport_ask() {
	echo
	while :; do
		Echo -e "Do you need to modify the $yellow V2Ray $none transport protocol [${magenta}Y/N$none]"
		read -p "$(echo -e "默认 [${cyan}N$none]:")" y_n
		[ -z $y_n ] && break
		if [[ $y_n == [Yy] ]]; then
			change_v2ray_transport
			break
		elif [[ $y_n == [Nn] ]]; then
			break
		else
			error
		be
	done
}
change_v2ray_transport() {
	echo
	while :; do
		Echo -e "Please select "$yellow"V2Ray"$none" transport protocol [${magenta}1-${#transport[*]}$none]"
		echo
		for ((i = 1; i <= ${#transport[*]}; i++)); do
			Stream="${transport[$i - 1]}"
			if [[ "$i" -le 9 ]]; then
				# echo
				echo -e "$yellow  $i. $none${Stream}"
			else
				# echo
				echo -e "$yellow $i. $none${Stream}"
			be
		done
		echo
		Echo "Note 1: Dynamic port is enabled with [dynamicPort]."
		Echo "Note 2: [utp | srtp | wechat-video | dtls | wireguard] disguised as [BT Download | Video Call | WeChat Video Call | DTLS 1.2 Packet | WireGuard Packet]
		echo
		Read -p "$(echo -e "(current transfer protocol: ${cyan}${transport[$v2ray_transport - 1]}$none)"):" v2ray_transport_opt
		if [ -z "$v2ray_transport_opt" ]; then
			error
		else
			case $v2ray_transport_opt in
			$v2ray_transport)
				echo
				Echo "Oh... it’s the same as the current transfer protocol...modify a chicken"
				error
				;;
			4 | 5)
				if [[ $v2ray_port == "80" || $v2ray_port == "443" ]]; then
					echo
					Echo -e " Sorry... if you want to use ${cyan} ${transport[$v2ray_transport_opt - 1]} $none transport protocol: ${red}V2Ray port cannot be 80 or 443 ... $none"
					echo
					Echo -e " current V2Ray port: ${cyan}$v2ray_port$none"
					error
				elif [[ $shadowsocks ]] && [[ $ssport == "80" || $ssport == "443" ]]; then
					echo
					Echo -e " Sorry... if you want to use ${cyan} ${transport[$v2ray_transport_opt - 1]} $none transport protocol: ${red}Shadowsocks port cannot be 80 or 443 ... $none"
					echo
					Echo -e " Current Shadowsocks port: ${cyan}$ssport$none"
					error
				elif [[ $socks ]] && [[ $socks_port == "80" || $socks_port == "443" ]]; then
					echo
					Echo -e " Sorry... if you want to use ${cyan} ${transport[$v2ray_transport_opt - 1]} $none transport protocol: ${red}Socks port cannot be 80 or 443 ... $none"
					echo
					Echo -e " current Socks port: ${cyan}$socks_port$none"
					error
				elif [[ $mtproto ]] && [[ $mtproto_port == "80" || $mtproto_port == "443" ]]; then
					echo
					Echo -e " Sorry... if you want to use ${cyan} ${transport[$v2ray_transport_opt - 1]} $none transport protocol: ${red}MTProto port cannot be 80 or 443 ... $none"
					echo
					Echo -e " Current MTProto port: ${cyan}$mtproto_port$none"
					error
				else
					echo
					echo
					Echo -e "$yellow V2Ray transport protocol = $cyan${transport[$v2ray_transport_opt - 1]}$none"
					echo "----------------------------------------------------------------"
					echo
					break
				be
				;;
			[1-9] | [1-2][0-9] | 3[0-2])
				echo
				echo
				Echo -e "$yellow V2Ray transport protocol = $cyan${transport[$v2ray_transport_opt - 1]}$none"
				echo "----------------------------------------------------------------"
				echo
				break
				;;
			*)
				error
				;;
			esac
		be

	done
	pause

	if [[ $v2ray_transport_opt == [45] ]]; then
		tls_config
	elif [[ $v2ray_transport_opt -ge 18 ]]; then
		v2ray_dynamic_port_start
		v2ray_dynamic_port_end
		pause
		old_transport
		open_port "multiport"
		backup_config v2ray_transport v2ray_dynamicPort_start v2ray_dynamicPort_end
		port_range="${v2ray_dynamic_port_start_input}-${v2ray_dynamic_port_end_input}"
		v2ray_transport=$v2ray_transport_opt
		config
		clear
		view_v2ray_config_info
		# download_v2ray_config_ask
	else
		old_transport
		backup_config v2ray_transport
		v2ray_transport=$v2ray_transport_opt
		config
		clear
		view_v2ray_config_info
		# download_v2ray_config_ask
	be

}
old_transport() {
	if [[ $v2ray_transport == [45] ]]; then
		del_port "80"
		del_port "443"
		if [[ $caddy && $caddy_pid ]]; then
			do_service stop caddy
			if [[ $systemd ]]; then
				systemctl disable caddy >/dev/null 2>&1
			else
				update-rc.d -f caddy remove >/dev/null 2>&1
			be
		elif [[ $caddy ]]; then
			if [[ $systemd ]]; then
				systemctl disable caddy >/dev/null 2>&1
			else
				update-rc.d -f caddy remove >/dev/null 2>&1
			be
		be
		if [[ $is_path ]]; then
			backup_config -path
		be
	elif [[ $v2ray_transport -ge 18 ]]; then
		del_port "multiport"
	be
}

tls_config() {
	while :; do
		echo
		echo
		echo
		Echo -e "Please enter a $magenta correct domain name $none, be sure to be correct, no! Yes! Out! Wrong!"
		Read -p "(example: 233blog.com): " new_domain
		[ -z "$new_domain" ] && error && continue
		echo
		echo
		Echo -e "$yellow your domain name = $cyan$new_domain$none"
		echo "----------------------------------------------------------------"
		break
	done
	get_ip
	echo
	echo
	Echo -e "$yellow Please parse $magenta$new_domain$none $yellow to: $cyan$ip$none"
	echo
	Echo -e "$yellow Please parse $magenta$new_domain$none $yellow to: $cyan$ip$none"
	echo
	Echo -e "$yellow Please parse $magenta$new_domain$none $yellow to: $cyan$ip$none"
	echo "----------------------------------------------------------------"
	echo

	while :; do

		Read -p "$(echo -e " (if it has been parsed correctly: [${magenta}Y$none]):") " record
		if [[ -z "$record" ]]; then
			error
		else
			if [[ "$record" == [Yy] ]]; then
				domain_check
				echo
				echo
				Echo -e "$yellow domain name resolution = ${cyan} I'm sure I have parsed $none"
				echo "----------------------------------------------------------------"
				echo
				break
			else
				error
			be
		be

	done

	if [[ $caddy ]]; then
		path_config_ask
		pause
		# domain_check
		backup_config v2ray_transport domain
		if [[ $new_path ]]; then
			backup_config +path
			path=$new_path
			proxy_site=$new_proxy_site
			is_path=true
		be

		if [[ $v2ray_transport -ge 18 ]]; then
			del_port "multiport"
		be
		domain=$new_domain

		open_port "80"
		open_port "443"
		if [[ $systemd ]]; then
			systemctl enable caddy >/dev/null 2>&1
		else
			update-rc.d -f caddy defaults >/dev/null 2>&1
		be
		v2ray_transport=$v2ray_transport_opt
		caddy_config
		config
		clear
		view_v2ray_config_info
		# download_v2ray_config_ask
	else
		if [[ $v2ray_transport_opt == 5 ]]; then
			path_config_ask
			pause
			domain_check
			backup_config v2ray_transport domain caddy
			if [[ $new_path ]]; then
				backup_config +path
				path=$new_path
				proxy_site=$new_proxy_site
				is_path=true
			be
			if [[ $v2ray_transport -ge 18 ]]; then
				del_port "multiport"
			be
			domain=$new_domain
			install_caddy
			open_port "80"
			open_port "443"
			v2ray_transport=$v2ray_transport_opt
			caddy_config
			config
			caddy=true
			clear
			view_v2ray_config_info
			# download_v2ray_config_ask
		else
			auto_tls_config
		be
	be

}
auto_tls_config() {
	echo -e "

		Install Caddy for automatic configuration of TLS
		
		If you already have Nginx or Caddy installed

		$yellow and.. can get TLS$none by yourself

		Then you don't need to turn on automatic configuration TLS
		"
	echo "----------------------------------------------------------------"
	echo

	while :; do

		Read -p "$(echo -e " (whether TLS is automatically configured: [${magenta}Y/N$none]):") " auto_install_caddy
		if [[ -z "$auto_install_caddy" ]]; then
			error
		else
			if [[ "$auto_install_caddy" == [Yy] ]]; then
				echo
				echo
				Echo -e "$yellow auto-configure TLS = $cyan open $none"
				echo "----------------------------------------------------------------"
				echo
				path_config_ask
				pause
				domain_check
				backup_config v2ray_transport domain caddy
				if [[ $new_path ]]; then
					backup_config +path
					path=$new_path
					proxy_site=$new_proxy_site
					is_path=true
				be
				if [[ $v2ray_transport -ge 18 ]]; then
					del_port "multiport"
				be
				domain=$new_domain
				install_caddy
				open_port "80"
				open_port "443"
				v2ray_transport=$v2ray_transport_opt
				caddy_config
				config
				caddy=true
				clear
				view_v2ray_config_info
				# download_v2ray_config_ask
				break
			elif [[ "$auto_install_caddy" == [Nn] ]]; then
				echo
				echo
				Echo -e "$yellow automatically configures TLS = $cyan turns off $none"
				echo "----------------------------------------------------------------"
				echo
				pause
				domain_check
				backup_config v2ray_transport domain
				if [[ $v2ray_transport -ge 18 ]]; then
					del_port "multiport"
				be
				domain=$new_domain
				open_port "80"
				open_port "443"
				v2ray_transport=$v2ray_transport_opt
				config
				clear
				view_v2ray_config_info
				# download_v2ray_config_ask
				break
			else
				error
			be
		be

	done
}

path_config_ask() {
	echo
	while :; do
		Echo -e "Do you want to enable website spoofing and path shunting [${magenta}Y/N$none]"
		read -p "$(echo -e "(默认: [${cyan}N$none]):")" path_ask
		[[ -z $path_ask ]] && path_ask="n"

		case $path_ask in
		Y | y)
			path_config
			break
			;;
		N | n)
			echo
			echo
			Echo -e "$yellow site masquerading and path shunting = $cyan don't want to configure $none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		*)
			error
			;;
		esac
	done
}
path_config() {
	echo
	while :; do
		Echo -e "Please enter the path $none you want ${magenta} to offload, for example /233blog, then just type 233blog."
		read -p "$(echo -e "(默认: [${cyan}233blog$none]):")" new_path
		[[ -z $new_path ]] && new_path="233blog"

		case $new_path in
		*[/$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the shunt path cannot contain $red / $none or $red $ $none...."
			echo
			error
			;;
		*)
			echo
			echo
			Echo -e "$yellow shunt path = ${cyan}/${new_path}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		esac
	done
	proxy_site_config
}
proxy_site_config() {
	echo
	while :; do
		Echo -e "Please enter ${magenta} with a correct $none ${cyan} URL $none used as a camouflage $none for the ${cyan} site, eg https://liyafly.com"
		Echo -e "Example... Suppose your current domain name is $green $domain $none, the spoofed URL is https://liyafly.com"
		Echo -e "When you open your domain name... the content displayed is the content from https://liyafly.com"
		Echo -e "is actually an anti-generation...just understand..."
		Echo -e "If you can't pretend to succeed... you can use v2ray config to modify the spoofed URL"
		read -p "$(echo -e "(默认: [${cyan}https://liyafly.com$none]):")" new_proxy_site
		[[ -z $new_proxy_site ]] && new_proxy_site="https://liyafly.com"

		case $new_proxy_site in
		*[#$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the fake URL cannot contain $red # $none or $red $ $none...."
			echo
			error
			;;
		*)
			echo
			echo
			Echo -e "$yellow camouflaged URL = ${cyan}${new_proxy_site}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		esac
	done
}

install_caddy() {
	_load download-caddy.sh
	_download_caddy_file
	_install_caddy_service

}
caddy_config() {
	# local email=$(shuf -i1-10000000000 -n1)
	_load caddy-config.sh
	# systemctl restart caddy
	do_service restart caddy
}
v2ray_dynamic_port_start() {
	echo
	echo
	while :; do
		Echo -e "Please enter "$yellow"V2Ray dynamic port to start "$none" range ["$magenta"1-65535"$none"]"
		Read -p "$(echo -e " (default start port: ${cyan}10000$none):")" v2ray_dynamic_port_start_input
		[ -z $v2ray_dynamic_port_start_input ] && v2ray_dynamic_port_start_input=10000
		case $v2ray_dynamic_port_start_input in
		$v2ray_port)
			echo
			Echo "Can't be the same as the V2Ray port...."
			echo
			Echo -e " current V2Ray port: ${cyan}$v2ray_port${none}"
			error
			;;
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			if [[ $shadowsocks && $v2ray_dynamic_port_start_input == $ssport ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the Shadowsocks port...current Shadowsocks port: ${cyan}$ssport$none"
				error
			elif [[ $socks && $v2ray_dynamic_port_start_input == $socks_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the Socks port...current Socks port: ${cyan}$socks_port$none"
				error
			elif [[ $mtproto && $v2ray_dynamic_port_start_input == $mtproto_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the MTProto port...current MTProto port: ${cyan}$mtproto_port$none"
				error
			else
				echo
				echo
				Echo -e "$yellow V2Ray dynamic port start = $cyan$v2ray_dynamic_port_start_input$none"
				echo "----------------------------------------------------------------"
				echo
				break
			be

			;;
		*)
			error
			;;
		esac

	done

	if [[ $v2ray_dynamic_port_start_input -lt $v2ray_port ]]; then
		lt_v2ray_port=true
	be
	if [[ $shadowsocks ]] && [[ $v2ray_dynamic_port_start_input -lt $ssport ]]; then
		lt_ssport=true
	be
	if [[ $socks ]] && [[ $v2ray_dynamic_port_start_input -lt $socks_port ]]; then
		lt_socks_port=true
	be
	if [[ $mtproto ]] && [[ $v2ray_dynamic_port_start_input -lt $mtproto_port ]]; then
		lt_mtproto_port=true
	be

}

v2ray_dynamic_port_end() {
	echo
	while :; do
		Echo -e "Please enter "$yellow"V2Ray dynamic port end "$none" range ["$magenta"1-65535"$none"]"
		Read -p "$(echo -e " (default end port: ${cyan}20000$none):")" v2ray_dynamic_port_end_input
		[ -z $v2ray_dynamic_port_end_input ] && v2ray_dynamic_port_end_input=20000
		case $v2ray_dynamic_port_end_input in
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])

			if [[ $v2ray_dynamic_port_end_input -le $v2ray_dynamic_port_start_input ]]; then
				echo
				Echo "cannot be less than or equal to the V2Ray dynamic port start range"
				echo
				Echo -e " Current V2Ray dynamic port start: ${cyan}$v2ray_dynamic_port_start_input${none}"
				error
			elif [ $lt_v2ray_port ] && [[ ${v2ray_dynamic_port_end_input} -ge $v2ray_port ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include V2Ray port..."
				echo
				Echo -e " current V2Ray port: ${cyan}$v2ray_port$none"
				error
			elif [ $lt_ssport ] && [[ ${v2ray_dynamic_port_end_input} -ge $ssport ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include Shadowsocks port..."
				echo
				Echo -e " Current Shadowsocks port: ${cyan}$ssport$none"
				error
			elif [ $lt_socks_port ] && [[ ${v2ray_dynamic_port_end_input} -ge $socks_port ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include Socks port..."
				echo
				Echo -e " current Socks port: ${cyan}$socks_port$none"
				error
			elif [ $lt_mtproto_port ] && [[ ${v2ray_dynamic_port_end_input} -ge $mtproto_port ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include MTProto port..."
				echo
				Echo -e " Current MTProto port: ${cyan}$mtproto_port$none"
				error
			else
				echo
				echo
				Echo -e "$yellow V2Ray dynamic port end = $cyan$v2ray_dynamic_port_end_input$none"
				echo "----------------------------------------------------------------"
				echo
				break
			be
			;;
		*)
			error
			;;
		esac

	done

}
change_v2ray_dynamicport() {
	if [[ $v2ray_transport -ge 18 ]]; then
		change_v2ray_dynamic_port_start
		change_v2ray_dynamic_port_end
		pause
		del_port "multiport"
		open_port "multiport"
		backup_config v2ray_dynamicPort_start v2ray_dynamicPort_end
		port_range="${v2ray_dynamic_port_start_input}-${v2ray_dynamic_port_end_input}"
		config
		# clear
		echo
		Echo -e "$green Dynamic port modification is successful... you don't need to modify the V2Ray client configuration... keep the original configuration...$none"
		echo
	else
		echo
		Echo -e "$red ... current transport protocol wood has enabled dynamic port...$none"
		echo
		while :; do
			Echo -e "Do you need to modify the transport protocol [${magenta}Y/N$none]"
			read -p "$(echo -e "默认 [${cyan}N$none]:")" y_n
			if [[ -z $y_n ]]; then
				echo
				Echo -e "$green has unmodified the transfer protocol...$none"
				echo
				break
			else
				if [[ $y_n == [Yy] ]]; then
					change_v2ray_transport
					break
				elif [[ $y_n == [Nn] ]]; then
					echo
					Echo -e "$green has unmodified the transfer protocol...$none"
					echo
					break
				else
					error
				be
			be
		done

	be
}
change_v2ray_dynamic_port_start() {
	echo
	echo
	while :; do
		Echo -e "Please enter "$yellow"V2Ray dynamic port to start "$none" range ["$magenta"1-65535"$none"]"
		Read -p "$(echo -e "(current dynamic start port: ${cyan}$v2ray_dynamicPort_start$none):")" v2ray_dynamic_port_start_input
		[ -z $v2ray_dynamic_port_start_input ] && error && continue
		case $v2ray_dynamic_port_start_input in
		$v2ray_port)
			echo
			Echo "Can't be the same as the V2Ray port...."
			echo
			Echo -e " current V2Ray port: ${cyan}$v2ray_port${none}"
			error
			;;
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			if [[ $shadowsocks && $v2ray_dynamic_port_start_input == $ssport ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the Shadowsocks port...current Shadowsocks port: ${cyan}$ssport$none"
				error
			elif [[ $socks && $v2ray_dynamic_port_start_input == $socks_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the Socks port...current Socks port: ${cyan}$socks_port$none"
				error
			elif [[ $mtproto && $v2ray_dynamic_port_start_input == $mtproto_port ]]; then
				echo
				Echo -e "Sorry, this port conflicts with the MTProto port...current MTProto port: ${cyan}$mtproto_port$none"
				error
			else
				echo
				echo
				Echo -e "$yellow V2Ray dynamic port start = $cyan$v2ray_dynamic_port_start_input$none"
				echo "----------------------------------------------------------------"
				echo
				break
			be

			;;
		*)
			error
			;;
		esac

	done

	if [[ $v2ray_dynamic_port_start_input -lt $v2ray_port ]]; then
		lt_v2ray_port=true
	be
	if [[ $shadowsocks ]] && [[ $v2ray_dynamic_port_start_input -lt $ssport ]]; then
		lt_ssport=true
	be
	if [[ $socks ]] && [[ $v2ray_dynamic_port_start_input -lt $socks_port ]]; then
		lt_socks_port=true
	be
	if [[ $mtproto ]] && [[ $v2ray_dynamic_port_start_input -lt $mtproto_port ]]; then
		lt_mtproto_port=true
	be
}

change_v2ray_dynamic_port_end() {
	echo
	while :; do
		Echo -e "Please enter "$yellow"V2Ray dynamic port end "$none" range ["$magenta"1-65535"$none"]"
		Read -p "$(echo -e "(current dynamic end port: ${cyan}$v2ray_dynamicPort_end$none):")" v2ray_dynamic_port_end_input
		[ -z $v2ray_dynamic_port_end_input ] && error && continue
		case $v2ray_dynamic_port_end_input in
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])

			if [[ $v2ray_dynamic_port_end_input -le $v2ray_dynamic_port_start_input ]]; then
				echo
				Echo "cannot be less than or equal to the V2Ray dynamic port start range"
				echo
				Echo -e " Current V2Ray dynamic port start: ${cyan}$v2ray_dynamic_port_start_input${none}"
				error
			elif [ $lt_v2ray_port ] && [[ ${v2ray_dynamic_port_end_input} -ge $v2ray_port ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include V2Ray port..."
				echo
				Echo -e " current V2Ray port: ${cyan}$v2ray_port$none"
				error
			elif [ $lt_ssport ] && [[ ${v2ray_dynamic_port_end_input} -ge $ssport ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include Shadowsocks port..."
				echo
				Echo -e " Current Shadowsocks port: ${cyan}$ssport$none"
				error
			elif [ $lt_socks_port ] && [[ ${v2ray_dynamic_port_end_input} -ge $socks_port ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include Socks port..."
				echo
				Echo -e " current Socks port: ${cyan}$socks_port$none"
				error
			elif [ $lt_mtproto_port ] && [[ ${v2ray_dynamic_port_end_input} -ge $mtproto_port ]]; then
				echo
				Echo " V2Ray dynamic port end range cannot include MTProto port..."
				echo
				Echo -e " Current MTProto port: ${cyan}$mtproto_port$none"
				error
			else
				echo
				echo
				Echo -e "$yellow V2Ray dynamic port end = $cyan$v2ray_dynamic_port_end_input$none"
				echo "----------------------------------------------------------------"
				echo
				break
			be
			;;
		*)
			error
			;;
		esac

	done

}
change_v2ray_id() {
	echo
	while :; do
		Echo -e "Are you sure you want to modify the user ID [${magenta}Y/N$none]"
		read -p "$(echo -e "默认 [${cyan}N$none]:")" y_n
		if [[ -z $y_n ]]; then
			echo
			Echo -e "$green has unmodified user ID...$none"
			echo
			break
		else
			if [[ $y_n == [Yy] ]]; then
				echo
				echo
				Echo -e "$yellow modify user ID = $cyan to determine $none"
				echo "----------------------------------------------------------------"
				echo
				pause
				backup_config uuid
				v2ray_id=$uuid
				config
				clear
				view_v2ray_config_info
				# download_v2ray_config_ask
				break
			elif [[ $y_n == [Nn] ]]; then
				echo
				Echo -e "$green has unmodified user ID...$none"
				echo
				break
			else
				error
			be
		be
	done
}
change_domain() {
	if [[ $v2ray_transport == [45] ]] && [[ $caddy ]]; then
		while :; do
			echo
			Echo -e "Please enter a $magenta correct domain name $none, be sure to be correct, no! Yes! Out! Wrong!"
			Read -p "$(echo -e "(current domain name: ${cyan}$domain$none):") " new_domain
			[ -z "$new_domain" ] && error && continue
			if [[ $new_domain == $domain ]]; then
				echo
				Echo -e " Same as the current domain name...modify a chicken"
				echo
				error && continue
			be
			echo
			echo
			Echo -e "$yellow your domain name = $cyan$new_domain$none"
			echo "----------------------------------------------------------------"
			break
		done
		get_ip
		echo
		echo
		Echo -e "$yellow Please parse $magenta$new_domain$none $yellow to: $cyan$ip$none"
		echo
		Echo -e "$yellow Please parse $magenta$new_domain$none $yellow to: $cyan$ip$none"
		echo
		Echo -e "$yellow Please parse $magenta$new_domain$none $yellow to: $cyan$ip$none"
		echo "----------------------------------------------------------------"
		echo

		while :; do

			Read -p "$(echo -e " (if it has been parsed correctly: [${magenta}Y$none]):") " record
			if [[ -z "$record" ]]; then
				error
			else
				if [[ "$record" == [Yy] ]]; then
					domain_check
					echo
					echo
					Echo -e "$yellow domain name resolution = ${cyan} I'm sure I have parsed $none"
					echo "----------------------------------------------------------------"
					echo
					pause
					# domain_check
					backup_config domain
					domain=$new_domain
					caddy_config
					config
					clear
					view_v2ray_config_info
					# download_v2ray_config_ask
					break
				else
					error
				be
			be

		done
	else
		echo
		Echo -e "$red Sorry... does not support editing...$none"
		echo
		Echo -e " Note: Modifying the TLS domain name only supports the transport protocol as ${yellow}WebSocket + TLS$none or ${yellow}HTTP/2$none and $yellow automatically configures TLS = open $none"
		echo
		Echo -e " The current transport protocol is: ${cyan}${transport[$v2ray_transport - 1]}${none}"
		echo
		if [[ $caddy ]]; then
			Echo -e "automatically configure TLS = ${cyan}open $none"
		else
			Echo -e "automatically configure TLS = $red to turn off $none"
		be
		echo
	be
}
change_path_config() {
	if [[ $v2ray_transport == [45] ]] && [[ $caddy && $is_path ]]; then
		echo
		while :; do
			Echo -e "Please enter the path $none you want ${magenta} to offload, for example /233blog, then just type 233blog."
			Read -p "$(echo -e " (current shunt path: [${cyan}/${path}$none]):")" new_path
			[[ -z $new_path ]] && error && continue

			case $new_path in
			$path)
				echo
				Echo -e " Big 佬...the same path as the current shunt...modify a chicken"
				echo
				error
				;;
			*[/$]*)
				echo
				Echo -e " Since this script is too spicy chicken.. so the shunt path cannot contain $red / $none or $red $ $none...."
				echo
				error
				;;
			*)
				echo
				echo
				Echo -e "$yellow shunt path = ${cyan}/${new_path}$none"
				echo "----------------------------------------------------------------"
				echo
				break
				;;
			esac
		done
		pause
		backup_config path
		path=$new_path
		caddy_config
		config
		clear
		view_v2ray_config_info
		# download_v2ray_config_ask
	elif [[ $v2ray_transport == [45] ]] && [[ $caddy ]]; then
		path_config_ask
		if [[ $new_path ]]; then
			backup_config +path
			path=$new_path
			proxy_site=$new_proxy_site
			is_path=true
			caddy_config
			config
			clear
			view_v2ray_config_info
			# download_v2ray_config_ask
		else
			echo
			echo
			Echo "Give a big sigh....a good decisive abandonment configuration site camouflage and path diversion"
			echo
			echo
		be
	else
		echo
		Echo -e "$red Sorry... does not support editing...$none"
		echo
		Echo -e " Remarks: Modify the shunt path to only support transport protocol ${yellow}WebSocket + TLS$none or ${yellow}HTTP/2$none and $yellow auto-configure TLS = open $none"
		echo
		Echo -e " The current transport protocol is: ${cyan}${transport[$v2ray_transport - 1]}${none}"
		echo
		if [[ $caddy ]]; then
			Echo -e "automatically configure TLS = ${cyan}open $none"
		else
			Echo -e "automatically configure TLS = $red to turn off $none"
		be
		echo
		change_v2ray_transport_ask
	be

}
change_proxy_site_config() {
	if [[ $v2ray_transport == [45] ]] && [[ $caddy && $is_path ]]; then
		echo
		while :; do
			Echo -e "Please enter ${magenta} with a correct $none ${cyan} URL $none used as a camouflage $none for the ${cyan} site, eg https://liyafly.com"
			Echo -e "Example... your current domain name is $green $domain $none, the URL of the disguise is https://liyafly.com"
			Echo -e "When you open your domain name... the content displayed is the content from https://liyafly.com"
			Echo -e "is actually an anti-generation...just understand..."
			Echo -e "If you can't pretend to succeed... you can use v2ray config to modify the spoofed URL"
			Read -p "$(echo -e " (currently masqueraded URL: [${cyan}${proxy_site}$none]):")" new_proxy_site
			[[ -z $new_proxy_site ]] && error && continue

			case $new_proxy_site in
			*[#$]*)
				echo
				Echo -e " Since this script is too spicy chicken.. so the fake URL cannot contain $red # $none or $red $ $none...."
				echo
				error
				;;
			*)
				echo
				echo
				Echo -e "$yellow camouflaged URL = ${cyan}${new_proxy_site}$none"
				echo "----------------------------------------------------------------"
				echo
				break
				;;
			esac
		done
		pause
		backup_config proxy_site
		proxy_site=$new_proxy_site
		caddy_config
		echo
		echo
		Echo " Oh... it seems that the modification was successful..."
		echo
		Echo -e " Quickly open your domain ${cyan}https://${domain}$none Check it out"
		echo
		echo
	elif [[ $v2ray_transport == [45] ]] && [[ $caddy ]]; then
		path_config_ask
		if [[ $new_path ]]; then
			backup_config +path
			path=$new_path
			proxy_site=$new_proxy_site
			is_path=true
			caddy_config
			config
			clear
			view_v2ray_config_info
			# download_v2ray_config_ask
		else
			echo
			echo
			Echo "Give a big sigh....a good decisive abandonment configuration site camouflage and path diversion"
			echo
			echo
		be
	else
		echo
		Echo -e "$red Sorry... does not support editing...$none"
		echo
		Echo -e " Note: Modifying the spoofed URL only supports the transfer protocol as ${yellow}WebSocket + TLS$none or ${yellow}HTTP/2$none and $yellow automatically configures TLS = open $none"
		echo
		Echo -e " The current transport protocol is: ${cyan}${transport[$v2ray_transport - 1]}${none}"
		echo
		if [[ $caddy ]]; then
			Echo -e "automatically configure TLS = ${cyan}open $none"
		else
			Echo -e "automatically configure TLS = $red to turn off $none"
		be
		echo
		change_v2ray_transport_ask
	be

}
domain_check() {
	# test_domain=$(dig $new_domain +short)
	test_domain=$(ping $new_domain -c 1 | grep -oE -m1 "([0-9]{1,3}\.){3}[0-9]{1,3}")
	if [[ $test_domain != $ip ]]; then
		echo
		Echo -e "$red detects domain name resolution error....$none"
		echo
		Echo -e " Your domain name: $yellow$new_domain$none Unresolved to: $cyan$ip$none"
		echo
		Echo -e " Your domain name is currently resolved to: $cyan$test_domain$none"
		echo
		Echo "Remarks... If your domain name is resolved using Cloudflare.. Click on the icon in Status.. Make it grayed out"
		echo
		exit 1
	be
}
disable_path() {
	if [[ $v2ray_transport == [45] ]] && [[ $caddy && $is_path ]]; then
		echo

		while :; do
			Echo -e "Whether to turn off ${yellow} site spoofing and path shunting ${none} [${magenta}Y/N$none]"
			read -p "$(echo -e "(默认 [${cyan}N$none]):") " y_n
			[[ -z "$y_n" ]] && y_n="n"
			if [[ "$y_n" == [Yy] ]]; then
				echo
				echo
				Echo -e "$yellow turn off site spoofing and path shunting = $cyan is $none"
				echo "----------------------------------------------------------------"
				echo
				pause
				backup_config -path
				is_path=''
				caddy_config
				config
				clear
				view_v2ray_config_info
				# download_v2ray_config_ask
				break
			elif [[ "$y_n" == [Nn] ]]; then
				echo
				Echo -e " $green has canceled closing website spoofing and path shunting....$none"
				echo
				break
			else
				error
			be

		done
	else
		echo
		Echo -e "$red Sorry... does not support editing...$none"
		echo
		Echo -e " The current transport protocol is: ${cyan}${transport[$v2ray_transport - 1]}${none}"
		echo
		if [[ $caddy ]]; then
			Echo -e "automatically configure TLS = ${cyan}open $none"
		else
			Echo -e "automatically configure TLS = $red to turn off $none"
		be
		echo
		if [[ $is_path ]]; then
			Echo -e "path shunt = ${cyan}open $none"
		else
			Echo -e "path shunt = $red off $none"
		be
		echo
		Echo -e " must be WebSocket + TLS or HTTP/2 transport protocol, automatically configure TLS = ${cyan} to open $none, path offload = ${cyan} open $none to modify"
		echo

	be
}
blocked_hosts() {
	if [[ $ban_ad ]]; then
		Local _info="$green has $none turned on"
	else
		Local _info="$red has closed $none"
	be
	_opt=''
	while :; do
		echo
		Echo -e "$yellow 1. $none to turn on ad blocking"
		echo
		Echo -e "$yellow 2. $none to turn off ad blocking"
		echo
		Echo "Note: Ad blocking is based on domain name blocking.. So it may cause some elements to appear when browsing the web.. or other issues"
		echo
		Echo "Feedback issue or request to block more domain names: https://github.com/233boy/v2ray/issues"
		echo
		Echo -e "current ad blocking status: $_info"
		echo
		Read -p "$(echo -e "Please select [${magenta}1-2$none]:")" _opt
		if [[ -z $_opt ]]; then
			error
		else
			case $_opt in
			1)
				if [[ $ban_ad ]]; then
					echo
					Echo -e " Big chest brother... It’s hard not to see you (current ad blocking status: $_info) This handsome reminder.....Open a chicken."
					echo
				else
					echo
					echo
					Echo -e "$yellow ad blocking = $cyan open $none"
					echo "----------------------------------------------------------------"
					echo
					pause
					backup_config +ad
					ban_ad=true
					config
					echo
					echo
					Echo -e "$green ad blocking is turned on... if an exception occurs.. then close it and $none"
					echo
				be
				break
				;;
			2)
				if [[ $ban_ad ]]; then
					echo
					echo
					Echo -e "$yellow ad blocking = $cyan off $none"
					echo "----------------------------------------------------------------"
					echo
					pause
					backup_config -ad
					ban_ad = ''
					config
					echo
					echo
					Echo -e "$red ad blocking is turned off...but you can always re-open it...as long as you like $none"
					echo
				else
					echo
					Echo -e " Big breasted brother... It’s hard not to see you (current ad blocking status: $_info) This handsome reminder..... also shuts down a chicken"
					echo
				be
				break
				;;
			*)
				error
				;;
			esac
		be
	done

}
change_v2ray_alterId() {
	echo
	while :; do
		Echo -e "Please enter the value of ${yellow}alterId${none} [${magenta}0-65535$none]"
		Read -p "$(echo -e " (current value is: ${cyan}$alterId$none):") " new_alterId
		[[ -z $new_alterId ]] && error && continue
		case $new_alterId in
		$alterId)
			echo
			Echo -e " Big 佬... Same as the current alterId...modify a chicken"
			echo
			error
			;;
		[0-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			echo
			echo
			echo -e "$yellow alterId = $cyan$new_alterId$none"
			echo "----------------------------------------------------------------"
			echo
			pause
			backup_config alterId
			alterId=$new_alterId
			config
			clear
			view_v2ray_config_info
			# download_v2ray_config_ask
			break
			;;
		*)
			error
			;;
		esac
	done
}

custom_uuid() {
	echo
	while :; do
		Echo -e "Please enter $yello's custom UUID$none...(${cyan}UUID format must be !!!$none)"
		read -p "$(echo -e "(当前 UUID: ${cyan}${v2ray_id}$none)"): " myuuid
		[ -z "$myuuid" ] && error && continue
		case $myuuid in
		$v2ray_id)
			echo
			Echo -e " Da Yu... Same as the current UUID... Modify a chicken"
			echo
			error
			;;
		*[/$]* | *\&*)
			echo
			Echo -e " Since this script is too spicy chicken.. so UUID can't contain $red / $none or $red $ $none or $red & $none these three symbols...."
			echo
			error
			;;
		*)
			echo
			echo
			echo -e "$yellow UUID = $cyan$myuuid$none"
			echo
			Echo -e " If the UUID is not in the correct format: V2Ray will 跪...relive with $cyan v2ray reuuid$none"
			echo "----------------------------------------------------------------"
			echo
			pause
			uuid=$myuuid
			backup_config uuid
			v2ray_id=$uuid
			config
			clear
			view_v2ray_config_info
			# download_v2ray_config_ask
			break
			;;
		esac
	done
}
v2ray_service() {
	while :; do
		echo
		Echo -e "$yellow 1. $none starts V2Ray"
		echo
		echo -e "$yellow 2. $none停止 V2Ray"
		echo
		Echo -e "$yellow 3. $none restart V2Ray"
		echo
		Echo -e "$yellow 4. $none view access log"
		echo
		Echo -e "$yellow 5. $none view error log"
		echo
		Read -p "$(echo -e "Please select [${magenta}1-5$none]:")" _opt
		if [[ -z $_opt ]]; then
			error
		else
			case $_opt in
			1)
				start_v2ray
				break
				;;
			2)
				stop_v2ray
				break
				;;
			3)
				restart_v2ray
				break
				;;
			4)
				view_v2ray_log
				break
				;;
			5)
				view_v2ray_error_log
				break
				;;
			*)
				error
				;;
			esac
		be
	done
}
start_v2ray() {
	if [[ $v2ray_pid ]]; then
		echo
		Echo -e "${green} V2Ray is running... no need to start $none"
		echo
	else

		# systemctl start v2ray
		service v2ray start >/dev/null 2>&1
		if [[ $? -ne 0 ]]; then
			echo
			Echo -e "${red} V2Ray failed to start! $none"
			echo
		else
			echo
			Echo -e "${green} V2Ray has started $none"
			echo
		be

	be
}
stop_v2ray() {
	if [[ $v2ray_pid ]]; then
		# systemctl stop v2ray
		service v2ray stop >/dev/null 2>&1
		echo
		Echo -e "${green} V2Ray has stopped $none"
		echo
	else
		echo
		Echo -e "${red} V2Ray is not running $none"
		echo
	be
}
restart_v2ray() {
	# systemctl restart v2ray
	service v2ray restart >/dev/null 2>&1
	if [[ $? -ne 0 ]]; then
		echo
		Echo -e "${red} V2Ray restart failed! $none"
		echo
	else
		echo
		Echo -e "${green} V2Ray restart completes $none"
		echo
	be
}
view_v2ray_log() {
	echo
	Echo -e "$green Press Ctrl + C to quit...$none"
	echo
	tail -f /var/log/v2ray/access.log
}
view_v2ray_error_log() {
	echo
	Echo -e "$green Press Ctrl + C to quit...$none"
	echo
	tail -f /var/log/v2ray/error.log
}
download_v2ray_config() {
	while :; do
		echo
		Echo -e "$yellow 1. $noneDownload the V2Ray client configuration file directly (Xshell only)"
		echo
		Echo -e "$yellow 2. $none generates V2Ray client configuration file download link"
		echo
		Echo -e "$yellow 3. $none generates V2Ray configuration information link"
		echo
		Echo -e "$yellow 4. $none generates V2Ray configuration QR code link"
		echo
		read -p "$(echo -e "请选择 [${magenta}1-4$none]:")" other_opt
		if [[ -z $other_opt ]]; then
			error
		else
			case $other_opt in
			1)
				get_v2ray_config
				break
				;;
			2)
				get_v2ray_config_link
				break
				;;
			3)
				get_v2ray_config_info_link
				break
				;;
			4)
				get_v2ray_config_qr_link
				break
				;;
			*)
				error
				;;
			esac
		be
	done
}
get_v2ray_config() {
	config
	echo
	Echo " If your current SSH client is not Xshell... downloading the V2Ray client configuration file will result in a stuck condition"
	echo
	while :; do
		Read -p "$(echo -e " don't BB... brother is using Xshell [${magenta}Y$none]:")" is_xshell
		if [[ -z $is_xshell ]]; then
			error
		else
			if [[ $is_xshell == [yY] ]]; then
				echo
				Echo "Start downloading....Please select the V2Ray client configuration file save location"
				echo
				# sz /etc/v2ray/233blog_v2ray.zip
				local tmpfile="/tmp/233blog_v2ray_config_$RANDOM.json"
				cp -f $v2ray_client_config $tmpfile
				sz $tmpfile
				echo
				echo
				Echo -e "$green download completed...$none"
				echo
				# echo -e "$yellow Unzip Password = ${cyan}233blog.com$none"
				# echo
				Echo -e "$yellow SOCKS listening port = ${cyan}2333${none}"
				echo
				Echo -e "${yellow} HTTP listening port = ${cyan}6666$none"
				echo
				Echo "V2Ray client tutorial: https://v2ray6.com/post/4/"
				echo
				break
			else
				error
			be
		be
	done
	[[ -f $tmpfile ]] && rm -rf $tmpfile

}
get_v2ray_config_link() {
	_load client_file.sh
	_get_client_file
}
create_v2ray_config_text() {

	get_transport_args

	echo
	echo
	Echo "---------- V2Ray configuration information -------------"
	if [[ $v2ray_transport == [45] ]]; then
		if [[ ! $caddy ]]; then
			echo
			Echo "Warning! Please configure TLS... Tutorial: https://v2ray6.com/post/3/"
		be
		echo
		Echo "Address (Address) = ${domain}"
		echo
		Echo "Port (Port) = 443"
		echo
		echo "用户ID (User ID / UUID) = ${v2ray_id}"
		echo
		echo "额外ID (Alter Id) = ${alterId}"
		echo
		Echo "Transport Protocol (Network) = ${net}"
		echo
		Echo "header type = ${header}"
		echo
		Echo "camouflage domain (host) = ${domain}"
		echo
		Echo "path (path) = ${_path}"
		echo
		echo "TLS (Enable TLS) = 打开"
		echo
		if [[ $ban_ad ]]; then
			Echo " Note: Ad blocking is turned on.."
			echo
		be
	else
		[[ -z $ip ]] && get_ip
		echo
		Echo "Address (Address) = ${ip}"
		echo
		Echo "Port (Port) = $v2ray_port"
		echo
		echo "用户ID (User ID / UUID) = ${v2ray_id}"
		echo
		echo "额外ID (Alter Id) = ${alterId}"
		echo
		Echo "Transport Protocol (Network) = ${net}"
		echo
		Echo "header type = ${header}"
		echo
	be
	if [[ $v2ray_transport -ge 18 ]] && [[ $ban_ad ]]; then
		Echo "Note: Dynamic port is enabled... Ad blocking is turned on..."
		echo
	elif [[ $v2ray_transport -ge 18 ]]; then
		Echo "Note: Dynamic port is enabled..."
		echo
	elif [[ $ban_ad ]]; then
		Echo "Note: Ad blocking is turned on.."
		echo
	be
	echo "---------- END -------------"
	echo
	Echo "V2Ray client tutorial: https://v2ray6.com/post/4/"
	echo
}
get_v2ray_config_info_link() {
	echo
	Echo -e "$green is generating a link.... Wait a moment....$none"
	echo
	create_v2ray_config_text >/tmp/233blog_v2ray.txt
	local random=$(echo $RANDOM-$RANDOM-$RANDOM | base64 -w 0)
	local link=$(curl -s --upload-file /tmp/233blog_v2ray.txt "https://transfer.sh/${random}_v2ray6_v2ray.txt")
	if [[ $link ]]; then
		echo
		Echo "---------- V2Ray configuration information link -------------"
		echo
		echo -e "$yellow 链接 = $cyan$link$none"
		echo
		Echo -e " V2Ray client tutorial: https://v2ray6.com/post/4/"
		echo
		Echo "Remarks... the link will expire after 14 days..."
		echo
		Echo "Reminder... Please don't share the link... unless you have a special reason..."
		echo
	else
		echo
		Echo -e "$red Oh, yeah... wrong... please try $none"
		echo
	be
	rm -rf /tmp/233blog_v2ray.txt
}
get_v2ray_config_qr_link() {

	create_vmess_URL_config

	_load qr.sh
	_qr_create
}
get_v2ray_vmess_URL_link() {
	create_vmess_URL_config
	local vmess="vmess://$(cat /etc/v2ray/vmess_qr.json | base64 -w 0)"
	echo
	Echo "---------- V2Ray vmess URL / V2RayNG v0.4.1+ / V2RayN v2.1+ / only suitable for some clients -------------"
	echo
	echo -e ${cyan}$vmess${none}
	echo
	rm -rf /etc/v2ray/vmess_qr.json
}
other() {
	while :; do
		echo
		echo -e "$yellow 1. $none安装 BBR"
		echo
		Echo -e "$yellow 2. $none installs LotServer"
		echo
		Echo -e "$yellow 3. $none uninstalls LotServer"
		echo
		Read -p "$(echo -e "Please select [${magenta}1-3$none]:")" _opt
		if [[ -z $_opt ]]; then
			error
		else
			case $_opt in
			1)
				install_bbr
				break
				;;
			2)
				install_lotserver
				break
				;;
			3)
				uninstall_lotserver
				break
				;;
			*)
				error
				;;
			esac
		be
	done
}
install_bbr() {
	local test1=$(sed -n '/net.ipv4.tcp_congestion_control/p' /etc/sysctl.conf)
	Local test2 = $ (sed -n '/net.core.default_qdisc/p' /etc/sysctl.conf)
	if [[ $(uname -r | cut -b 1) -eq 4 ]]; then
		case $(uname -r | cut -b 3-4) in
		9. | [1-9][0-9])
			if [[ $test1 == "net.ipv4.tcp_congestion_control = bbr" && $test2 == "net.core.default_qdisc = fq" ]]; then
				local is_bbr=true
			else
				local try_enable_bbr=true
			be
			;;
		esac
	be
	if [[ $is_bbr ]]; then
		echo
		Echo -e "$green BBR is already enabled... no need to install $none"
		echo
	elif [[ $try_enable_bbr ]]; then
		But -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
		But -i '/net.core.default_qdisc/d' /etc/sysctl.conf
		echo "net.ipv4.tcp_congestion_control = bbr" >>/etc/sysctl.conf
		echo "net.core.default_qdisc = fq" >>/etc/sysctl.conf
		sysctl -p >/dev/null 2>&1
		echo
		Echo -e "$green .. Since your VPS kernel supports turning on BBR...BBR optimization has been enabled for you....$none"
		echo
	else
		# https://teddysun.com/489.html
		bash <(curl -s -L https://github.com/teddysun/across/raw/master/bbr.sh)
	be
}
install_lotserver() {
	# https://moeclub.org/2017/03/08/14/
	wget --no-check-certificate -qO /tmp/appex.sh "https://raw.githubusercontent.com/0oVicero0/serverSpeeder_Install/master/appex.sh"
	bash /tmp/appex.sh 'install'
	rm -rf /tmp/appex.sh
}
uninstall_lotserver() {
	# https://moeclub.org/2017/03/08/14/
	wget --no-check-certificate -qO /tmp/appex.sh "https://raw.githubusercontent.com/0oVicero0/serverSpeeder_Install/master/appex.sh"
	bash /tmp/appex.sh 'uninstall'
	rm -rf /tmp/appex.sh
}

open_port() {
	if [[ $cmd == "apt-get" ]]; then
		if [[ $1 != "multiport" ]]; then
			# if [[ $cmd == "apt-get" ]]; then
			iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $1 -j ACCEPT
			iptables -I INPUT -m state --state NEW -m udp -p udp --dport $1 -j ACCEPT
			ip6tables -I INPUT -m state --state NEW -m tcp -p tcp --dport $1 -j ACCEPT
			ip6tables -I INPUT -m state --state NEW -m udp -p udp --dport $1 -j ACCEPT

			# iptables-save >/etc/iptables.rules.v4
			# ip6tables-save >/etc/iptables.rules.v6
			# else
			# 	firewall-cmd --permanent --zone=public --add-port=$1/tcp
			# 	firewall-cmd --permanent --zone=public --add-port=$1/udp
			# 	firewall-cmd --reload
			# fi
		else
			# if [[ $cmd == "apt-get" ]]; then
			local multiport="${v2ray_dynamic_port_start_input}:${v2ray_dynamic_port_end_input}"
			iptables -I INPUT -p tcp --match multiport --dports $multiport -j ACCEPT
			iptables -I INPUT -p udp --match multiport --dports $multiport -j ACCEPT
			ip6tables -I INPUT -p tcp --match multiport --dports $multiport -j ACCEPT
			ip6tables -I INPUT -p udp --match multiport --dports $multiport -j ACCEPT

			# iptables-save >/etc/iptables.rules.v4
			# ip6tables-save >/etc/iptables.rules.v6
			# else
			# 	local multi_port="${v2ray_dynamic_port_start_input}-${v2ray_dynamic_port_end_input}"
			# 	firewall-cmd --permanent --zone=public --add-port=$multi_port/tcp
			# 	firewall-cmd --permanent --zone=public --add-port=$multi_port/udp
			# 	firewall-cmd --reload
			# fi
		be
		iptables-save >/etc/iptables.rules.v4
		ip6tables-save >/etc/iptables.rules.v6
		# else
		# 	service iptables save >/dev/null 2>&1
		# 	service ip6tables save >/dev/null 2>&1
	be

}
del_port () {
	if [[ $cmd == "apt-get" ]]; then
		if [[ $1 != "multiport" ]]; then
			# if [[ $cmd == "apt-get" ]]; then
			iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $1 -j ACCEPT
			iptables -D INPUT -m state --state NEW -m udp -p udp --dport $1 -j ACCEPT
			ip6tables -D INPUT -m state --state NEW -m tcp -p tcp --dport $1 -j ACCEPT
			ip6tables -D INPUT -m state --state NEW -m udp -p udp --dport $1 -j ACCEPT
			# else
			# 	firewall-cmd --permanent --zone=public --remove-port=$1/tcp
			# 	firewall-cmd --permanent --zone=public --remove-port=$1/udp
			# fi
		else
			# if [[ $cmd == "apt-get" ]]; then
			local ports="${v2ray_dynamicPort_start}:${v2ray_dynamicPort_end}"
			iptables -D INPUT -p tcp --match multiport --dports $ports -j ACCEPT
			iptables -D INPUT -p udp --match multiport --dports $ports -j ACCEPT
			ip6tables -D INPUT -p tcp --match multiport --dports $ports -j ACCEPT
			ip6tables -D INPUT -p udp --match multiport --dports $ports -j ACCEPT
			# else
			# 	local ports="${v2ray_dynamicPort_start}-${v2ray_dynamicPort_end}"
			# 	firewall-cmd --permanent --zone=public --remove-port=$ports/tcp
			# 	firewall-cmd --permanent --zone=public --remove-port=$ports/udp
			# fi
		be
		iptables-save >/etc/iptables.rules.v4
		ip6tables-save >/etc/iptables.rules.v6
		# else
		# 	service iptables save >/dev/null 2>&1
		# 	service ip6tables save >/dev/null 2>&1
	be
}
update() {
	while :; do
		echo
		Echo -e "$yellow 1. $none update V2Ray main program"
		echo
		Echo -e "$yellow 2. $none update V2Ray management script"
		echo
		Read -p "$(echo -e "Please select [${magenta}1-2$none]:")" _opt
		if [[ -z $_opt ]]; then
			error
		else
			case $_opt in
			1)
				update_v2ray
				break
				;;
			2)
				update_v2ray.sh
				exit
				break
				;;
			*)
				error
				;;
			esac
		be
	done
}
update_v2ray() {
	_load download-v2ray.sh
	_update_v2ray_version
}
update_v2ray.sh() {
	if [[ $_test ]]; then
		local latest_version=$(curl -H 'Cache-Control: no-cache' -s -L "https://raw.githubusercontent.com/233boy/v2ray/test/v2ray.sh" | grep '_version' -m1 | cut -d\" -f2)
	else
		local latest_version=$(curl -H 'Cache-Control: no-cache' -s -L "https://raw.githubusercontent.com/233boy/v2ray/master/v2ray.sh" | grep '_version' -m1 | cut -d\" -f2)
	be

	if [[ ! $latest_version ]]; then
		echo
		Echo -e " $red gets the latest version of V2Ray failed!!! $none"
		echo
		Echo -e " Please try the following command: $green echo 'nameserver 8.8.8.8' >/etc/resolv.conf $none"
		echo
		Echo " Then continue...."
		echo
		exit 1
	be

	if [[ $latest_version == $_version ]]; then
		echo
		Echo -e "$green has found a new version of $none"
		echo
	else
		echo
		Echo -e " $green 咦...Found the new version yeah... is desperately updating.......$none"
		echo
		cd /etc/v2ray/233boy/v2ray
		git pull
		cp -f /etc/v2ray/233boy/v2ray/v2ray.sh $_v2ray_sh
		chmod +x $_v2ray_sh
		echo
		Echo -e "$green update succeeded... current V2Ray management script version: ${cyan}$l atest_version$none"
		echo
	be

}
uninstall_v2ray() {
	_load uninstall.sh
}
config() {
	_load config.sh

	if [[ $v2ray_port == "80" ]]; then
		if [[ $cmd == "yum" ]]; then
			[[ $(pgrep "httpd") ]] && systemctl stop httpd >/dev/null 2>&1
			[[ $(command -v httpd) ]] && yum remove httpd -y >/dev/null 2>&1
		else
			[[ $(pgrep "apache2") ]] && service apache2 stop >/dev/null 2>&1
			[[ $(command -v apache2) ]] && apt-get remove apache2* -y >/dev/null 2>&1
		be
	be
	do_service restart v2ray
}
backup_config() {
	for keys in $*; do
		case $keys in
		v2ray_transport)
			sed -i "18s/=$v2ray_transport/=$v2ray_transport_opt/" $backup
			;;
		v2ray_port)
			sed -i "21s/=$v2ray_port/=$v2ray_port_opt/" $backup
			;;
		uuid)
			sed -i "24s/=$v2ray_id/=$uuid/" $backup
			;;
		alterId)
			sed -i "27s/=$alterId/=$new_alterId/" $backup
			;;
		v2ray_dynamicPort_start)
			sed -i "30s/=$v2ray_dynamicPort_start/=$v2ray_dynamic_port_start_input/" $backup
			;;
		v2ray_dynamicPort_end)
			sed -i "33s/=$v2ray_dynamicPort_end/=$v2ray_dynamic_port_end_input/" $backup
			;;
		domain)
			sed -i "36s/=$domain/=$new_domain/" $backup
			;;
		caddy)
			sed -i "39s/=/=true/" $backup
			;;
		+ss)
			sed -i "42s/=/=true/; 45s/=$ssport/=$new_ssport/; 48s/=$sspass/=$new_sspass/; 51s/=$ssciphers/=$new_ssciphers/" $backup
			;;
		-ss)
			sed -i "42s/=true/=/" $backup
			;;
		ssport)
			sed -i "45s/=$ssport/=$new_ssport/" $backup
			;;
		sspass)
			sed -i "48s/=$sspass/=$new_sspass/" $backup
			;;
		ssciphers)
			sed -i "51s/=$ssciphers/=$new_ssciphers/" $backup
			;;
		+ad)
			sed -i "54s/=/=true/" $backup
			;;
		-ad)
			sed -i "54s/=true/=/" $backup
			;;
		+path)
			sed -i "57s/=/=true/; 60s/=$path/=$new_path/; 63s#=$proxy_site#=$new_proxy_site#" $backup
			;;
		-path)
			sed -i "57s/=true/=/" $backup
			;;
		path)
			sed -i "60s/=$path/=$new_path/" $backup
			;;
		proxy_site)
			sed -i "63s#=$proxy_site#=$new_proxy_site#" $backup
			;;
		+socks)
			sed -i "66s/=/=true/; 69s/=$socks_port/=$new_socks_port/; 72s/=$socks_username/=$new_socks_username/; 75s/=$socks_userpass/=$new_socks_userpass/;" $backup
			;;
		-socks)
			sed -i "66s/=true/=/" $backup
			;;
		socks_port)
			sed -i "69s/=$socks_port/=$new_socks_port/" $backup
			;;
		socks_username)
			sed -i "72s/=$socks_username/=$new_socks_username/" $backup
			;;
		socks_userpass)
			sed -i "75s/=$socks_userpass/=$new_socks_userpass/" $backup
			;;
		+mtproto)
			sed -i "78s/=/=true/; 81s/=$mtproto_port/=$new_mtproto_port/; 84s/=$mtproto_secret/=$new_mtproto_secret/" $backup
			;;
		-mtproto)
			sed -i "78s/=true/=/" $backup
			;;
		mtproto_port)
			sed -i "81s/=$mtproto_port/=$new_mtproto_port/" $backup
			;;
		mtproto_secret)
			sed -i "84s/=$mtproto_secret/=$new_mtproto_secret/" $backup
			;;
		+bt)
			sed -i "87s/=/=true/" $backup
			;;
		-bt)
			sed -i "87s/=true/=/" $backup
			;;
		esac
	done

}

get_ip() {
	ip=$(curl -s https://ipinfo.io/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.ip.sb/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.ipify.org)
	[[ -z $ip ]] && ip=$(curl -s https://ip.seeip.org)
	[[ -z $ip ]] && ip=$(curl -s https://ifconfig.co/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.myip.com | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}")
	[[ -z $ip ]] && ip=$(curl -s icanhazip.com)
	[[ -z $ip ]] && ip=$(curl -s myip.ipip.net | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}")
	[[ -z $ip ]] && echo -e "\n$red This garbage chick is thrown! $none\n" && exit
}

error() {

	Echo -e "\n$red Input error! $none\n"

}

pause() {

	Read -rsp "$(echo -e "Press $green Enter Enter key $none to continue....or press $red Ctrl + C $none to cancel.")" -d $'\n'
	echo
}
do_service() {
	if [[ $systemd ]]; then
		systemctl $1 $2
	else
		service $2 $1
	be
}
_help() {
	echo
	Echo "........... V2Ray management script help information by v2ray6.com .........."
	echo -e "
	${green}v2ray menu $noneManage V2Ray (equivalent to direct input v2ray)

	${green}v2ray info $noneView V2Ray configuration information

	${green}v2ray config $noneModify V2Ray configuration

	${green}v2ray link $none generates a V2Ray client profile link

	${green}v2ray textlink $none generates V2Ray configuration information link

	${green}v2ray qr $none generates V2Ray configuration QR code link

	${green}v2ray ss $noneModify Shadowsocks configuration

	${green}v2ray ssinfo $noneView Shadowsocks configuration information

	${green}v2ray ssqr $none generates Shadowsocks configuration QR code link

	${green}v2ray status $noneView V2Ray running status

	${green}v2ray start $none to start V2Ray

	${green}v2ray stop $none Stop V2Ray

	${green}v2ray restart $none restart V2Ray

	${green}v2ray log $noneView V2Ray run log

	${green}v2ray update $none更新 V2Ray

	${green}v2ray update.sh $noneUpdate V2Ray management script

	${green}v2ray uninstall $none卸载 V2Ray
"
}
menu() {
	clear
	while :; do
		echo
		Echo "........... V2Ray management script $_version by v2ray6.com .........."
		echo
		Echo -e "## V2Ray Version: $cyan$v2ray_ver$none / V2Ray Status: $v2ray_status ##"
		echo
		Echo "Help Description: https://v2ray6.com/post/1/"
		echo
		Echo "Feedback question: https://github.com/233boy/v2ray/issues"
		echo
		Echo "TG group: https://t.me/blog233"
		echo
		echo "donation script author: https://v2ray6.com/donate/"
		echo
		Echo "Giving V2Ray: https://www.v2ray.com/chapter_00/02_donate.html"
		echo
		Echo -e "$yellow 1. $none view V2Ray configuration"
		echo
		Echo -e "$yellow 2. $none modify V2Ray configuration"
		echo
		Echo -e "$yellow 3. $noneDownload V2Ray Configuration / Generate Configuration Information Link / Generate QR Code Link"
		echo
		Echo -e "$yellow 4. $noneView Shadowsocks Configuration / Generate QR Code Link"
		echo
		Echo -e "$yellow 5. $none to modify the Shadowsocks configuration"
		echo
		Echo -e "$yellow 6. $noneView MTProto Configuration / Modify MTProto Configuration"
		echo
		Echo -e "$yellow 7. $noneView Socks5 Configuration / Modify Socks5 Configuration"
		echo
		Echo -e "$yellow 8. $none start/stop/restart/view log"
		echo
		Echo -e "$yellow 9. $none update V2Ray / update V2Ray management script"
		echo
		Echo -e "$yellow 10. $none uninstall V2Ray"
		echo
		Echo -e "$yellow 11. $none other"
		echo
		Echo -e "Tips... if you don't want to execute the option... press $yellow Ctrl + C $none to quit"
		echo
		Read -p "$(echo -e "Please select the menu [${magenta}1-11$none]:")" choose
		if [[ -z $choose ]]; then
			exit 1
		else
			case $choose in
			1)
				view_v2ray_config_info
				break
				;;
			2)
				change_v2ray_config
				break
				;;
			3)
				download_v2ray_config
				break
				;;
			4)
				get_shadowsocks_config
				break
				;;
			5)
				change_shadowsocks_config
				break
				;;
			6)
				_load mtproto.sh
				_mtproto_main
				break
				;;
			7)
				_load socks.sh
				_socks_main
				break
				;;
			8)
				v2ray_service
				break
				;;
			9)
				update
				break
				;;
			10)
				uninstall_v2ray
				break
				;;
			11)
				other
				break
				;;
			*)
				error
				;;
			esac
		be
	done
}
args=$1
[ -z $1 ] && args="menu"
case $args in
menu)
	menu
	;;
and | info)
	view_v2ray_config_info
	;;
c | config)
	change_v2ray_config
	;;
l | link)
	get_v2ray_config_link
	;;
L | infolink)
	get_v2ray_config_info_link
	;;
q | qr)
	get_v2ray_config_qr_link
	;;
s | ss)
	change_shadowsocks_config
	;;
S | ssinfo)
	view_shadowsocks_config_info
	;;
Q | ssqr)
	get_shadowsocks_config_qr_link
	;;
socks)
	_load socks.sh
	_socks_main
	;;
socksinfo)
	_load socks.sh
	_view_socks_info
	;;
tg)
	_load mtproto.sh
	_mtproto_main
	;;
tginfo)
	_load mtproto.sh
	_view_mtproto_info
	;;
bt)
	_load bt.sh
	_ban_bt_main
	;;
status)
	echo
	if [[ $v2ray_transport == [45] && $caddy ]]; then
		Echo -e " V2Ray Status: $v2ray_status / Caddy Status: $caddy_run_status"
	else
		Echo -e " V2Ray Status: $v2ray_status"
	be
	echo
	;;
start)
	start_v2ray
	;;
stop)
	stop_v2ray
	;;
restart)
	[[ $v2ray_transport == [45] && $caddy ]] && do_service restart caddy
	restart_v2ray
	;;
reload)
	config
	[[ $v2ray_transport == [45] && $caddy ]] && caddy_config
	clear
	view_v2ray_config_info
	;;
time)
	date -s "$(curl -sI g.cn | grep Date | cut -d' ' -f3-6)Z"
	;;
log)
	view_v2ray_log
	;;
url | URL)
	get_v2ray_vmess_URL_link
	;;
u | update)
	update_v2ray
	;;
U | update.sh)
	update_v2ray.sh
	exit
	;;
un | uninstall)
	uninstall_v2ray
	;;
reinstall)
	uninstall_v2ray
	if [[ $is_uninstall_v2ray ]]; then
		cd
		cd - >/dev/null 2>&1
		bash <(curl -s -L https://git.io/v2ray.sh)
	be
	;;
[aA][Ii] | [Dd])
	change_v2ray_alterId
	;;
[aA][Ii][aA][Ii] | [Dd][Dd])
	custom_uuid
	;;
reuuid)
	backup_config uuid
	v2ray_id=$uuid
	config
	clear
	view_v2ray_config_info
	# download_v2ray_config_ask
	;;
v | version)
	echo
	Echo -e " Current V2Ray Version: ${green}$v2ray_ver$none / Current V2Ray Management Script Version: ${cyan}$_version$none"
	echo
	;;
bbr)
	other
	;;
help | *)
	_help
	;;
esac
