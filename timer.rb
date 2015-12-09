require "gosu"
require_relative 'z_order'
require_relative 'player'
class Timer
	attr_reader :count_time
	def initialize player
		@count_time = 0 
		@player = player
	end

	def print_out
		if @count_time > 1 && !@player.death?
			@time_left += 0.01
			"Time left: #{@game_over.truncate}"
		else
			"game over"
		end
	end

	def game_over?
		@death = true
	end
end