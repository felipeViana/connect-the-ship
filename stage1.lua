local game = {}

local player = require 'player'
local bullet = require 'bullet'

function game.load()
  player.load()

  bullet.load()
end

function game.update(dt)
  player.update(dt)

  bullet.update(dt)
end

function game.draw()
  player.draw()

  bullet.draw()
end

function game.keypressed(key)
  player.keypressed(key)
end


return game