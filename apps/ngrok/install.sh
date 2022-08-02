#!/bin/bash
#   |                                      |
# --+--------------------------------------+--
#   |    Code by : yasserbdj96             |
#   |    Email : yasser.bdj96@gmail.com    |
# --+--------------------------------------+--
#   |                                      |

#START{
# app name:
appname="ngrok"
APPNAME="ngrok"

zipfile="ngrok-v3-stable-linux-amd64.tgz";
url="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz";

# download:
download () {
    if [ ! -f "./$appname" ] ; then
        if [ ! -f "./$zipfile" ] ; then
	    wget "$url";
	    tar xvzf ./$zipfile -C ./
	else
	    tar xvzf ./$zipfile -C ./
	fi
    fi
}

# install:
if [ "$1" == "-i" ] ; then
    download;
    chmod +x "$appname";
    sudo mkdir "/usr/share/$appname";
    #sudo cp -r "../$appname/." "/usr/share/$appname/$appname";
    sudo cp "$APPNAME" "/usr/share/$appname/$appname";
    sudo cp "$appname.svg" "/usr/share/$appname/$appname.svg";
    sudo cp "$appname.desktop" "/usr/share/applications/$appname.desktop";
    sudo cp "$appname.sh" "/usr/local/bin/$appname";
    sudo chmod +x "/usr/local/bin/$appname";

# uninstall:
elif [ "$1" == "-u" ] ; then
    sudo rm -r "/usr/share/$appname";
    #sudo rm "/usr/share/$appname/$appname.png";
    sudo rm "/usr/share/applications/$appname.desktop";
    sudo rm "/usr/local/bin/$appname";

# usage:
else
    echo "Usage: ngrok";
fi
#}END.
