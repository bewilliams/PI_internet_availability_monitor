# PI_internet_availability_monitor
An internet availability monitoring tool designed for the Raspberry Pi. Uses ping information to determine internet availability.

Multiple sites are pinged. Ping times are logged and internet connectivity is determined. This information is then read by Logstash and piped into elasticsearch. Kibana is used to help analyze this information.

The target for this is a Raspberry Pi running Raspbian.

##Installation
1. Clone the repo to your Pi
2. Run `sudo ./install_as_root.sh`
3. Run `./install_ruby.sh`
4. Run `./install_as_user.sh`
5. Edit the `./config/ping_servers.conf` to add your own hosts

##Running
Run `./startup.sh`

##Kibana
`http://[address_of_your_pi]/`

##Raw Logs
Raw logs are located in the users home directory.
