rm -fr staging
rm -fr staging_mod
mkdir staging
mkdir staging_mod

make install INSTALL_PATH=$PWD/staging
make dtbs_install INSTALL_PATH=$PWD/staging     
make modules_install INSTALL_MOD_PATH=$PWD/staging_mod

TARGET_IP=$1
ssh root@$TARGET_IP mount /dev/mmcblk1p1 /boot/efi
scp -r ./staging/* root@$TARGET_IP:/boot/efi/custom
scp -r ./staging_mod/lib/ root@$TARGET_IP:/ 

