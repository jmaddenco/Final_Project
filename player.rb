require "gosu"
require_relative 'z_order'

class	Player
	attr_accessor :y, :vel_y, :score, :health

	ACCELERATION = 0.5
	COLLISION_DISTANCE = 35 

	def initialize
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@health = 100
		@score = 0
		@image = Gosu::Image.new("media/player2.bmp")
	end

	def warp x, y
		@x, @y = x, y
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, ACCELERATION)
		@vel_y += Gosu::offset_y(@angle, ACCELERATION)
	end

	def move
		@x += @vel_x
		@y += @vel_y

		@x %= 640
		@y %= 480

		@vel_x *= 0.95
		@vel_y *= 0.95
	end

	def score
		@score
	end

	def health
		@health
	end

	def death?
		@health < 1
	end

	def standing? platforms
		platforms.any? { |platform| @feet_box.colliding?(platform.hit_box, "stand") && @vel_y < 0 }
	end

	def draw
		@image.draw(@x, @y, ZOrder::PLAYER)
	end

	private
		def colliding?(star)
			Gosu::distance(@x, @y, star.x, star.y) < COLLISION_DISTANCE
		end

end
