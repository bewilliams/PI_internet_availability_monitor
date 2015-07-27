#PI_internet_availability_monitor
An internet availability monitoring tool designed for the Raspberry Pi. Uses ping information to determine internet availability.

Multiple sites are pinged. Ping times are logged and internet connectivity is determined. If all sites do not respond, then it is determined that the internet is out. This information is then read by Logstash and piped into elasticsearch. Kibana is used to help analyze this information.

The target for this is a Raspberry Pi running Raspbian.
##Screenshot and Usage
![Screenshot]
(https://github.com/bewilliams/PI_internet_availability_monitor/raw/master/Kibana_Screenshot.png)
I arranged Kibana to provide several useful metrics. The above screenshot is actually a pretty bad day. For Comcast, I typically get about 5% internet outage throughout the day.
###Hit Count
At the top is the count of hits where internet is determined to be down.  Since, every hit is 10 seconds, you can see that my internet outage for the last hour was 430 seconds (or about 7 minutes).
###Outage by Percent
The pie chart at the top tells how much internet has been lost over the past hour in a percentage format.
###Internet Outage
This is the real meat and potatos. This presents internet outage over time.  I chose to use a bar graph because it helped make outages more pronounced when looking at large time windows.
###Average Ping
The average ping time for all the servers.
###Ping Times
This is a graph of the ping times over time for each ping target.
##Installation
1. Clone the repo to your Pi
2. Run `sudo ./install_as_root.sh`
3. Run `./install_ruby.sh`
4. Run `./install_as_user.sh`
5. Edit the `./config/ping_servers.conf` to add your own hosts

##Running
Run `./startup.sh`
TODO: Run as Daemon

##Kibana
`http://[address_of_your_pi]/`

##Raw Logs
The raw logs are located in the users home directory.
