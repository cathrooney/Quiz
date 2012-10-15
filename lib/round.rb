require 'lib/question'
require 'lib/score'
require 'lib/bonus'

class Round

	include Bonus

	attr_accessor :round_number
	attr_accessor :round_name
	attr_accessor :team_name
	attr_accessor :running_total
	attr_accessor :score

	def initialize(round_number,team_name)
		@round_number = round_number
		@round_name = get_round_name(round_number)
		@running_total = []
		@score = 0
		puts "\nYou are entering the #{round_name} round, Team #{team_name}!"
		puts "\nBon Courage!"

		ask_questions(round_number)
	end

	def ask_questions(round_number)
		questions = get_round_questions(round_number)
		z = questions.length
		qnum = 0

		questions.each do |q|
			qnum = qnum + 1
			puts "Question number #{qnum}: #{q.question}"
			puts "Please enter your answer"
			user_answer = $stdin.gets.chomp
			answer = q.answer

			if user_answer.downcase == answer.downcase
				puts "#{answer} is correct! You score 2 points"
				@score = score.to_i + 2
			else
				puts "#{answer} is incorrect!  Nul points.  The correct answer was #{answer}"
				@score = score.to_i + 0
			end

			#if this is the last question then we are nearly at the end of the round and need to show the score
			#if not, we offer the next question
			if qnum < 4
				puts "(N)ext question"
				$stdin.gets.chomp
			else
				if @score == z*2 #this means all your answers were correct
					puts "\nYou answered all questions correctly - 2 bonus points awarded!"
					@score = @score.to_i + bonus.to_i
				end
				puts "\nRound over.  Your score for the #{round_name} round was #{score}/#{(z*2)+2}"
			end

		if round_number == 3 && qnum == 4
			puts "\nYou have reached the end of the quiz.  Press enter to reveal your final score..."
			$stdin.gets.chomp
		end

		end
	end


	def get_round_questions(round_number)
		if round_number == 1
			[
				Question.new("What is A?","A"),
				Question.new("What is B?","B"),
				Question.new("What is C?","C"),
				Question.new("What is D?","D")
			]
		elsif round_number == 2
			[
				Question.new("Which is the worlds largest container port?","Singapore"),
				Question.new("What is Africas second-largest country after Sudan?","Algeria"),
				Question.new("Which European capital, known as the Venice of the North, is built on 14 islands?","Stockholm"),
				Question.new("Which strait links the Mediterranean Sea and the Atlantic Ocean?","Gibraltar"),
			]
		elsif round_number == 3
			[
				Question.new("Antony Stark is the alter-ego of which super hero?","Iron Man"),
				Question.new("What is currently the most watched programme on Channel 5?","Dallas"),
				Question.new("After a leak who was it revealed would be singing the new Bond theme?","Adele"),
				Question.new("What is the name of J K Rowling's first adult fiction book","the casual Vacancy"),
			]
		elsif round_number == 4
			[
				Question.new("What is the longest line on the London Underground?","Central"),
				Question.new("What is the literal meaning of Magna Carta?","Great Charter"),
				Question.new("Which is the largest country in the world with only one time zone?","China"),
				Question.new("February is the shortest month of the year, but which is the longest?","October"),
			]
		end
	end

	def get_round_name(round_number)
		if round_number == 1
			"Current Affairs"
		elsif round_number == 2
			"Geography"
		elsif round_number == 3
			"Entertainment"
		end
	end

end
