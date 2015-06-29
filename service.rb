require './ping_analyzer'
require './read_config'
require 'open3'
require 'json'
require 'time'

config = read_config
if config.empty?
  puts 'Nothing to ping! Try adding addresses as arguments'
  exit 1
end
while true
  threads = []
  results = []
  start_time = Time.now

  #run each target on a thread so that they all start about the same time
  config.each do |target|
    threads << (Thread.new {
      #record and analyze pings
      stdin, stdout, stderr = Open3.popen3("ping -c 1 #{target[:address]}")
      ping = stdout.readlines
      error = stderr.readlines
      results << analyze_ping(target, ping, error)
    })
  end
  threads.each {|t| t.join}

  #determine if internet is up
  isup = !(results.select {|x| x[:connected]}).empty?

  #print and record
  puts "#{start_time.iso8601(3)} #{results.to_json}"
  puts "#{start_time.iso8601(3)} #{isup ? 'connected' : 'disconnected'}"
  open('ping.log','a'){|f| f.puts "#{start_time.iso8601(3)} #{results.to_json}"}
  open('up.log','a'){|f| f.puts "#{start_time.iso8601(3)} #{isup ? 'connected' : 'disconnected'}"}

  #wait 10 seconds
  sleep_time = 10 - (Time.now - start_time) # wait at minimum 10 seconds
  sleep(sleep_time) if sleep_time > 0
end
