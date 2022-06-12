-- singleton class for player state
local player = {}

local playerState = nil

local position = {x = 100, y = 100}

local tileSize = 50

local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()

local possibleStates = {
  {
    level = 1,
    tileCount = 1,
    health = 1,
    power = 1,
    speed = 500,
    width = tileSize,
    height = tileSize,
    tiles = {
      {x = 0, y = 0},
    }
  },
  {
    level = 2,
    tileCount = 2,
    health = 2,
    power = 1.5,
    speed = 250,
    width = tileSize,
    height = tileSize * 2,
    tiles = {
      {x = 0, y = 0},
      {x = 0, y = 1},
    }
  }
}

function player.load()
  playerState = {
    -- possibleStates[1]
    level = 1,
    tileCount = 1,
    health = 1,
    power = 1,
    speed = 500,
    width = tileSize,
    height = tileSize,
    tiles = {
      {x = 0, y = 0},
    }
  }

  position.x = windowWidth / 2 - playerState.width / 2
  position.y = windowHeight - playerState.height - tileSize * 3
end

function player.update(dt)

  -- controls
  if love.keyboard.isDown('up', 'w') then
    position.y = position.y - playerState.speed * dt
  end
  if love.keyboard.isDown('down', 's') then
    position.y = position.y + playerState.speed * dt
  end
  if love.keyboard.isDown('right', 'd') then
    position.x = position.x + playerState.speed * dt
  end
  if love.keyboard.isDown('left', 'a') then
    position.x = position.x - playerState.speed * dt
  end

  -- border limits
  -- using upper left corner as reference
  if position.x > windowWidth - playerState.width then
    position.x = windowWidth - playerState.width
  elseif position.x < 0 then
    position.x = 0
  end
  if position.y > windowHeight - playerState.height then
    position.y = windowHeight - playerState.height
  elseif position.y < 0 then
    position.y = 0
  end
end

function player.draw()
  -- for each tile, draw it
  for index, tile in ipairs(playerState.tiles) do
    love.graphics.rectangle(
      'line',
      position.x + tile.x * tileSize,
      position.y + tile.y * tileSize,
      tileSize,
      tileSize
    )
  end
end


return player