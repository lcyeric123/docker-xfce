markdown
  
# Xvnc-Debian-Wine-Container
基础系统：Debian Bullseye
远程协议：Xvnc / VNC
桌面环境：XFCE4
架构：amd64，兼容32位程序

## 功能介绍
1. 内置Xvnc远程桌面服务，监听5901端口，支持外网直接访问
2. 完整轻量化XFCE图形桌面环境
3. 预装Wine + Wine32，可直接运行Windows程序
4. 自带Firefox浏览器、nano编辑器、网络调试工具curl/wget/net-tools
5. 自动配置DBus与X11权限，不会出现桌面黑屏问题
6. 容器启动后自动拉起VNC桌面，无需手动操作
7. root账户登录密码：root；VNC连接访问密码：123456

## 构建与运行教程
### 克隆项目仓库
 
 
git clone https://github.com/USERNAME/Xvnc-Debian-Wine-Container.git
cd Xvnc-Debian-Wine-Container
 
plaintext
  

### 构建镜像
 '''
 
docker build -t docker-xfce .
'''
 
  

### 后台启动容器
'''
 
docker run -d -p 5901:5901 --name docker-xfce
 
'''

### VNC客户端连接信息
连接地址：宿主机IP:5901
访问密码：123456
登录账户：root

## 自定义修改说明
1. 调整桌面分辨率：修改start.sh文件内的1440x900参数
2. 修改VNC访问密码：替换脚本中的"123456"字符串
3. 更换桌面环境：删除XFCE相关安装包，替换安装deepin桌面套件
4. 新增预装软件：在Dockerfile的apt安装列表末尾追加软件包名称

## 端口说明
5901：Xvnc远程桌面服务端口

## 开源协议
MIT License
可商用、自由二次修改分发，保留项目原始出处即可
