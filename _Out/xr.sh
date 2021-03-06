#!/bin/bash

export LC_ALL="C"

sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
    echo "I'm MacOS"
    export DYLD_LIBRARY_PATH=.:$DYLD_LIBRARY_PATH
elif [ $sysOS == "Linux" ];then
    echo "I'm Linux"
    export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
else
    echo "Other OS: $sysOS"
fi

cd Release

chmod -R 777  NFPluginLoader

./NFPluginLoader -d PluginX.xml Server=MasterServer ID=3

./NFPluginLoader -d PluginX.xml Server=WorldServer ID=7

./NFPluginLoader -d PluginX.xml Server=DBServer ID=8

./NFPluginLoader -d PluginX.xml Server=LoginServer ID=4

./NFPluginLoader -d PluginX.xml Server=GameServer ID=6

./NFPluginLoader -d PluginX.xml Server=ProxyServer ID=5

ps -A|grep NF
