require 'net/ping'

@icmp = Net::Ping::ICMP.new('google.com', timeout=1)
pingfails = 0
puts 'starting to ping'
loop do
  sleep 1
	if @icmp.ping
		puts "host replied in #{@icmp.duration}"
		next
	else
		pingfails += 1
		puts "timeout"
		if pingfails > 3
      %x(networksetup -setairportpower en0 off)
      puts "airport turned off like little bitch"
      %x(networksetup -setairportpower en0 on)
      puts "yee son got that airport back on, whatchu know bout dat"
      sleep 5
      pingfails = 0
      next
		end
    next
	end
end
