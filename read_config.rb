def read_config
  raw_config = File.read('./config/ping_servers.conf')
  config = []
  raw_config.split("\n").each do |line|
    name, address = line.split(":")
    config << {name: name.strip, address: address.strip}
  end
  config
end