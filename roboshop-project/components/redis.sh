#Redis is used for in-memory data storage and allows users to access the data over API.

echo Installing redis

source components/common.sh

echo "Configuring Redis rpeo"
curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>>$LOG_FILE
STAT $?

echo "Install Redis"
yum install redis -y &>>$LOG_FILE
STAT $?

echo "update redis configuration"
if [ -f /etc/redis.conf ]; then
  sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/redis.conf
elif [ -f /etc/redis/redis.conf ]; then
  sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/redis/redis.conf
fi
STAT $?

echo "Start Redis"
systemctl enable redis &>>$LOG_FILE
systemctl start redis &>>$LOG_FILE
STAT $?