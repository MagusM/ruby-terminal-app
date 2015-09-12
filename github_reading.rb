#!/usr/bin/env ruby
require "readline"
require_relative('functions')

$choise_array = {1 => "github"}

def github
	puts "\n***GitHub User Info Viewer***"
	puts "___________________________________"
	puts "Fetching A User's Info From GitHub\n"

	connect_to_github	
end

def user_choice

	puts "here are the list of option to choose from"
	puts "->"
	$choise_array.each do |key, value| puts "for #{value} press #{key}"
	end
	puts "or ... enter q to exit"
	input = Readline.readline("Please enter command:", true)
	return input
end

case user_choice
when "q"
	exit
when "1"
	github	
end



