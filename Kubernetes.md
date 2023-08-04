## This file is all about kubernetes a container archestration tool :)

Before jumping directly into what is kubernetes i would like to discuss somethings in the first place

Docker is composed of som many tools which includes docker runtime and a docker daemon to manage it , volumes , CLI , api server 

here the docker runtime is runc and the daemon running it is containerd so contianerd is a seperate CNCF project in itself

kubernetes initially supported only docker but then it started a container runtime interface and open continaer initiative to add support for other contianer engines

now docker containers which are using containerd are supported but the bare docker si not supported 

## some CLI's

containerd has two cli's one for debugging and another for general purposes nerdctl
kubernetes has it own CLI for container runtime interface which is crioctl
docker has its own CLI called docker cli
