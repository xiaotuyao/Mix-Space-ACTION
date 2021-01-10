# install rimraf
sudo npm install rimraf -g

# Kami clone and fix
echo "——————————————————————Kami——————————————————————"
echo "|————————————————————————————————————————————————|"
git clone https://github.com/mx-space/kami
cd kami
# fix user files
sudo  rm -rf .env
sudo  rm -rf configs.ts
sudo  wget http://api.iucky.cn/themes/kami/.env
sudo  wget http://api.iucky.cn/themes/kami/configs.ts
cd public
sudo  rm -rf manifest.json
sudo  wget http://api.iucky.cn/themes/kami/manifest.json
cd ..
echo "fix user files success"
# build
sudo yarn
sudo yarn build
sudo tar cf kami.tar.gz *
sudo mv kami.tar.gz .. #此时kami已经移动到根文件夹
cd .. # exit to root dir

# Server clone and fix
echo "——————————————————————Server——————————————————————"
echo "|————————————————————————————————————————————————|"
git clone https://github.com/mx-space/server
cd server
# fix user files
sudo rm -rf .env
sudo wget http://api.iucky.cn/themes/.env_server
sudo mv .env_server .env
echo "fix user files success"
# build
sudo yarn
sudo yarn build
sudo tar cf server.tar.gz *
sudo mv server.tar.gz .. #移动已编译文件
cd .. # exit to root dir

# admin clone and fix
echo "——————————————————————Admin——————————————————————"
echo "|————————————————————————————————————————————————|"
git clone https://github.com/mx-space/admin
cd admin
# fix user files
sudo rm -rf .env
sudo rm -rf vue.config.js
sudo wget http://api.iucky.cn/themes/admin/.env
sudo wget http://api.iucky.cn/themes/admin/vue.config.js
echo "fix user files success"
# build
sudo yarn
sudo yarn build
cd dist
sudo tar cf admin.tar.gz *
sudo mv admin.tar.gz .. # 移动编译dist
cd .. # exit to admin dir
sudo mv admin.tar.gz .. # mv to root dir
cd .. # exit to root dir

# delete files
echo "delete files"
sudo rm -rf server
sudo rm -rf kami
sudo rm -rf admin
