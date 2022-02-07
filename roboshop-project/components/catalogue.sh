#This service is responsible for showing the list of items that are to be sold by the RobotShop e-commerce portal.



source components/common.sh

echo "NodeJS repo"
curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - &>>$LOG_FILE

echo " Install NodeJS"
yum install nodejs gcc-c++ -y &>>$LOG_FILE

echo "Create App User"
useradd roboshop &>>$LOG_FILE

echo "Download Catalog code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG_FILE

echo "Extract Catalogue code"
cd /tmp/
unzip -o catalogue.zip &>>$LOG_FILE

echo "moving catalogue content"
cp -r catalogue-main /home/roboshop/catalogue &>>$LOG_FILE
#
echo "Install NodeJS Dependencies"
cd /home/roboshop/catalogue
npm install &>>$LOG_FILE
