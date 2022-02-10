#This service is responsible for showing the list of items that are to be sold by the RobotShop e-commerce portal.



source components/common.sh

echo "NodeJS repo"
curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - &>>$LOG_FILE
STAT $?

echo " Install NodeJS"
yum install nodejs gcc-c++ -y &>>$LOG_FILE
STAT $?

echo "Create App User"
useradd roboshop &>>$LOG_FILE
STAT $?

echo "Download Catalog code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG_FILE
STAT $?

echo "Extract Catalogue code"
cd /tmp/
unzip -o catalogue.zip &>>$LOG_FILE
STAT $?

echo "clear old catalogue"
rm -rf /home/roboshop/catalogue
STAT $?

echo "moving catalogue content"
cp -r catalogue-main /home/roboshop/catalogue &>>$LOG_FILE
STAT $?

echo "Install NodeJS Dependencies"
cd /home/roboshop/catalogue
npm install &>>$LOG_FILE
STAT $?

chown roboshop:roboshop /home/roboshop/ -R &>>$LOG_FILE
STAT $?

echo "update systemd file"
sed -i -e 's/MONGO_DNSNAME/mongodb.roboshop.internal/' /home/roboshop/catalogue/systemd.service &>>$LOG_FILE
STAT $?

echo "SetUp Catalogue systemd file"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>$LOG_FILE
STAT $?

echo "Start Catalouge"
systemctl daemon-reload &>>$LOG_FILE
systemctl enable catalogue &>>$LOG_FILE
systemctl start catalogue &>>$LOG_FILE
STAT $?