#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.10.10.1/g' package/base-files/files/bin/config_generate
sed -i 's/"192.168.$((addr_offset++)).1/"10.10.$((addr_offset++)).1/g' package/base-files/files/bin/config_generate 
sed -i 's/hostname='OpenWrt'/hostname='HomeRouter'/g' package/base-files/files/bin/config_generate

#主题
sed -i 's/+luci-theme-bootstrap/+luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#biiki
sed -i 's/R21.1.18/R21.1.18 Complied by biki/g' package/lean/default-settings/files/zzz-default-settings

#软件
cd package/lean/
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/jerrykuku/lua-maxminddb.git  
git clone https://github.com/jerrykuku/luci-app-vssr.git  
