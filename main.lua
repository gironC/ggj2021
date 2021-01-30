require 'classes.player'
require 'src.draws'
require 'src.functions'

function love.load()
  player = playerClass.new(50, 50, 32, 32)
  player.fSprites()
  velplayers = 1
end

function love.keypressed(key)
  player.keypressed(key)
end

function love.update(dt)
  player.fMove(dt)
  player.fAtack(dt)
end

function love.draw()
  drawGame()
end