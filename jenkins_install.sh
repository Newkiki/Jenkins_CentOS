  
#!/bin/bash
#nmtui
#init 6
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo yum repolist
sudo yum install -y jenkins

sudo systemctl start jenkins && systemctl enable jenkins
sudo systemctl status jenkins
sudo systemctl status firewall-cmd
sudo systemctl status firewalld

sudo yum install -y telnet  net-tools git
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo semanage port -a -t http_port_t -p tcp 8080
sudo firewall-cmd --reload

cat /var/lib/jenkins/secrets/initialAdminPassword