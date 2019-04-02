while :; do
	echo
	read -p "$(echo -e "是否卸载 ${yellow}V2Ray$none [${magenta}Y/N$none]:")" uninstall_v2ray_ask
	if [[ -z $uninstall_v2ray_ask ]]; then
		error
	else
		case $uninstall_v2ray_ask in
		Y | y)
			is_uninstall_v2ray=true
			echo
			Echo -e "$yellow Uninstall V2Ray = ${cyan} is ${none}"
			echo
			break
			;;
		N | n)
			echo
			Echo -e "$red Uninstall has been canceled...$none"
			echo
			break
			;;
		*)
			error
			;;
		esac
	be
done

if [[ $caddy && $is_uninstall_v2ray ]] && [[ -f /usr/local/bin/caddy && -f /etc/caddy/Caddyfile ]]; then
	while :; do
		echo
		read -p "$(echo -e "是否卸载 ${yellow}Caddy$none [${magenta}Y/N$none]:")" uninstall_caddy_ask
		if [[ -z $uninstall_caddy_ask ]]; then
			error
		else
			case $uninstall_caddy_ask in
			Y | y)
				is_uninstall_caddy=true
				echo
				Echo -e "$yellow Uninstall Caddy = ${cyan} is ${none}"
				echo
				break
				;;
			N | n)
				echo
				Echo -e "$yellow Uninstall Caddy = ${cyan} No ${none}"
				echo
				break
				;;
			*)
				error
				;;
			esac
		be
	done
be

if [[ $is_uninstall_v2ray && $is_uninstall_caddy ]]; then
	pause
	echo

	if [[ $shadowsocks ]]; then
		del_port $ssport
	be
	if [[ $socks ]]; then
		del_port $socks_port
	be
	if [[ $mtproto ]]; then
		del_port $mtproto_port
	be

	if [[ $v2ray_transport == [45] ]]; then
		del_port "80"
		del_port "443"
		del_port $v2ray_port
	elif [[ $v2ray_transport -ge 18 ]]; then
		del_port $v2ray_port
		del_port "multiport"
	else
		del_port $v2ray_port
	be

	[ $cmd == "apt-get" ] && rm -rf /etc/network/if-pre-up.d/iptables

	# [ $v2ray_pid ] && systemctl stop v2ray
	[ $v2ray_pid ] && do_service stop v2ray

	rm -rf /usr/bin/v2ray
	rm -rf $_v2ray_sh
	rm -rf /etc/v2ray
	rm -rf /var/log/v2ray

	# [ $caddy_pid ] && systemctl stop caddy
	[ $caddy_pid ] && do_service stop caddy

	rm -rf /usr/local/bin/caddy
	rm -rf /etc/caddy
	rm -rf /etc/ssl/caddy

	if [[ $systemd ]]; then
		systemctl disable v2ray >/dev/null 2>&1
		rm -rf /lib/systemd/system/v2ray.service
		systemctl disable caddy >/dev/null 2>&1
		rm -rf /lib/systemd/system/caddy.service
	else
		update-rc.d -f caddy remove >/dev/null 2>&1
		update-rc.d -f v2ray remove >/dev/null 2>&1
		rm -rf /etc/init.d/caddy
		rm -rf /etc/init.d/v2ray
	be
	# clear
	echo
	Echo -e "$green V2Ray uninstall is complete....none"
	echo
	Echo "If you think this script is not good enough... please tell me"
	echo
	Echo "Feedback question: https://github.com/233boy/v2ray/issues"
	echo

elif [[ $is_uninstall_v2ray ]]; then
	pause
	echo

	if [[ $shadowsocks ]]; then
		del_port $ssport
	be
	if [[ $socks ]]; then
		del_port $socks_port
	be
	if [[ $mtproto ]]; then
		del_port $mtproto_port
	be

	if [[ $v2ray_transport == [45] ]]; then
		del_port "80"
		del_port "443"
		del_port $v2ray_port
	elif [[ $v2ray_transport -ge 18 ]]; then
		del_port $v2ray_port
		del_port "multiport"
	else
		del_port $v2ray_port
	be

	[ $cmd == "apt-get" ] && rm -rf /etc/network/if-pre-up.d/iptables

	# [ $v2ray_pid ] && systemctl stop v2ray
	[ $v2ray_pid ] && do_service stop v2ray

	rm -rf /usr/bin/v2ray
	rm -rf $_v2ray_sh
	rm -rf /etc/v2ray
	rm -rf /var/log/v2ray
	if [[ $systemd ]]; then
		systemctl disable v2ray >/dev/null 2>&1
		rm -rf /lib/systemd/system/v2ray.service
	else
		update-rc.d -f v2ray remove >/dev/null 2>&1
		rm -rf /etc/init.d/v2ray
	be
	# clear
	echo
	Echo -e "$green V2Ray uninstall is complete....none"
	echo
	Echo "If you think this script is not good enough... please tell me"
	echo
	Echo "Feedback question: https://github.com/233boy/v2ray/issues"
	echo
be
