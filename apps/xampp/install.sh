#!/bin/bash
#   |                                      |
# --+--------------------------------------+--
#   |    Code by : yasserbdj96             |
#   |    Email : yasser.bdj96@gmail.com    |
# --+--------------------------------------+--
#   |                                      |

#START{
# app name:
appname="xampp"
APPNAME="Xampp"

zipfile="xampp-linux-x64-8.1.6-0-installer.run";
url="https://downloadsapachefriends.global.ssl.fastly.net/8.1.6/xampp-linux-x64-8.1.6-0-installer.run";

# download:
download () {
    if [ ! -f "./$zipfile" ] ; then
        wget "$url";
        chmod +x $zipfile;
        sudo ./$zipfile;
    else
        chmod +x $zipfile;
        sudo ./$zipfile;
    fi
}

# install:
if [ "$1" == "-i" ] ; then
    download;
    #chmod +x "$APPNAME/$APPNAME";
    sudo cp "$appname.png" "/opt/lampp/xampp.png";
    #sudo cp -r "$APPNAME" "/usr/share/$APPNAME";
    sudo cp "$appname.desktop" "/usr/share/applications/$appname.desktop";
    sudo cp "$appname.sh" "/usr/local/bin/$appname";

# uninstall:
elif [ "$1" == "-u" ] ; then
    #sudo rm -r "/usr/share/$APPNAME";
    sudo /opt/lampp/uninstall;
    sudo rm "/usr/share/applications/$appname.desktop";
    sudo rm "/usr/local/bin/$appname";

# usage:
else
    echo "Usage: xampp";
fi
#}END.
