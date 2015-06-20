# internet_availability_monitor
An internet availability monitoring tool. Uses ping information to determine internet availability.

Ping statistics are logged, then read by Logstash. The information is stored in elasticsearch and then exposed with Kibana.

It is my hope that I can wrap all this up into a docker image, making deployment easy. 
