require 'classes.player'
require 'src.draws'
require 'src.functions'

function love.load()
  player = playerClass.new(50, 50, 32, 32)
end

function love.keypressed(key)
end

function love.update(dt)
  player.move(dt)
end

function love.draw()
  drawGame()
end