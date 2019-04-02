_get_client_file() {
    local _link="$(cat $v2ray_client_config | tr -d [:space:] | base64 -w0)"
    local link="https://233boy.github.io/tools/json.html#${_link}"
    echo
    Echo "---------- V2Ray client configuration file link -------------"
    echo
    echo -e ${cyan}$link${none}
    echo
    Echo "V2Ray client tutorial: https://v2ray6.com/post/4/"
    echo
    echo
}
