#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
#按照mtk-sdk和最新openwrt主线的有线驱动，mt7981的ADMAv2存在不可修复的问题，immortalwrt-mt798x已参照上述源码将mt7981 ADMAv2回退至ADMAv1。
#当有线驱动使用ADMAv1时，每个PPE最多支持16384个Entry。每个NAT连接需要占用2个Entry（进站和出站方向）。
sed -i 's/nf_conntrack_max=65536/nf_conntrack_max=16384/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
sed -i 's/nf_conntrack_buckets=65536/nf_conntrack_buckets=16384/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
