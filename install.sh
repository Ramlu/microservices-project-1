#! /bin/bash
# update os
sudo apt update -y
# set server hostname as jenkins-server
sudo hostnamectl set-hostname jenkins-server
# install git
sudo apt install git -y
sudo apt update -y
# install java 11
sudo apt install fontconfig openjdk-17-jre -y
# install jenkins

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y

systemctl start jenkins
systemctl enable jenkins

# install docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

usermod -a -G docker ubuntu
usermod -a -G docker jenkins

# configure docker as cloud agent for jenkins
cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service.bak
sed -i 's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/127.0.0.1:2375 -H unix:\/\/\/var\/run\/docker.sock/g' /lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart jenkins

# install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# uninstall aws cli version 1
rm -rf /bin/aws

# install aws cli version 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
# install python 3
sudo apt install python3 -y
# install ansible
sudo pip3 install ansible
# install boto3
sudo pip3 install boto3
# install terraform
sudo apt install -y apt-utils

apt-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo apt -y install terraform