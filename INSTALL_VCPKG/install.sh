git clone https://github.com/microsoft/vcpkg ~/.vcpkg
bash ~/.vcpkg/bootstrap-vcpkg.sh
Vcpkg=~/.vcpkg/vcpkg
$Vcpkg integrate install
$Vcpkg install opencv[contrib]:x64-linux boost:x64-linux sophus:x64-linux Eigen3:x64-linux jsoncpp:x64-linux lua:x64-linux glog:x64-linux \
    --recurse