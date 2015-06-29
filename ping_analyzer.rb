def analyze_ping(target, raw_ping, raw_error)

  #empty string if no internet
  if raw_ping.empty? || raw_ping[1].nil? || raw_ping[1].strip.length == 0
    time = nil
    ttl = nil
    bytes = nil
    connected = false
  else
    raw_line = raw_ping[1].strip
    time = raw_line[/(?<=time=)\d*.?\d*/].to_f
    ttl = raw_line[/(?<=ttl=)\d*/].to_i
    bytes = raw_line[/^\d*/].to_i
    connected = true
  end
  {target_name: target[:name], target_address: target[:address], time: time, ttl: ttl, bytes: bytes, connected: connected, error: raw_error.join.chomp}
end