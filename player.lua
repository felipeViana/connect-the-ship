-- singleton class for player state
local player = {}

local playerState = nil

local position = {x = 100, y = 100}

local tileSize = 35

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
    speed = 450,
    width = tileSize,
    height = tileSize * 2,
    tiles = {
      {x = 0, y = 0},
      {x = 0, y = 1},
    }
  },
  {
    level = 3,
    tileCount = 4,
    health = 3,
    power = 3,
    speed = 400,
    width = tileSize * 3,
    height = tileSize * 2,
    tiles = {
      {x = 1, y = 0},
      {x = 0, y = 1},
      {x = 1, y = 1},
      {x = 2, y = 1},
    }
  },
  {
    level = 4,
    tileCount = 7,
    health = 4,
    power = 5,
    speed = 350,
    width = tileSize * 3,
    height = tileSize * 3,
    tiles = {
      {x = 1, y = 0},
      {x = 0, y = 1},
      {x = 1, y = 1},
      {x = 2, y = 1},
      {x = 0, y = 2},
      {x = 1, y = 2},
      {x = 2, y = 2},
    }
  },
  {
    level = 5,
    tileCount = 11,
    health = 5,
    power = 7,
    speed = 300,
    width = tileSize * 3,
    height = tileSize * 5,
    tiles = {
      {x = 1, y = 0},
      {x = 1, y = 1},

      {x = 0, y = 2},
      {x = 1, y = 2},
      {x = 2, y = 2},

      {x = 0, y = 3},
      {x = 1, y = 3},
      {x = 2, y = 3},

      {x = 0, y = 4},
      {x = 1, y = 4},
      {x = 2, y = 4},
    }
  },
  {
    level = 6,
    tileCount = 27,
    health = 10,
    power = 12,
    speed = 200,
    width = tileSize * 7,
    height = tileSize * 7,
    tiles = {
      {x = 3, y = 0},

      {x = 2, y = 1},
      {x = 3, y = 1},
      {x = 4, y = 1},

      {x = 1, y = 2},
      {x = 2, y = 2},
      {x = 3, y = 2},
      {x = 4, y = 2},
      {x = 5, y = 2},

      {x = 0, y = 3},
      {x = 1, y = 3},
      {x = 2, y = 3},
      {x = 3, y = 3},
      {x = 4, y = 3},
      {x = 5, y = 3},
      {x = 6, y = 3},

      {x = 1, y = 4},
      {x = 2, y = 4},
      {x = 3, y = 4},
      {x = 4, y = 4},
      {x = 5, y = 4},

      {x = 1, y = 5},
      {x = 2, y = 5},
      {x = 3, y = 5},
      {x = 4, y = 5},
      {x = 5, y = 5},

      {x = 3, y = 6},
    }
  },
}


function player.load()
  playerState = possibleStates[1]


  position.x = windowWidth / 2 - playerState.width / 2
  position.y = windowHeight - playerState.height - tileSize * 3
end

function player.levelUp()
  if possibleStates[playerState.level + 1] then
    playerState = possibleStates[playerState.level + 1]
  end
end

function player.shoot()
  player.levelUp()

  -- createBulletAt(x, y)
end

function player.update(dt)
  -- movement controls
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

function player.keypressed(key)
  if key == 'space' then
    player.shoot()
  end
end


return player