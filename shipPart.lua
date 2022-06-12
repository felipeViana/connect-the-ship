local gameState = require 'gameState'

local shipPart = {}

local exists = false

local windowWidth
local size = 40
local position = {}

function shipPart.load()
  exists = false
  windowWidth = love.graphics.getWidth()

  position = {x = windowWidth / 2 - 50, y = 150}
end

function shipPart.update(dt)
  if gameState.shipPartExists() then
    exists = true
  end
end

function shipPart.draw()
  if exists then
    love.graphics.print("new ship part!", windowWidth / 2 - 60, 130)

    -- draw star
    love.graphics.polygon(
      'line',
      position.x + size / 2, position.y, -- A
      position.x + size * 2 / 3, position.y + size / 3,
      position.x + size, position.y + size / 3, -- B
      position.x + size * 2 / 3, position.y + size / 2,
      position.x + size, position.y + size, -- C
      position.x + size / 2, position.y + size * 2 / 3,
      position.x, position.y + size, -- D
      position.x + size / 3, position.y + size / 2,
      position.x, position.y + size / 3, -- E
      position.x + size / 3, position.y + size /3
    )
  end
end

return shipPart