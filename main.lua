local sceneManager = require 'sceneManager'
local gameState = require 'gameState'

function love.load( ... )
  gameState.load()
  sceneManager.changeScene(require 'game')
end

function love.update(dt)
  gameState.update(dt)
  sceneManager.currentScene.update(dt)
end

function love.draw()
  -- gameState.draw()
  sceneManager.draw()
end

function love.keypressed(key)
  sceneManager.currentScene.keypressed(key)

  if key == 'escape' then
    love.event.quit()
  end

end

function love.mousepressed(x, y, button)
  sceneManager.currentScene.mousepressed(x, y, button)
end
