# GA PFR: Programming Fundamentals for Ruby on Rails
# Intro to Ruby - Mid Project
#

# add current directory to Ruby LOAD_PATH
$LOAD_PATH.unshift(File.dirname(__FILE__))

# require game class from /lib relative to current directory per modified LOAD_PATH
require "lib/round"

# pass first command line argument - User's name - to new Game object
begin
	# Ask the player for a team name
	puts "Please choose your team name"
	team_name = $stdin.gets.chomp
	puts "Welcome to your three round quiz"

	(1..3).each do |round_number|
		# bootstrap round launch by creating new round object
		round = Round.new(round_number,team_name)

		if round_number == 3
			puts "\nGame over.  Your final score is: x/60"
			break
		else 
			puts "\n(C)ontinue to the next round or (W)imp out?"
			choice = $stdin.gets.chomp

			# unless user says wimp, next loop to launch next round
			next unless choice.upcase == "W"
			puts "Bye.. loser!"
			break
		end
	end
end