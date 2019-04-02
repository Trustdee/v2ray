_get_latest_version() { 
	v2ray_latest_ver="$(curl -H 'Cache-Control: no-cache' -s https://api.github.com/repos/v2ray/v2ray-core/releases/latest | grep 'tag_name' | Cut -d\" -f4)" 

	if [[ ! $v2ray_latest_ver ]]; then 
		echo 
		echo -e " $redGet V2Ray latest version failed!!! $none" 
		echo 
		echo -e " Try the following command: $green Echo 'nameserver 8.8.8.8' >/etc/resolv.conf $none" 
		echo 
		echo " Then re-run the script...." 
		echo 
		exit 1 
	fi 
} 

_download_v2ray_file() { 
	_get_latest_version 
	[[ -d /tmp/v2ray ]] && rm -rf /tmp/v2ray 
	mkdir -p /tmp/v2ray 
	v2ray_tmp_file="/tmp/v2ray/v2ray.zip"
	V2ray_download_link="https://github.com/v2ray/v2ray-core/releases/download/$v2ray_latest_ver/v2ray-linux-${v2ray_bit}.zip" 

	if ! wget --no-check-certificate -O "$v2ray_tmp_file " $v2ray_download_link; then 
		echo -e " 
        $red Downloading V2Ray failed.. It may be that your VPS network is too hot... please try again...$none 
        " && exit 1 
	fi 

	unzip $v2ray_tmp_file -d "/ Tmp/v2ray/" 
	mkdir -p /usr/bin/v2ray 
	cp -f "/tmp/v2ray/v2ray" "/usr/bin/v2ray/v2ray" 
	chmod +x "/usr/bin/v2ray/v2ray" 
	cp - f "/tmp/v2ray/v2ctl" "/usr/bin/v2ray/v2ctl" 
	chmod +x "/usr/bin/v2ray/v2ctl" 
} 

_install_v2ray_service() { 
	if [[ $systemd ]];then
		cp -f "/tmp/v2ray/systemd/v2ray.service" "/lib/systemd/system/"
		Sed -i "s/on-failure/always/" /lib/systemd/system/v2ray.service 
		systemctl enable v2ray 
	else 
		apt-get install -y daemon 
		cp "/tmp/v2ray/systemv/v2ray" "/etc/init .d/v2ray" 
		chmod +x "/etc/init.d/v2ray" 
		update-rc.d -f v2ray defaults 
	fi 
} 

_update_v2ray_version() { 
	_get_latest_version 
	if [[ $v2ray_ver != $v2ray_latest_ver ]]; then 
		echo 
		echo - e " $green 咦...Found the new version yeah... is desperately updating....$none" 
		echo 
		_download_v2ray_file 
		do_service restart v2ray 
		echo 
		echo -e " $green update succeeded...current V2Ray version : ${cyan}$v2ray_latest_ver$none" 
		echo
		Echo -e " $yellow Tips: In order to avoid the inexplicable problem... The V2Ray client version is best kept in line with the server version $none" 
		echo 
	else 
		echo 
		echo -e " $green has found a new version... .$none" 
		echo 
	fi 
} 

_mkdir_dir() { 
	mkdir -p /var/log/v2ray 
	mkdir -p /etc/v2ray 
}
