require "gosu"
require_relative 'z_order'

class	Player
	attr_accessor :y, :vel_y, :score, :health

	ACCELERATION = 5
	JUMP_POWER = 0.1

	def initialize
		@x = @y = @vel_y = 0.0
		@health = 100
		@score = 0
		@image = Gosu::Image.new("media/player2.bmp")
	end

	def warp x, y
		@x, @y = x, y
	end

	def accelerate
		@vel_y += ACCELERATION
	end

	def move
		@y -= @vel_y

		@y %= 354

		@vel_y *= 0.95
	end

	def jump
		@vel_y += JUMP_POWER
	end

	def death?
		@health < 1
	end

	def draw
		@image.draw(@x, @y, ZOrder::PLAYER)
	end

end
