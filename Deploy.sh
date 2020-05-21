#!/bin/sh


cd ~
sudo rm -r mabushaireh.info
git clone https://github.com/mabushaireh/mabushaireh.info.git
cd /home/sshuser/mabushaireh.info/src/Blogifier


sudo service supervisor stop

pkill -f dotnet
sudo mv /var/aspnetcore/mabushaireh.info/htdocs/appsettings.json /var/aspnetcore/mabushaireh.info/htdocs/appsettings.json_

sudo dotnet publish --configuration Release --output /var/aspnetcore/mabushaireh.info/htdocs

sudo mv /var/aspnetcore/mabushaireh.info/htdocs/appsettings.json_ /var/aspnetcore/mabushaireh.info/htdocs/appsettings.json

sudo service supervisor start

tail -f /var/log/mabushaireh_info.out.log