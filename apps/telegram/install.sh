#!/bin/bash
#   |                                      |
# --+--------------------------------------+--
#   |    Code by : yasserbdj96             |
#   |    Email : yasser.bdj96@gmail.com    |
# --+--------------------------------------+--
#   |                                      |

#START{
# app name:
appname="telegram"
APPNAME="Telegram"

zipfile="tsetup.4.0.2.tar.xz";
url="https://updates.tdesktop.com/tlinux/tsetup.4.0.2.tar.xz";

# download:
download () {
    if [ ! -f "./$APPNAME" ] ; then
        if [ ! -f "./$zipfile" ] ; then
	        wget "$url";
	        tar -xf ./$zipfile "$APPNAME/$APPNAME" -C ./ && cp "$APPNAME/$APPNAME" "./$APPNAME-x" && rm -r "$APPNAME" && mv "./$APPNAME-x" "./$APPNAME"
	    else
	        tar -xf ./$zipfile "$APPNAME/$APPNAME" -C ./ && cp "$APPNAME/$APPNAME" "./$APPNAME-x" && rm -r "$APPNAME" && mv "./$APPNAME-x" "./$APPNAME"
	    fi
    fi
}

# install:
if [ "$1" == "-i" ] ; then
    download;
    chmod +x "$APPNAME";
    sudo mkdir "/usr/share/$appname";
    #sudo cp -r "../$appname/." "/usr/share/$appname/$appname";
    sudo cp "$APPNAME" "/usr/share/$appname/$APPNAME";
    sudo cp "$appname.png" "/usr/share/$appname/$appname.png";
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
    echo "Usage: telegram";
fi
#}END.
