def read_config
  raw_config = File.read('./config/ping_servers.conf')
  config = []
  raw_config.split("\n").each do |line|
    name, address = line.split(":").collect {|x| x.strip!}
    config << {name: name, address: address}
  end
  config
end