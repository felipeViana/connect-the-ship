local gameState = require 'gameState'
local player = require 'player'

local hud = {}

function hud.load()
end

function hud.update(dt)
end

function hud.draw()
  love.graphics.print("stage " .. gameState.getCurrentStage(), 250, 10)

  love.graphics.print("life " .. player.getCurrentHealth())
  love.graphics.print("power " .. player.getCurrentPower(), 0, 15)
  love.graphics.print("speed " .. player.getCurrentSpeed(), 0, 30)

end

return hud