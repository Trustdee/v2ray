#!/bin/bash

red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta = '\ e [95m'
cyan='\e[96m'
none='\e[0m'

# Root
[[ $(id -u) != 0 ]] && echo -e "\n Oops... Please use ${red}root ${none} to run ${yellow}~(^_^) ${none} \n" && exit 1

cmd="apt-get"

sys_bit=$(uname -m)

if [[ $sys_bit == "i386" || $sys_bit == "i686" ]]; then
	v2ray_bit="32"
elif [[ $sys_bit == "x86_64" ]]; then
	v2ray_bit="64"
else
	echo -e " 
	Haha... This ${red} spicy chicken script ${none} doesn't support your system. ${yellow}(-_-) ${none}

	Note: Only Ubuntu 16+ / Debian 8+ / CentOS 7+ systems are supported
	" && exit 1
be

#笨笨的检测方法
if [[ -f /usr/bin/apt-get || -f /usr/bin/yum ]] && [[ -f /bin/systemctl ]]; then

	if [[ -f /usr/bin/yum ]]; then

		cmd="yum"

	be

else

	echo -e " 
	Haha... This ${red} spicy chicken script ${none} doesn't support your system. ${yellow}(-_-) ${none}

	Note: Only Ubuntu 16+ / Debian 8+ / CentOS 7+ systems are supported
	" && exit 1

be

uuid=$(cat /proc/sys/kernel/random/uuid)
old_id="e55c8d17-2cf3-b21a-bcf1-eeacb011ed79"
v2ray_server_config="/etc/v2ray/config.json"
v2ray_client_config="/etc/v2ray/233blog_v2ray_config.json"
backup="/etc/v2ray/233blog_v2ray_backup.conf"
_v2ray_sh="/usr/local/sbin/v2ray"
systemd=true
# _test=true

transport=(
	TCP
	TCP_HTTP
	WebSocket
	"WebSocket + TLS"
	HTTP/2
	mKCP
	mKCP_utp
	mKCP_srtp
	mKCP_wechat-video
	mKCP_dtls
	mKCP_wireguard
	QUIC
	QUIC_utp
	QUIC_srtp
	QUIC_wechat-video
	QUIC_dtls
	QUIC_wireguard
	TCP_dynamicPort
	TCP_HTTP_dynamicPort
	WebSocket_dynamicPort
	mKCP_dynamicPort
	mKCP_utp_dynamicPort
	mKCP_srtp_dynamicPort
	mKCP_wechat-video_dynamicPort
	mKCP_dtls_dynamicPort
	mKCP_wireguard_dynamicPort
	QUIC_dynamicPort
	QUIC_utp_dynamicPort
	QUIC_srtp_dynamicPort
	QUIC_wechat-video_dynamicPort
	QUIC_dtls_dynamicPort
	QUIC_wireguard_dynamicPort
)

ciphers=(
	aes-128-cfb
	aes-256-cfb
	chacha20
	chacha20-ietf
	aes-128-gcm
	aes-256-gcm
	chacha20-ietf-poly1305
)

_load() {
	local _dir="/etc/v2ray/233boy/v2ray/src/"
	. "${_dir}$@"
}

v2ray_config() {
	# clear
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
		Read -p "$(echo -e " (default protocol: ${cyan}TCP$none)"):" v2ray_transport
		[ -z "$v2ray_transport" ] && v2ray_transport=1
		case $v2ray_transport in
		[1-9] | [1-2][0-9] | 3[0-2])
			echo
			echo
			Echo -e "$yellow V2Ray transport protocol = $cyan${transport[$v2ray_transport - 1]}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		*)
			error
			;;
		esac
	done
	v2ray_port_config
}
v2ray_port_config() {
	case $v2ray_transport in
	4 | 5)
		tls_config
		;;
	*)
		local random=$(shuf -i20001-65535 -n1)
		while :; do
			Echo -e "Please enter "$yellow"V2Ray"$none" port["$magenta"1-65535"$none"]"
			Read -p "$(echo -e " (default port: ${cyan}${random}$none):")" v2ray_port
			[ -z "$v2ray_port" ] && v2ray_port=$random
			case $v2ray_port in
			[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
				echo
				echo
				echo -e "$yellow V2Ray 端口 = $cyan$v2ray_port$none"
				echo "----------------------------------------------------------------"
				echo
				break
				;;
			*)
				error
				;;
			esac
		done
		if [[ $v2ray_transport -ge 18 ]]; then
			v2ray_dynamic_port_start
		be
		;;
	esac
}

