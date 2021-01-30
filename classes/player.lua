playerClass = {}
function playerClass.new(x, y, w, h)
  local self = {}
-- MOVIMIENTO
  self.arrowImage = love.graphics.newImage('imgs/arrows.png')
  self.arrowSprites = {}
  self.x = x
  self.y = y
  self.xd = x
  self.yd = y
  self.acc = 0
  self.dir = 'x'
  self.move = true
--TAMAÑO
  self.w = w
  self.h = h
--ATAKE
  self. atkarray = {}
  self.atk = 0
  self.atkcount = 0
  self.atkn = 1
--FUNCIONES
  self.fSprites = function()
    for a=1,8 do
      table.insert(self.arrowSprites, love.graphics.newQuad((a-1)*64, 0, 64, 64, self.arrowImage:getDimensions()))
    end
  end
  self.fMove = function(dt)
    if self.atk == 0 then
      self.move = 1
      if love.keyboard.isDown('up') and love.keyboard.isDown('right') then self.dir = 'wd'
      elseif love.keyboard.isDown('up') and love.keyboard.isDown('left') then self.dir = 'wa'
      elseif love.keyboard.isDown('down') and love.keyboard.isDown('right') then self.dir = 'sd'
      elseif love.keyboard.isDown('down') and love.keyboard.isDown('left') then self.dir = 'sa'
      elseif love.keyboard.isDown('down') then self.dir = 's'
      elseif love.keyboard.isDown('up') then self.dir = 'w'
      elseif love.keyboard.isDown('left') then self.dir = 'a'
      elseif love.keyboard.isDown('right') then self.dir = 'd'
      else self.move = 0
      end
    else
      self.move = 0
    end
    fMove(self, dt)
  end
  self.fAtack = function(dt)
    if self.atk == 1 then
      velplayers = 0.1
      self.atkcount = self.atkcount + dt
      if self.atkcount > 0.2 then
        self.atkn = self.atkn + 1
        self.atkcount = 0
        if self.atkn > 8 then self.atkn = 1 end
      end
    elseif self.atk == 2 then
      local dx = 0
      local dy = 0
      if self.atkn == 1 then dx = 0 dy = -160 self.dir = 'w'
      elseif self.atkn == 2 then dx = 140 dy = -140 self.dir = 'wd'
      elseif self.atkn == 3 then dx = 160 dy = 0 self.dir = 'd'
      elseif self.atkn == 4 then dx = 140 dy = 140 self.dir = 'sd'
      elseif self.atkn == 5 then dx = 0 dy = 160 self.dir = 's'
      elseif self.atkn == 6 then dx = -140 dy = 140 self.dir = 'sa'
      elseif self.atkn == 7 then dx = -160 dy = 0 self.dir = 'a'
      elseif self.atkn == 8 then dx = -140 dy = -140 self.dir = 'wa' end
      for a=1,10 do
        table.insert(self.atkarray,{x=self.x+(dx/10)*a, y=self.y+(dy/10)*a, dt=-0.01*(a-1)})
      end
      self.xd = self.xd + dx
      self.yd = self.yd + dy
      self.x = math.floor(self.xd)
      self.y = math.floor(self.yd)
      velplayers = 1
      self.atk = 3
    elseif self.atk == 3 then
      for a=1,10 do
        self.atkarray[a].dt = self.atkarray[a].dt + dt
      end
      if self.atkarray[10].dt >= 0.3 then
        self.atk = 0
        self.atkarray = {}
      end
    end
  end
  self.keypressed = function(key)
    if key == 'x' then
      if self.atk == 0 then
        self.atk = 1
        self.atkn = 1
      elseif self.atk == 1 then self.atk = 2 end
    end
  end
  return self
end