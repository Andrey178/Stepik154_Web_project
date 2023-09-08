!#/bin/sh
$FOLDER_PATH = `pwd`

echo "I am loading project in \"${FOLDER_PATH}\" folder"

sudo ln -s "${FOLDER_PATH}/etc/nginx.conf"  /etc/nginx/sites-enabled/test.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

#For old test server use this command pack instead of the next one
#sudo ln -s "${PROJECT_FOLDER_PATH}/etc/gunicorn.conf.py"   /etc/gunicorn.d/test
#sudo /etc/init.d/gunicorn restart

sudo "${FOLDER_PATH}/gunicorn -c ./etc/gunicorn.conf.py"

sudo /etc/init.d/mysql start
