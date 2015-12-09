require 'gosu'
require_relative 'z_order'
require_relative 'player'
require_relative 'timer'

class GameWindow < Gosu::Window

	GRAVITY = 0.5

  def initialize
    super 1100, 354
    self.caption = "Free Runner"

    @background_image = Gosu::Image.new("media/Upper_Taconic_cropped.jpg", 
                                        :tileable => true) 
    @player = Player.new
    @player.warp(width/2.0, height/2.0)
 	 	
 	 	@timer = Timer.new(@player)
    @font = Gosu::Font.new(20)

  end

  def update
  	return if game_over?
  	gravity

    @player.accelerate if Gosu::button_down? Gosu::KbSpace
    
    @player.move
  end

  def draw
  	@background_image.draw(0, 0, ZOrder::BACKGROUND, 2, 2)
  	@font.draw("Score: #{@player.score}", 10, 10, ZOrder::TIMER, 1.0, 1.0, 0xff_ffff00)
    @font.draw("#{@timer.print_out}", 500, 10, ZOrder::TIMER, 1.0, 1.0, 0xff_ffff00)
    @font.draw("Health: #{@player.health}", 10, 25, ZOrder::TIMER, 1.0, 1.0, 0xff_ffff00)
		@player.draw
  end

  def game_over?
		@player.death?
	end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  private
  	def gravity
			@player.y < 35 ? @player.vel_y += GRAVITY : @player.vel_y = 0
		end
  	
end

window = GameWindow.new
window.show
