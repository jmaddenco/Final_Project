require 'gosu'
require_relative 'z_order'
require_relative 'player'

	class GameWindow < Gosu::Window

  def initialize
    super 1100, 354
    self.caption = "Free Runner"

    @background_image = Gosu::Image.new("media/Upper_Taconic_cropped.jpg", 
                                        :tileable => true) 
    @player = Player.new
    @player.warp(width/2.0, height/2.0)
  end

  def draw
  	@background_image.draw(0, 0, ZOrder::BACKGROUND, 2, 2)
  end

   def button_down(id)
    close if id == Gosu::KbEscape
  end
end

window = GameWindow.new
window.show
