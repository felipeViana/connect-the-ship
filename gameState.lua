local bullets = require 'bullet'
local player = require 'player'

local stage = 1
local enemies = {}
local shipPartExists = false

local collisionThreshold = 10

local gameState = {}

local function spawnShipPart()
  shipPartExists = true
end


local function destroyEnemyAtIndex(index)
  table.remove(enemies, index)
end

function gameState.shipPartExists()
  return shipPartExists
end

function gameState.updateStage()
  stage = stage + 1
end

function gameState.getCurrentStage()
  return stage
end

function gameState.getEnemiesList()
  return enemies
end

function gameState.load()
  stage = 1
  enemies = {
    {
      type = 1,
      x = 100,
      y = 400
    },
    {
      type = 1,
      x = 300,
      y = 400
    },
    {
      type = 1,
      x = 100,
      y = 700
    }
  }
  shipPartExists = false
end

function gameState.update(dt)
  -- check level completion
  if #enemies == 0 and not shipPartExists then
    spawnShipPart()
  end

  -- check collision between player and shipPart
  -- TODO

  -- check collision between player and enemies
  -- TODO

  -- check collisition between bullets and enemies
  for bulletIndex, bullet in ipairs(bullets.getBulletList()) do
    for enemyIndex, enemy in ipairs(enemies) do
      -- TODO: better collision calculation
      if math.abs(bullet.x - enemy.x) < collisionThreshold and math.abs(bullet.y - enemy.y) < collisionThreshold then
        -- collide


        -- TODO: manage enemies in its own class
        destroyEnemyAtIndex(enemyIndex)
        bullets.destroyAtIndex(bulletIndex)
      end
    end
  end

end

return gameState