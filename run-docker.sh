docker stop ansible
docker container rm ansible
docker build -t ansible .
docker run -u harry --name ansible -it ansible
