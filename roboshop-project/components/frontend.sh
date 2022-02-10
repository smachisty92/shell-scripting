#The frontend is the service in RobotShop to serve the web content over Nginx.

# we are removing the log file of every action
source components/common.sh


echo "InstallingNGINX"
yum install nginx -y >>$LOG_FILE
STAT $?


# >> is used to append the files or override the files

echo "Downloading fromtend content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE
STAT $?


echo "Clean old Content"
rm -rf /usr/share/nginx/html/* &>>$LOG_FILE
STAT $?

echo "Extract Frontend Contenct"
cd /tmp
unzip -o /tmp/frontend.zip &>>$LOG_FILE
STAT $?

#after unzipping the file to tpm/frontend folder, we need to move it our folder
echo "Copy Extracted contenct to Nginx path"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE
STAT $?

echo "Copy Nginx RoboShop Config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE
STAT $?

echo "update Roboshop Config"
sed -i -e "/catalogue/ s/localhost/catalogue.roboshop.internal" -e "/user/ s/localhost/user.roboshop.internal" /etc/nginx/default.d/roboshop.conf

echo "Start Ngixn Service"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE
STAT $?

