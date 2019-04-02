[[ -z $ip ]] && get_ip 
if [[ $shadowsocks ]]; then 
	local ss="ss://$(echo -n "${ssciphers}:${sspass}@${ip}:${ Ssport}" | base64 -w 0)#v2ray6.com_ss_${ip}" 
	echo 
	echo "---------- Shadowsocks configuration information -------------" 
	echo 
	echo -e "$yellow server address = $cyan${ip}$none" 
	echo 
	echo -e "$yellow server port = $cyan$ssport$none" 
	echo 
	echo -e "$yellow password = $cyan$sspass$none" 
	Echo 
	echo -e "$yellow encryption protocol = $cyan${ssciphers}$none" 
	echo 
	echo -e "$yellow SS link = ${cyan}$ss$none" 
	echo 
	echo -e " Remarks: $red Shadowsocks Win 4.0 .6 $none client may not recognize the SS link"
	Echo 
	echo -e "Hint: Enter $cyan v2ray ssqr $none to generate a Shadowsocks QR code link"	
	echo 
fi
