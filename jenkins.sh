#!/bin/bash
echo "Updating packages..."
sudo apt update -y
echo "Installing Java 21..."
sudo apt install fontconfig openjdk-21-jre -y
echo "Checking Java version..."
java -version
echo "Adding Jenkins key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
echo "Updating repositories..."
sudo apt update -y
echo "Installing Jenkins..."
sudo apt install jenkins -y
echo "Starting Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "Checking Jenkins status..."
sudo systemctl status jenkins --no-pager
echo "Jenkins Initial Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "Open in browser:"
echo "http://YOUR_PUBLIC_IP:8080"

