require 'classes.player'
require 'classes.camera'
require 'classes.enemies'
require 'src.draws'
require 'src.functions'
require 'src.maps'

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest', 1)
  love.graphics.setBackgroundColor(0.42,0.44,0.65)
  mapActive = {}
  colsActive = {}
  enemies = {}
  mapImage = ''
  velplayers = 1
  player = playerClass.new(112, 128, 16, 16)
  player.fSprites()
  camera = cameraClass.new()
  map1(player)
  for a = 1, #enemies do
    enemies[a].fSprites()
    aStar(enemies[a],player)
  end
end

function love.keypressed(key)
  player.keypressed(key)
end

function love.update(dt)
  player.fMove(dt)
  player.fCollision()
  player.fAtack(dt)
  player.fAnim(dt)
  camera.move(player)
  if #enemies > 0 then
    local remover = {}
    for a = 1, #enemies do
      enemies[a].update(dt, player)
      enemies[a].fAtk(dt)
      enemies[a].fAnim(dt)
      if enemies[a].state == 0 then table.remove(remover,a) end
    end
    for a = 1, #remover do
      table.remove(enemies[remover[a]])
    end
  end
end

function love.draw()
  drawGame()
end