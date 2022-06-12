local stage = 1
local enemies = {}
local shipPartExists = false

local gameState = {}

local function spawnShipPart()
  shipPartExists = true
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

function gameState.update(dt)
  if #enemies == 0 and not shipPartExists then
    spawnShipPart()
  end
end

return gameState