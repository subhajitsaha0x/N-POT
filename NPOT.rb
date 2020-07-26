#!/usr/bin/env ruby


$pb_log_enabled = false
$pb_log_file = File.dirname(__FILE__) + "/other/log/log1" + ENV['USER'] + ".log"


$protected_mode = true


$text_color = true

###########################

##### Loading time
dir = File.dirname(__FILE__)
require dir + "/lib/pb_proced_lib.rb" # Common procedures and functions.

version = "1.8"
Signal.trap("INT") do
	puts ""
	puts "[*] EXITING ..."
	puts ""
	pb_write_log("exiting", "Core")
	exit
end
#####

pb_write_log("N-POT loaded", "Core")

srand(Time.now.to_i)
banner = rand(4)

puts ""
title " WELCOME TO N-POT"


case banner
	when 0
		puts " press 1"
end

sleep(0.25)
option1 = ""

while option1 != "2"
	module_exec = true
	puts ""
	puts "1- Honeypot with advance config"
	puts "2- Exit"
	puts ""
	print "   -> "
	option1 = gets_pb.chomp
	puts ""

	case option1
		when "1"
		
			puts "1- Type '1' to start Netdata service too"
			
			puts "0- Back"
			puts ""
			print "   -> "
			option2 = gets_pb.chomp
			case option2
				when "0"
					module_exec = false
				
				when "1"
						puts "Netdata started - http://localhost:5555"
					require "#{dir}/tools/network/honeypot.rb"
					Network_pb::Honeypot_pb.new()
				
				else
					module_exec = false
					puts ""
					puts "Invalid option."
					puts ""
			end
		
			

		when "2"
			module_exec = false
			Process.kill("SIGINT", Process.pid()) # Just exit.
		else
			module_exec = false
			puts ""
			puts "Invalid option."
			puts ""
	end
	if module_exec == true
		puts ""
		puts "[*] Module execution finished."
		puts ""
	end
end

