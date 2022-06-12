local gameState = require 'gameState'

local enemies = {}

local size = 30

function enemies.load()
  enemies = gameState.getEnemiesList()
end

function enemies.update(dt)
end

function enemies.draw()
  -- for each enemy in list, draw it
  for index, enemy in ipairs(enemies) do
    if enemy.type == 1 then
      -- draw triangle
      love.graphics.polygon(
        'fill',
        enemy.x, enemy.y,
        enemy.x + size, enemy.y,
        enemy.x + size / 2, enemy.y + size
      )
    end
  end

end

return enemies
