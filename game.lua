local game = {}

local player = require 'player'
local bullet = require 'bullet'
local hud = require 'hud'
local shipPart = require 'shipPart'

function game.load()
  player.load()
  bullet.load()
  hud.load()
  shipPart.load()
end

function game.update(dt)
  hud.update(dt)
  player.update(dt)
  bullet.update(dt)
  shipPart.update(dt)
end

function game.draw()
  hud.draw()
  player.draw()
  -- enemies.draw()
  bullet.draw()
  shipPart.draw()
end

function game.keypressed(key)
  player.keypressed(key)
end


return game