v2ray_dynamic_port_start() {

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
			echo
			echo
			Echo -e "$yellow V2Ray dynamic port start = $cyan$v2ray_dynamic_port_start_input$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		*)
			error
			;;
		esac

	done

	if [[ $v2ray_dynamic_port_start_input -lt $v2ray_port ]]; then
		lt_v2ray_port=true
	be

	v2ray_dynamic_port_end
}
v2ray_dynamic_port_end() {

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
				Echo -e " current V2Ray port: ${cyan}$v2ray_port${none}"
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

tls_config() {

	echo
	local random=$(shuf -i20001-65535 -n1)
	while :; do
		Echo -e "Please enter "$yellow"V2Ray"$none" port["$magenta"1-65535"$none"], cannot select "$magenta"80"$none" or "$magenta"443"$none "port"
		Read -p "$(echo -e " (default port: ${cyan}${random}$none):")" v2ray_port
		[ -z "$v2ray_port" ] && v2ray_port=$random
		case $v2ray_port in
		80)
			echo
			Echo "...all said that you can't choose port 80....."
			error
			;;
		443)
			echo
			Echo ".. said that you can not choose port 443....."
			error
			;;
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			echo
			echo
			echo -e "$yellow V2Ray 端口 = $cyan$v2ray_port$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		*)
			error
			;;
		esac
	done

	while :; do
		echo
		Echo -e "Please enter a $magenta correct domain name $none, be sure to be correct, no! Yes! Out! Wrong!"
		Read -p "(example: 233blog.com): " domain
		[ -z "$domain" ] && error && continue
		echo
		echo
		Echo -e "$yellow your domain name = $cyan$domain$none"
		echo "----------------------------------------------------------------"
		break
	done
	get_ip
	echo
	echo
	Echo -e "$yellow Please parse $magenta$domain$none $yellow to: $cyan$ip$none"
	echo
	Echo -e "$yellow Please parse $magenta$domain$none $yellow to: $cyan$ip$none"
	echo
	Echo -e "$yellow Please parse $magenta$domain$none $yellow to: $cyan$ip$none"
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

	if [[ $v2ray_transport -ne 5 ]]; then
		auto_tls_config
	else
		caddy=true
		Install_caddy_info="Open"
	be

	if [[ $caddy ]]; then
		path_config_ask
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
				caddy=true
				Install_caddy_info="Open"
				echo
				echo
				Echo -e "$yellow auto-configure TLS = $cyan$install_caddy_info$none"
				echo "----------------------------------------------------------------"
				echo
				break
			elif [[ "$auto_install_caddy" == [Nn] ]]; then
				Install_caddy_info="Close"
				echo
				echo
				Echo -e "$yellow auto-configure TLS = $cyan$install_caddy_info$none"
				echo "----------------------------------------------------------------"
				echo
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
		read -p "$(echo -e "(默认: [${cyan}233blog$none]):")" path
		[[ -z $path ]] && path="233blog"

		case $path in
		*[/$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the shunt path cannot contain $red / $none or $red $ $none...."
			echo
			error
			;;
		*)
			echo
			echo
			Echo -e "$yellow shunt path = ${cyan}/${path}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		esac
	done
	is_path=true
	proxy_site_config
}
proxy_site_config() {
	echo
	while :; do
		Echo -e "Please enter ${magenta} with a correct $none ${cyan} URL $none used as a camouflage $none for the ${cyan} site, eg https://liyafly.com"
		Echo -e "Example... your current domain name is $green$domain$none , the URL of the disguise is https://liyafly.com"
		Echo -e "When you open your domain name... the content displayed is the content from https://liyafly.com"
		Echo -e "is actually an anti-generation...just understand..."
		Echo -e "If you can't pretend to succeed... you can use v2ray config to modify the spoofed URL"
		read -p "$(echo -e "(默认: [${cyan}https://liyafly.com$none]):")" proxy_site
		[[ -z $proxy_site ]] && proxy_site="https://liyafly.com"

		case $proxy_site in
		*[#$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the fake URL cannot contain $red # $none or $red $ $none...."
			echo
			error
			;;
		*)
			echo
			echo
			Echo -e "$yellow camouflaged URL = ${cyan}${proxy_site}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		esac
	done
}

blocked_hosts() {
	echo
	while :; do
		Echo -e " Whether to enable ad blocking (which will affect performance) [${magenta}Y/N$none]"
		read -p "$(echo -e "(默认 [${cyan}N$none]):")" blocked_ad
		[[ -z $blocked_ad ]] && blocked_ad="n"

		case $blocked_ad in
		Y | y)
			Blocked_ad_info="on"
			ban_ad=true
			echo
			echo
			Echo -e "$yellow ad blocking = $cyan open $none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		N | n)
			blocked_ad_info="关闭"
			echo
			echo
			Echo -e "$yellow ad blocking = $cyan off $none"
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
shadowsocks_config() {

	echo

	while :; do
		Echo -e "Do you configure ${yellow}Shadowsocks${none} [${magenta}Y/N$none]"
		read -p "$(echo -e "(默认 [${cyan}N$none]):") " install_shadowsocks
		[[ -z "$install_shadowsocks" ]] && install_shadowsocks="n"
		if [[ "$install_shadowsocks" == [Yy] ]]; then
			echo
			shadowsocks=true
			shadowsocks_port_config
			break
		elif [[ "$install_shadowsocks" == [Nn] ]]; then
			break
		else
			error
		be

	done

}

shadowsocks_port_config() {
	local random=$(shuf -i20001-65535 -n1)
	while :; do
		Echo -e "Please enter "$yellow"Shadowsocks"$none" port["$magenta"1-65535"$none"], not the same as "$yellow"V2Ray"$none" port"
		Read -p "$(echo -e " (default port: ${cyan}${random}$none):") " ssport
		[ -z "$ssport" ] && ssport=$random
		case $ssport in
		$v2ray_port)
			echo
			Echo "Can't be the same as the V2Ray port...."
			error
			;;
		[1-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9] | [1-5][0-9][0-9][0-9][0-9] | 6[0-4][0-9][0-9][0-9] | 65[0-4][0-9][0-9] | 655[0-3][0-5])
			if [[ $v2ray_transport == [45] ]]; then
				local tls=ture
			be
			if [[ $tls && $ssport == "80" ]] || [[ $tls && $ssport == "443" ]]; then
				echo
				Echo -e "Because you have chosen "$green"WebSocket + TLS $none or $green HTTP/2"$none" transport protocol."
				echo
				Echo -e "so you can't select "$magenta"80"$none" or "$magenta"443"$none" port"
				error
			elif [[ $v2ray_dynamic_port_start_input == $ssport || $v2ray_dynamic_port_end_input == $ssport ]]; then
				local multi_port="${v2ray_dynamic_port_start_input} - ${v2ray_dynamic_port_end_input}"
				echo
				Echo " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: $multi_port"
				error
			elif [[ $v2ray_dynamic_port_start_input -lt $ssport && $ssport -le $v2ray_dynamic_port_end_input ]]; then
				local multi_port="${v2ray_dynamic_port_start_input} - ${v2ray_dynamic_port_end_input}"
				echo
				Echo " Sorry, this port conflicts with the V2Ray dynamic port. The current V2Ray dynamic port range is: $multi_port"
				error
			else
				echo
				echo
				echo -e "$yellow Shadowsocks 端口 = $cyan$ssport$none"
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

	shadowsocks_password_config
}
shadowsocks_password_config() {

	while :; do
		Echo -e "Please enter "$yellow"Shadowsocks"$none" password"
		Read -p "$(echo -e " (default password: ${cyan}233blog.com$none)"): " sspass
		[ -z "$sspass" ] && sspass="233blog.com"
		case $sspass in
		*[/$]*)
			echo
			Echo -e " Since this script is too spicy chicken.. so the password can not contain $red / $none or $red $ $none these two symbols...."
			echo
			error
			;;
		*)
			echo
			echo
			echo -e "$yellow Shadowsocks 密码 = $cyan$sspass$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		esac

	done

	shadowsocks_ciphers_config
}
shadowsocks_ciphers_config() {

	while :; do
		Echo -e "Please select "$yellow"Shadowsocks"$none" encryption protocol [${magenta}1-${#ciphers[*]}$none]"
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
			ssciphers=${ciphers[$ssciphers_opt - 1]}
			echo
			echo
			Echo -e "$yellow Shadowsocks Encryption Protocol = $cyan${ssciphers}$none"
			echo "----------------------------------------------------------------"
			echo
			break
			;;
		*)
			error
			;;
		esac

	done
	pause
}

