#The frontend is the service in RobotShop to serve the web content over Nginx.
#
#To Install Nginx.
#
#```
## yum install nginx -y
## systemctl enable nginx
## systemctl start nginx
#
#```
#
#Let's download the HTDOCS content and deploy under the Nginx path.
#
#```
## curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#
#```
#
#Deploy in Nginx Default Location.
#
#```
## cd /usr/share/nginx/html
## rm -rf *
## unzip /tmp/frontend.zip
## mv frontend-main/* .
## mv static/* .
## rm -rf frontend-master README.md
## mv localhost.conf /etc/nginx/default.d/roboshop.conf
#
#```
#
#Finally restart the service once to effect the changes.
#
#```
## systemctl restart nginx
#
#```

# we are removing the log file of every action
LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE


echo "InstallingNGINX"
yum install nginx -y >>$LOG_FILE


# >> is used to append the files or override the files

echo "Downloading fromtend content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE

echo "Clean old Content"
rm -rf /usr/share/nginx/html/* &>>$LOG_FILE

echo "Extract Frontend Contenct"
cd /tmp
unzip -o /tmp/frontend.zip &>>$LOG_FILE

#after unzipping the file to tpm/frontend folder, we need to move it our folder
echo "Copy Extracted contenct to Nginx path"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE

echo "Copy Nginx RoboShop Config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE

echo "Start Ngixn Service"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE

