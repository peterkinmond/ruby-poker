Dir["./lib/poker/*.rb"].each {|file| require file}

game = Game.new
