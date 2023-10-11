
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb  && \
dpkg -i packages-microsoft-prod.deb                                                                                 && \
rm packages-microsoft-prod.deb

wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
echo "deb https://apt.repos.intel.com/openvino/2023 ubuntu20 main" | sudo tee /etc/apt/sources.list.d/intel-openvino-2023.list

echo "Updating apt"

sc_apt_update_succeeded=0
apt-get update && sc_apt_update_succeeded=1

if [ $sc_apt_update_succeeded -lt 1 ]
then
    echo "Failed to update apt, exiting"
    exit -1
fi

echo "Installing basic tools"
apt-get install -y dotnet-sdk-6.0 docker ssh zip net-tools build-essential cmake git gcc ccache vim zsh python3-pip gcc-8 \
    bison libdbus-1-dev libxi-dev libxtst-dev autoconf-archive libx11-dev libxft-dev libxext-dev x11-xserver-utils libgtk3.0-cil-dev \
    libgles2-mesa-dev gperf libtool libxrandr-dev libxi-dev libxcursor-dev libxdamage-dev libxinerama-dev \
    libprotobuf-dev protobuf-compiler openvino-2023.1.0 gdb-dbg libxkbcommon-x11-dev libx11-xcb-dev rsync

apt-get upgrade -y

echo "Installing : VSCode"
snap install code --classic

echo "Installing : Pycharm"
snap install pycharm-community --classic

echo "Installing AUTORUN"
bash ./INSTALL_AUTORUN/install.sh

echo "Installing Vcpkg"
bash ./INSTALL_VCPKG/install.sh

echo "Installing ROS"
wget http://fishros.com/install -O fishros && . fishros
