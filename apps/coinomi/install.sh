#!/bin/bash
#   |                                      |
# --+--------------------------------------+--
#   |    Code by : yasserbdj96             |
#   |    Email : yasser.bdj96@gmail.com    |
# --+--------------------------------------+--
#   |                                      |

#START{
# app name:
appname="coinomi"
APPNAME="Coinomi"

zipfile="coinomi-wallet-1.3.0-linux64.tar.gz";
url="https://storage.coinomi.com/binaries/desktop/coinomi-wallet-1.3.0-linux64.tar.gz";

# download:
download () {
    if [ ! -f "./$appname" ] ; then
        if [ ! -f "./$zipfile" ] ; then
	    wget "$url";
	    tar -xf ./$zipfile -C ./
	else
	    tar -xf ./$zipfile -C ./
	fi
    fi
}

# install:
if [ "$1" == "-i" ] ; then
    download;
    chmod +x "$APPNAME/$APPNAME";
    sudo cp "$appname.png" "$APPNAME/$appname.png";
    sudo cp -r "$APPNAME" "/usr/share/$APPNAME";
    sudo cp "$appname.desktop" "/usr/share/applications/$appname.desktop";
    sudo cp "$appname.sh" "/usr/local/bin/$appname";

# uninstall:
elif [ "$1" == "-u" ] ; then
    sudo rm -r "/usr/share/$APPNAME";
    sudo rm "/usr/share/applications/$appname.desktop";
    sudo rm "/usr/local/bin/$appname";

# usage:
else
    echo "Usage: coinomi";
fi
#}END.
