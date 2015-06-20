require './ping_analyzer'
require 'open3'
require 'json'
require 'time'

targets = ARGV
if targets.empty?
  puts 'Nothing to ping! Try adding addresses as arguments'
  exit 1
end
while true
  threads = []
  results = []
  start_time = Time.now

  #run each target on a thread so that they all start about the same time
  targets.each do |target|
    threads << (Thread.new {
      #record and analyze pings
      stdin, stdout, stderr = Open3.popen3("ping -c 1 #{target}")
      ping = stdout.readlines
      error = stderr.readlines
      results << analyze_ping(target, ping, error)
    })
  end
  threads.each {|t| t.join}

  #print and record
  puts "#{start_time.iso8601(3)} #{results.to_json}"
  open('ping.log','a'){|f| f.puts "#{start_time.iso8601(3)} #{results.to_json}"}

  #wait 10 seconds
  sleep_time = 10 - (Time.now - start_time) # wait at minimum 10 seconds
  sleep(sleep_time) if sleep_time > 0
end