install_info() {
	clear
	echo
	Echo "....ready to install it.. Look at the hairy configuration is correct..."
	echo
	Echo "---------- Installation Information -------------"
	echo
	Echo -e "$yellow V2Ray transport protocol = $cyan${transport[$v2ray_transport - 1]}$none"

	if [[ $v2ray_transport == [45] ]]; then
		echo
		echo -e "$yellow V2Ray 端口 = $cyan$v2ray_port$none"
		echo
		Echo -e "$yellow your domain name = $cyan$domain$none"
		echo
		Echo -e "$yellow domain name resolution = ${cyan} I'm sure I have parsed $none"
		echo
		Echo -e "$yellow auto-configure TLS = $cyan$install_caddy_info$none"

		if [[ $ban_ad ]]; then
			echo
			Echo -e "$yellow ad blocking = $cyan$blocked_ad_info$none"
		be
		if [[ $is_path ]]; then
			echo
			Echo -e "$yellow path shunt = ${cyan}/${path}$none"
		be
	elif [[ $v2ray_transport -ge 18 ]]; then
		echo
		echo -e "$yellow V2Ray 端口 = $cyan$v2ray_port$none"
		echo
		Echo -e "$yellow V2Ray dynamic port range = $cyan${v2ray_dynamic_port_start_input} - ${v2ray_dynamic_port_end_input}$none"

		if [[ $ban_ad ]]; then
			echo
			Echo -e "$yellow ad blocking = $cyan$blocked_ad_info$none"
		be
	else
		echo
		echo -e "$yellow V2Ray 端口 = $cyan$v2ray_port$none"

		if [[ $ban_ad ]]; then
			echo
			Echo -e "$yellow ad blocking = $cyan$blocked_ad_info$none"
		be
	be
	if [ $shadowsocks ]; then
		echo
		echo -e "$yellow Shadowsocks 端口 = $cyan$ssport$none"
		echo
		echo -e "$yellow Shadowsocks 密码 = $cyan$sspass$none"
		echo
		Echo -e "$yellow Shadowsocks Encryption Protocol = $cyan${ssciphers}$none"
	else
		echo
		Echo -e "$yellow whether to configure Shadowsocks = ${cyan} not configured ${none}"
	be
	echo
	echo "---------- END -------------"
	echo
	pause
	echo
}

