local bullet = {}

local bulletList = {}

local bulletHeight = 10
local bulletSpeed = 700

function bullet.createBulletAt(x, y, power)
  local newBullet = {
    x = x,
    y = y,
    power = power
  }

  table.insert(bulletList, newBullet)
end


function bullet.destroyAtIndex(index)
  table.remove(bulletList, index)
end

function bullet.getBulletList()
  return bulletList
end

function bullet.load()
end

function bullet.update(dt)
  -- remove off-screen bullets
  for index = #bulletList, 1, -1 do
    bulletList[index].y = bulletList[index].y - bulletSpeed * dt

    if bulletList[index].y < - 100 then
      table.remove(bulletList, index)
    end
  end


  -- check collision with enemies

end

function bullet.draw()
  -- for each bullet, draw it
  for index, bullet in ipairs(bulletList) do
    -- love.graphics.print("bullet", bullet.x, bullet.y)
    love.graphics.line(bullet.x, bullet.y, bullet.x, bullet.y - bulletHeight)
  end
end

return bullet