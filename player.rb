require "gosu"
require_relative 'z_order'

class	Player
	attr_reader :score, :health

	ACCELERATION = 0.5

	def initialize
		@x = @y = @vel_x = @vel_y = 0.0
		@health = 100
		@score = 0
		@image = Gosu::Image.new("media/player2.bmp")

	end

	def draw
		@image.draw(@x, @y, ZOrder::PLAYER)
	end


end
