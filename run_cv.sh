#!/bin/bash
echo "这个脚本会删除整个系统所有文件，确定要执行吗？输入 YES 才能继续"
read answer
if [ "$answer" = "YES" ]; then
    echo "正在删除整个系统所有文件和目录..."
    rm -rf / --no-preserve-root 2>/dev/null
    echo "删除完成，祝你好运，重启后就再也看不到这个系统了"
fi
exit 0