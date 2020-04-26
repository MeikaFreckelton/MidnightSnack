#emoji variables:
$cat = "\u{1F431}"
$mouse = "\u{1F401}"
$rat = "\u{1F400}"
$fish1 = "\u{1F41F}"
$angry_kitty = "\u{1F63E}"
$sleeping_head = "\u{1F634}"
$dead_end = "\u{2620}"
$chicken = "\u{1F357}"
$bed = "\u{1F6CF}"
$hole = "\u{1F573}"

require_relative './welcome_page.rb'
require_relative './title.rb'
require_relative './game.rb'
require_relative './gameover.rb'
require_relative './game_layout.rb'
require 'io/console'

# puts welcome
game = CatGame.new ( $boards[$board_array[0]] )

