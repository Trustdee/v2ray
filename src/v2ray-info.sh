[[ -z $ip ]] && get_ip
_v2_args() {
	header="none"
	if [[ $is_path ]]; then
		_path="/$path"
	else
		_path="/"
	be
	case $v2ray_transport in
	1 | 18)
		net="tcp"
		;;
	2 | 19)
		net="tcp"
		header="http"
		host="www.baidu.com"
		;;
	3 | 4 | 20)
		net="ws"
		;;
	5)
		net="h2"
		;;
	6 | 21)
		net="kcp"
		;;
	7 | 22)
		net="kcp"
		header="utp"
		;;
	8 | 23)
		net="kcp"
		header="srtp"
		;;
	9 | 24)
		net="kcp"
		header="wechat-video"
		;;
	10 | 25)
		net="kcp"
		header="dtls"
		;;
	11 | 26)
		net="kcp"
		header="wireguard"
		;;
	12 | 27)
		net="quic"
		;;
	13 | 28)
		net="quic"
		header="utp"
		;;
	14 | 29)
		net="quic"
		header="srtp"
		;;
	15 | 30)
		net="quic"
		header="wechat-video"
		;;
	16 | 31)
		net="quic"
		header="dtls"
		;;
	17 | 32)
		net="quic"
		header="wireguard"
		;;
	esac
}

_v2_info () {
	echo
	echo
	Echo "---------- V2Ray configuration information -------------"
	if [[ $v2ray_transport == [45] ]]; then
		if [[ ! $caddy ]]; then
			echo
			Echo -e " $red warning! $none$yellow please configure TLS... Tutorial: https://v2ray6.com/post/3/$none"
		be
		echo
		echo -e "$yellow 地址 (Address) = $cyan${domain}$none"
		echo
		echo -e "$yellow 端口 (Port) = ${cyan}443${none}"
		echo
		echo -e "$yellow 用户ID (User ID / UUID) = $cyan${v2ray_id}$none"
		echo
		echo -e "$yellow 额外ID (Alter Id) = ${cyan}${alterId}${none}"
		echo
		Echo -e "$yellow transport protocol (Network) = ${cyan}${net}$none"
		echo
		Echo -e "$yellow masquerading type (header type) = ${cyan}${header}$none"
		echo
		Echo -e "$yellow masquerading domain (host) = ${cyan}${domain}$none"
		echo
		echo -e "$yellow 路径 (path) = ${cyan}${_path}$none"
		echo
		echo -e "$yellow TLS (Enable TLS) = ${cyan}打开$none"
		echo
		if [[ $ban_ad ]]; then
			Echo " Note: Ad blocking is turned on.."
			echo
		be
	else
		echo
		echo -e "$yellow 地址 (Address) = $cyan${ip}$none"
		echo
		echo -e "$yellow 端口 (Port) = $cyan$v2ray_port$none"
		echo
		echo -e "$yellow 用户ID (User ID / UUID) = $cyan${v2ray_id}$none"
		echo
		echo -e "$yellow 额外ID (Alter Id) = ${cyan}${alterId}${none}"
		echo
		Echo -e "$yellow transport protocol (Network) = ${cyan}${net}$none"
		echo
		Echo -e "$yellow masquerading type (header type) = ${cyan}${header}$none"
		echo
	be
	if [[ $v2ray_transport -ge 18 ]] && [[ $ban_ad ]]; then
		Echo " Note: Dynamic port is enabled... Ad blocking is turned on..."
		echo
	elif [[ $v2ray_transport -ge 18 ]]; then
		Echo "Note: Dynamic port is enabled..."
		echo
	elif [[ $ban_ad ]]; then
		Echo " Note: Ad blocking is turned on.."
		echo
	be
	echo "---------- END -------------"
	echo
	Echo "V2Ray client tutorial: https://v2ray6.com/post/4/"
	echo
	Echo -e "Hint: Enter $cyan v2ray url $none to generate a vmess URL link / enter $cyan v2ray qr $none to generate a QR code link"
	echo
}
