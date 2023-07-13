## This file contains about docker


### How docker works under the hood

docker daemon - background process
docker Rest API server
docker CLI

we can use our laptop CLI to communicate with remote docker Rest API's through specifing the -h host IP:PORT

cgroups  - by using cgroups docker manages how much of underlying docker host resources should be allocated to the container as in the worst case it might end up using all the underlying resources
namespaces - this is a technique where the process can associate with multiple process out of all one is PID namespaces where
the process can assocaite with multiple processID 
docker uses namespaces for isolation of containers under the hood the docker process are also the actual process running in the docker host 
demonstration

<img width="672" alt="Screenshot 2023-07-13 at 6 27 08 AM" src="https://github.com/VenkataBhaskarr/Devops/assets/111889155/225081b4-f59c-44f8-8275-349904ed168c">


docker storage drivers

when an image is created it is formed with several layers but docker is intelligent in maintinaing cache so any formation of subsequent images conatining the same layer are cached there by decreasing the size of the images effectively 

The image is READONLY and the contianers formed from it are READ-WRITE but the data will be lost when the continer stops in order to persist the data docker provided concept of volumes where we can mount the directiros in docker host to the containers (escpecially useful in storing the db data)

docker -v myvolume:/var/lib/mysql run mysql

this command will create a volume insisde /var/lib/docker/volumes/myvolume in the host and stores the data in it.

<img width="1418" alt="Screenshot 2023-07-13 at 6 57 23 AM" src="https://github.com/VenkataBhaskarr/Devops/assets/111889155/8085a709-e244-4cb8-be62-3fae5dfbb3eb">

ok question who manages all this commands and stuff it is storage drivers of the host

### what are sockets ?
sockets are also kind of files where two processes / tewo computers can use and communicate efficiently 
lets say for examples i have two process p1 and p2 in a system they create a unix socket for communication is p1 create the socket 
p2 will register to it and fetches the data from the socket whever it is required

lets say another example two computers want to communicate then comp1 will create a socket at its ipaddress:port if another computer wants to communicate with it it will register to the ip:port so then can communicate effectively.


















