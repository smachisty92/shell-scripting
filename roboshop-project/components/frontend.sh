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
cd /usr/share/nginx/html/
unzip /tmp/frontend.zip &>>$LOG_FILE