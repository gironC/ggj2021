playerClass = {}
function playerClass.new(x, y, w, h)
  local self = {}
-- MOVIMIENTO
  self.x = x
  self.y = y
  self.xd = x
  self.yd = y
  self.acc = 0
  self.dir = 'x'
--TAMAÑO
  self.w = w
  self.h = h
--ATAKE
  self.atk = 0
  self.atkd = 100
  self.atkx = 0
  self.atky = 0
  self.atkp = 0
--FUNCIONES
  self.move = function(dt)
    if self.atk == 0 then
      if love.keyboard.isDown('w') and love.keyboard.isDown('d') then self.dir = 'wd'
      elseif love.keyboard.isDown('w') and love.keyboard.isDown('a') then self.dir = 'wa'
      elseif love.keyboard.isDown('s') and love.keyboard.isDown('d') then self.dir = 'sd'
      elseif love.keyboard.isDown('s') and love.keyboard.isDown('a') then self.dir = 'sa'
      elseif love.keyboard.isDown('s') then self.dir = 's'
      elseif love.keyboard.isDown('w') then self.dir = 'w'
      elseif love.keyboard.isDown('a') then self.dir = 'a'
      elseif love.keyboard.isDown('d') then self.dir = 'd'
      else
        if self.dir ~= 'x' then self.dir = 'x' .. self.dir end
      end
      fMove(self, dt)
    end
  end
  self.fAtack = function(dt)
    if self.atk == 1 then
      
    end
  end
  self.mousepressed = function(mx, my, button, istouch)
    if button == 1 then
      if self.atk == 0 then
        self.atk = 1
        self.atkd = 100
        self.atkx = mx
        self.atky = my
      end
    end
  end
  return self
end