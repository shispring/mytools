#!/usr/bin/expect -f

# 设置超时时间，可以设置 -1 永不超时
set timeout -1
# 基本的服务器信息
set password YsyHljT
set port 22
set user work
set ip 10.3.136.96

# 执行的命令
spawn ssh -p $port $user@$ip
# 交互式输出
expect "$user$ip's password:"
# 模拟输入密码，并且回车登录，这里有一定延迟，也可以手动自己回车
send "$password\r"
# 表示操作完成，用户继续可以交互操作
interact
expect eof
