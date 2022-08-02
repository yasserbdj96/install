#!/bin/bash
#   |                                      |
# --+--------------------------------------+--
#   |    Code by : yasserbdj96             |
#   |    Email : yasser.bdj96@gmail.com    |
# --+--------------------------------------+--
#   |                                      |

#START{
# app name:
appname="etcher"
APPNAME="balenaEtcher-1.7.9-x64.AppImage"

zipfile="balena-etcher-electron-1.7.9-linux-x64.zip";
url="https://github.com/balena-io/etcher/releases/download/v1.7.9/balena-etcher-electron-1.7.9-linux-x64.zip";

# download:
download () {
    if [ ! -f "./$appname" ] ; then
        if [ ! -f "./$zipfile" ] ; then
	    wget "$url";
	    unzip ./$zipfile -d ./
	else
	    unzip ./$zipfile -d ./
	fi
    fi
}

# install:
if [ "$1" == "-i" ] ; then
    download;
    chmod +x "$APPNAME";
    sudo mkdir "/usr/share/$appname";
    #sudo cp -r "../$appname/." "/usr/share/$appname/$appname";
    sudo cp "$APPNAME" "/usr/share/$appname/$appname.AppImage";
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
    echo "Usage: etcher";
fi
#}END.