domain_check() {
	# if [[ $cmd == "yum" ]]; then
	# 	yum install bind-utils -y
	# else
	# 	$cmd install dnsutils -y
	# fi
	# test_domain=$(dig $domain +short)
	test_domain=$(ping $domain -c 1 | grep -oE -m1 "([0-9]{1,3}\.){3}[0-9]{1,3}")
	if [[ $test_domain != $ip ]]; then
		echo
		Echo -e "$red detects domain name resolution error....$none"
		echo
		Echo -e " Your domain name: $yellow$domain$none Unresolved to: $cyan$ip$none"
		echo
		Echo -e " Your domain name is currently resolved to: $cyan$test_domain$none"
		echo
		Echo "Remarks... If your domain name is resolved using Cloudflare.. Click on the icon in Status.. Make it grayed out"
		echo
		exit 1
	be
}

install_caddy() {
	# download caddy file then install
	_load download-caddy.sh
	_download_caddy_file
	_install_caddy_service
	caddy_config

}
caddy_config() {
	# local email=$(shuf -i1-10000000000 -n1)
	_load caddy-config.sh

	# systemctl restart caddy
	do_service restart caddy
}

install_v2ray() {
	$cmd update -y
	if [[ $cmd == "apt-get" ]]; then
		$cmd install -y lrzsz git zip unzip curl wget qrencode libcap2-bin
	else
		# $cmd install -y lrzsz git zip unzip curl wget qrencode libcap iptables-services
		$cmd install -y lrzsz git zip unzip curl wget qrencode libcap
	be
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	[ -d /etc/v2ray ] && rm -rf /etc/v2ray
	date -s "$(curl -sI g.cn | grep Date | cut -d' ' -f3-6)Z"

	if [[ $local_install ]]; then
		if [[ ! -d $(pwd)/config ]]; then
			echo
			Echo -e "$red Oh, ah... the installation failed...$none"
			echo
			Echo -e " Make sure you have a full V2Ray one-click install script & administration script for v2ray6.com to the current ${green}$(pwd) $none directory"
			echo
			exit 1
		be
		mkdir -p /etc/v2ray/233boy/v2ray
		cp -rf $(pwd)/* /etc/v2ray/233boy/v2ray
	else
		pushd /tmp
		git clone https://github.com/233boy/v2ray -b "$_gitbranch" /etc/v2ray/233boy/v2ray
		popd

	be

	if [[ ! -d /etc/v2ray/233boy/v2ray ]]; then
		echo
		Echo -e "$red Oops... Clone script repository is wrong...$none"
		echo
		Echo -e " Tips..... Please try to install Git yourself: ${green}$cmd install -y git $none and then install this script"
		echo
		exit 1
	be

	# download v2ray file then install
	_load download-v2ray.sh
	_download_v2ray_file
	_install_v2ray_service
	_mkdir_dir
}

open_port() {
	if [[ $cmd == "apt-get" ]]; then
		if [[ $1 != "multiport" ]]; then

			iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $1 -j ACCEPT
			iptables -I INPUT -m state --state NEW -m udp -p udp --dport $1 -j ACCEPT
			ip6tables -I INPUT -m state --state NEW -m tcp -p tcp --dport $1 -j ACCEPT
			ip6tables -I INPUT -m state --state NEW -m udp -p udp --dport $1 -j ACCEPT

			# firewall-cmd --permanent --zone=public --add-port=$1/tcp
			# firewall-cmd --permanent --zone=public --add-port=$1/udp
			# firewall-cmd --reload

		else

			local multiport="${v2ray_dynamic_port_start_input}:${v2ray_dynamic_port_end_input}"
			iptables -I INPUT -p tcp --match multiport --dports $multiport -j ACCEPT
			iptables -I INPUT -p udp --match multiport --dports $multiport -j ACCEPT
			ip6tables -I INPUT -p tcp --match multiport --dports $multiport -j ACCEPT
			ip6tables -I INPUT -p udp --match multiport --dports $multiport -j ACCEPT

			# local multi_port="${v2ray_dynamic_port_start_input}-${v2ray_dynamic_port_end_input}"
			# firewall-cmd --permanent --zone=public --add-port=$multi_port/tcp
			# firewall-cmd --permanent --zone=public --add-port=$multi_port/udp
			# firewall-cmd --reload

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

config() {
	cp -f /etc/v2ray/233boy/v2ray/config/backup.conf $backup
	cp -f /etc/v2ray/233boy/v2ray/v2ray.sh $_v2ray_sh
	chmod +x $_v2ray_sh

	v2ray_id=$uuid
	alterId=233
	ban_bt = true
	if [[ $v2ray_transport -ge 18 ]]; then
		v2ray_dynamicPort_start=${v2ray_dynamic_port_start_input}
		v2ray_dynamicPort_end=${v2ray_dynamic_port_end_input}
	be
	_load config.sh

	if [[ $cmd == "apt-get" ]]; then
		cat >/etc/network/if-pre-up.d/iptables <<-EOF
#!/bin/sh
/sbin/iptables-restore < /etc/iptables.rules.v4
/sbin/ip6tables-restore < /etc/iptables.rules.v6
	EOF
		chmod +x /etc/network/if-pre-up.d/iptables
		# else
		# 	[ $(pgrep "firewall") ] && systemctl stop firewalld
		# 	systemctl mask firewalld
		# 	systemctl disable firewalld
		# 	systemctl enable iptables
		# 	systemctl enable ip6tables
		# 	systemctl start iptables
		# 	systemctl start ip6tables
	be

	[[ $shadowsocks ]] && open_port $ssport
	if [[ $v2ray_transport == [45] ]]; then
		open_port "80"
		open_port "443"
		open_port $v2ray_port
	elif [[ $v2ray_transport -ge 18 ]]; then
		open_port $v2ray_port
		open_port "multiport"
	else
		open_port $v2ray_port
	be
	# systemctl restart v2ray
	do_service restart v2ray
	backup_config

}

backup_config() {
	sed -i "18s/=1/=$v2ray_transport/; 21s/=2333/=$v2ray_port/; 24s/=$old_id/=$uuid/" $backup
	if [[ $v2ray_transport -ge 18 ]]; then
		sed -i "30s/=10000/=$v2ray_dynamic_port_start_input/; 33s/=20000/=$v2ray_dynamic_port_end_input/" $backup
	be
	if [[ $shadowsocks ]]; then
		sed -i "42s/=/=true/; 45s/=6666/=$ssport/; 48s/=233blog.com/=$sspass/; 51s/=chacha20-ietf/=$ssciphers/" $backup
	be
	[[ $v2ray_transport == [45] ]] && sed -i "36s/=233blog.com/=$domain/" $backup
	[[ $caddy ]] && sed -i "39s/=/=true/" $backup
	[[ $ban_ad ]] && sed -i "54s/=/=true/" $backup
	if [[ $is_path ]]; then
		sed -i "57s/=/=true/; 60s/=233blog/=$path/" $backup
		sed -i "63s#=https://liyafly.com#=$proxy_site#" $backup
	be
}

try_enable_bbr() {
	if [[ $(uname -r | cut -b 1) -eq 4 ]]; then
		case $(uname -r | cut -b 3-4) in
		9. | [1-9][0-9])
			But -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
			But -i '/net.core.default_qdisc/d' /etc/sysctl.conf
			echo "net.ipv4.tcp_congestion_control = bbr" >>/etc/sysctl.conf
			echo "net.core.default_qdisc = fq" >>/etc/sysctl.conf
			sysctl -p >/dev/null 2>&1
			;;
		esac
	be
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
show_config_info() {
	clear
	_load v2ray-info.sh
	_v2_args
	_v2_info
	_load ss-info.sh

}

install() {
	if [[ -f /usr/bin/v2ray/v2ray && -f /etc/v2ray/config.json ]] && [[ -f $backup && -d /etc/v2ray/233boy/v2ray ]]; then
		echo
		Echo "大佬...you have installed V2Ray...no need to reinstall"
		echo
		Echo -e " $yellow enter ${cyan}v2ray${none} $yellow to manage V2Ray${none}"
		echo
		exit 1
	elif [[ -f /usr/bin/v2ray/v2ray && -f /etc/v2ray/config.json ]] && [[ -f /etc/v2ray/233blog_v2ray_backup.txt && -d /etc/v2ray/233boy/v2ray ]]; then
		echo
		Echo " If you need to continue the installation.. Please uninstall the old version first"
		echo
		Echo -e " $yellow enter ${cyan}v2ray uninstall${none} $yellow to uninstall ${none}"
		echo
		exit 1
	be
	v2ray_config
	blocked_hosts
	shadowsocks_config
	install_info
	try_enable_bbr
	# [[ $caddy ]] && domain_check
	install_v2ray
	if [[ $caddy || $v2ray_port == "80" ]]; then
		if [[ $cmd == "yum" ]]; then
			[[ $(pgrep "httpd") ]] && systemctl stop httpd
			[[ $(command -v httpd) ]] && yum remove httpd -y
		else
			[[ $(pgrep "apache2") ]] && service apache2 stop
			[[ $(command -v apache2) ]] && apt-get remove apache2* -y
		be
	be
	[[ $caddy ]] && install_caddy
	get_ip
	config
	show_config_info
}
uninstall() {

	if [[ -f /usr/bin/v2ray/v2ray && -f /etc/v2ray/config.json ]] && [[ -f $backup && -d /etc/v2ray/233boy/v2ray ]]; then
		. $backup
		if [[ $mark ]]; then
			_load uninstall.sh
		else
			echo
			Echo -e " $yellow enter ${cyan}v2ray uninstall${none} $yellow to uninstall ${none}"
			echo
		be

	elif [[ -f /usr/bin/v2ray/v2ray && -f /etc/v2ray/config.json ]] && [[ -f /etc/v2ray/233blog_v2ray_backup.txt && -d /etc/v2ray/233boy/v2ray ]]; then
		echo
		Echo -e " $yellow enter ${cyan}v2ray uninstall${none} $yellow to uninstall ${none}"
		echo
	else
		echo -e "
		$red Big breasted brother... You seem to have a V2Ray installed.... Unload a chicken...$none

		Note... Only support for uninstalling the V2Ray one-click installation script provided by me (v2ray6.com) is supported.
		" && exit 1
	be

}

args=$1
_gitbranch=$2
[ -z $1 ] && args="online"
case $args in
online)
	#hello world
	[[ -z $_gitbranch ]] && _gitbranch="master"
	;;
local)
	local_install=true
	;;
*)
	echo
	Echo -e " You enter this parameter <$red $args $none> ... what the hell is this... the script doesn't know it wow"
	echo
	Echo -e " This spicy chicken script only supports inputting the $green local / online $none parameter"
	echo
	Echo -e " Enter $yellow local $none to use local installation"
	echo
	Echo -e " Enter $yellow online $none is to use online installation (default)"
	echo
	exit 1
	;;
esac

clear
while :; do
	echo
	Echo "........... V2Ray one-click installation script & management script by v2ray6.com .........."
	echo
	Echo "Help Description: https://v2ray6.com/post/1/"
	echo
	Echo "Building tutorial: https://v2ray6.com/post/2/"
	echo
	Echo " 1. install"
	echo
	Echo " 2. Uninstall"
	echo
	if [[ $local_install ]]; then
		Echo -e "$yellow Tips: Local installation is enabled..$none"
		echo
	be
	read -p "$(echo -e "请选择 [${magenta}1-2$none]:")" choose
	case $choose in
	1)
		install
		break
		;;
	2)
		uninstall
		break
		;;
	*)
		error
		;;
	esac
done
