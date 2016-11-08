#!/bin/sh
#This script will configure elasticsearch to listen remote hosts on specific port
#Configuration is to be done in a file /etc/elasticsearch/elasticsearch.yml
#Add host entry and port entry as given 
#host: 0.0.0.0
#port: 9200


echo "host:0.0.0.0" >> /etc/elasticsearch/elasticsearch.yml
echo "port:9200" >> /etc/elasticsearch/elasticsearch.yml

#Restart elasticsearch services
echo `sudo service elasticsearch restart`

#Restart nginx configuration to /etc/nginx/sites-enabled/default
sudo cp elasticsearch-nginx.conf /etc/nginx/sites-enabled/default



