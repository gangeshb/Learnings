REPO_CONTENT="[wazuh]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=0
name=EL-\$releasever - Wazuh
baseurl=https://packages.wazuh.com/4.x/yum/
protect=1"
sudo yum update -y
sudo yum install -y ruby
sudo wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
sudo service codedeploy-codeDeployAgentStatus start
sudo service codedeploy-agent status >> codeDeployAgentStatus.txt
sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_arm64/amazon-ssm-agent.rpm
sudo yum install epel-release -y
sudo yum install libcgroup-tools -y
sudo amazon-linux-extras install epel -y
sudo yum install cpulimit -y
sudo yum install clamav -y
sudo yum install clamscan -y
sudo echo "$REPO_CONTENT" | sudo tee /etc/yum.repos.d/wazuh.repo > /dev/null
sudo timedatectl set-timezone Asia/Kolkata
