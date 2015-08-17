require "readline"
require "json"
require 'net/http'

# while buf = Readline.readline("Your GitHub name > ", true)
# 	# p buf
# 	p Readline::HISTORY.to_a
# 	print("-> ", buf, "\n")
# end

URL = "https://api.github.com/users/";

def query_for_user_name
	name = ""
	if name = Readline.readline("Your GitHub name > ", true)	
		if check_if_input_valid?(name) 
			#send for github
			print("-> ", name + " confirmed", "\n")
		else 
			puts "Name not valid"
		end
	end
	name
end

def connect_to_github
	name = query_for_user_name
	if !name.empty?
		source = URL + name
	    resp = Net::HTTP.get_response(URI.parse(source))
	    data = resp.body
	    result = JSON.parse(data)
	    output_date result
	else
		puts "Unable to connect without a valid name"
	end
end

def output_date(data={})
	puts
	puts "---------------------------------"
	puts "|     key      |      value     |"
	puts "---------------------------------"
	data.each do |k, v|
		print "| #{k} |".ljust(10).rjust(10)
		puts "#{v} |".ljust(10).rjust(10)
	end
end

def check_if_input_valid? input
	if input.empty?
		return false
	end
	special = "?<>',?[]}{=-)(*&^%$#`~{}".split(//)
	input.split(//).each {|s| 
		if special.include? s
			return false
		end
	}
	return true
end

private :check_if_input_valid?

