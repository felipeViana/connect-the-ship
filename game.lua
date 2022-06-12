local game = {}

local player = require 'player'

function game.load()
  player.load()
end

function game.update(dt)
  player.update(dt)

end

function game.draw()
  player.draw()
end


return game