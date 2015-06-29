# internet_availability_monitor
An internet availability monitoring tool. Uses ping information to determine internet availability.

Ping statistics are logged, then read by Logstash. The information is stored in elasticsearch and then exposed with Kibana.

The target for this is a Raspberry Pi running Raspbian. I would like to eventually wrap this up into a docker image.
