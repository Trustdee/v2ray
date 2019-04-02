_qr_create() { 
	local vmess="vmess://$(cat /etc/v2ray/vmess_qr.json | base64 -w 0)" 
	local link="https://233boy.github.io/tools/qr.html# ${vmess}" 
	echo 
	echo "---------- V2Ray QR code link for V2RayNG v0.4.1+ / Kitsunebi -------------" 
	echo 
	echo -e ${cyan}$link${none} 
	echo 
	echo 
	echo -e "$red Friendly reminder: Please check the scan code (except V2RayNG) $none" 
	echo 
	echo 
	echo " V2Ray client tutorial: https://v2ray6. Com/post/4/" 
	echo 
	echo 
	rm -rf /etc/v2ray/vmess_qr.json 
} 
_ss_qr() { 
	local ss_link="ss://$(echo -n "${ssciphers}:${sspass}@$ {ip}:${ssport}" | base64 -w 0)#v2ray6.com_ss_${ip}"
	Local link="https://233boy.github.io/tools/qr.html#${ss_link}" 
	echo 
	echo "---------- Shadowsocks QR code link ------- ------" 
	echo 
	echo -e "$yellow link = $cyan$link$none" 
	echo 
	echo -e " Tips...$red Shadowsocks Win 4.0.6 $none client may not recognize the 2D Code " 
	echo 
	echo 
}
