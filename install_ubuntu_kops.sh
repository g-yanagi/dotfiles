mkdir ~/kops
cd ~/kops
export GOPATH=`pwd`

go get -d k8s.io/kops
cd ${GOPATH}/src/k8s.io/kops/
git checkout release
make

