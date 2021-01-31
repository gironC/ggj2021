playerClass = {}
function playerClass.new(x, y, w, h)
  local self = {}
-- SPRITES
  self.arrowImage = love.graphics.newImage('imgs/arrows.png')
  self.playerImage = love.graphics.newImage('imgs/player.png')
  self.arrowSprites = {}
  self.playerSprites = {}
  self.spriteT = 0
  self.spriteF = 1
  self.spriteS = 1
  self.spriteC = 0
-- MOVIMIENTO
  self.x = x
  self.y = y
  self.xd = x
  self.yd = y
  self.acc = 0
  self.dir = 'x'
  self.move = 1
  self.quadra = {(y + (h / 2)) / 16, (x + (w / 2)) / 16}
  self.quadra = {math.floor(self.quadra[1]), math.floor(self.quadra[2])}
--PROPIEDADES
  self.w = w
  self.h = h
  self.life = 10
--ATAKE
  self. atkarray = {}
  self.atk = 5
  self.atkcount = 0
  self.atkn = 1
--FUNCIONES
  self.fSprites = function()
    for a = 1, 8 do
      table.insert(self.arrowSprites, love.graphics.newQuad((a-1)*32, 0, 32, 32, self.arrowImage:getDimensions()))
    end
    for a = 1, 12 do
      table.insert(self.playerSprites, {})
      for b = 1, 8 do
        table.insert(self.playerSprites[a], love.graphics.newQuad((b - 1) * 16, (a - 1) * 16, 16, 16, self.playerImage:getDimensions()))
      end
    end
  end
  self.fAnim = function(dt)
    if self.atk == 0 then
      if self.move == 1 then self.spriteT = 1
      else self.spriteT = 0 end
    elseif self.atk == 1 then self.spriteT = 2
    elseif self.atk == 2 then self.spriteT = 3
    elseif self.atk == 3 then self.spriteT = 3
    elseif self.atk == 4 then self.spriteT = 4
    elseif self.atk == 5 then self.spriteT = 5 end
    if string.find(self.dir,'a') then self.spriteF = 2
    elseif string.find(self.dir,'d') then self.spriteF = 1 end
    self.spriteC = self.spriteC + dt
    if self.spriteC >= 0.1 then
      self.spriteC = 0
      self.spriteS = self.spriteS + 1
      if self.spriteS > 8 then
        if self.atk == 5 then self.atk = 0 end
        if self.atk == 4 then self.life = self.life - 1
          if self.life > 0 then self.atk = 5 self.move = 0 self.acc = 0
            for a = 1, #mapActive do
              for b = 1, #mapActive[a] do
                if mapActive [a][b] == 2 then
                  self.x = b * 16 self.xd = self.x
                  self.y = a * 16 self.yd = self.y break
                end
              end
            end
          else
            --GEIM OVER
          end
        end
        if self.atk == 1 then self.spriteS = 5
        else self.spriteS = 1 end
      end
    end
  end
  self.fMove = function(dt)
    if self.atk == 0 then
      if self.move < 2 then
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
      elseif self.move == 2 then
        if self.dir == 'wd' then self.dir = 'sa'
        elseif self.dir == 'wa' then self.dir = 'sd'
        elseif self.dir == 'sd' then self.dir = 'wa'
        elseif self.dir == 'sa' then self.dir = 'wd'
        elseif self.dir == 'w' then self.dir = 's'
        elseif self.dir == 'a' then self.dir = 'd'
        elseif self.dir == 's' then self.dir = 'w'
        elseif self.dir == 'd' then self.dir = 'a' end
        self.move = 3
      elseif self.move == 3 then
        if self.acc <= 0 then self.move = 0 end
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
      if self.atkcount > 0.15 then
        self.atkn = self.atkn + 1
        self.atkcount = 0
        if self.atkn > 8 then self.atkn = 1 end
      end
      if self.move == 2 then velplayers = 1 self.atk = 0 end
    elseif self.atk == 2 then
      local dx = 0
      local dy = 0
      if self.atkn == 1 then dx = 0 dy = -80 self.dir = 'w'
      elseif self.atkn == 2 then dx = 64 dy = -64 self.dir = 'wd'
      elseif self.atkn == 3 then dx = 80 dy = 0 self.dir = 'd'
      elseif self.atkn == 4 then dx = 64 dy = 64 self.dir = 'sd'
      elseif self.atkn == 5 then dx = 0 dy = 80 self.dir = 's'
      elseif self.atkn == 6 then dx = -64 dy = 64 self.dir = 'sa'
      elseif self.atkn == 7 then dx = -80 dy = 0 self.dir = 'a'
      elseif self.atkn == 8 then dx = -64 dy = -64 self.dir = 'wa' end
      for i=1,10 do
        table.insert(self.atkarray,{x=self.x+(dx/10)*i, y=self.y+(dy/10)*i, dt=-0.01*(i-1)})
      end
      self.xd = self.xd + dx
      self.yd = self.yd + dy
      self.x = math.floor(self.xd)
      self.y = math.floor(self.yd)
      velplayers = 1
      self.atk = 3
      self.spriteS = 1
      self.spriteC = 0
    elseif self.atk == 3 then
      for a=1,#self.atkarray do self.atkarray[a].dt = self.atkarray[a].dt + dt end
      if #self.atkarray > 0 then
        if self.atkarray[#self.atkarray].dt >= 0.3 then
          self.atk = 0
          self.atkarray = {}
        end
      end
    end
  end
  self.fCollision = function()
    if self.atk < 2 then
      local collision = {0, 0}
      for a = 1, #colsActive do
        if self.y + self.h >= colsActive[a].y and self.y + self.h <= colsActive[a].y + colsActive[a].h then
          if self.x >= colsActive[a].x and self.x <= colsActive[a].x + colsActive[a].w then collision[1] = 1 end
          if self.x + self.w >= colsActive[a].x and self.x + self.w <= colsActive[a].x + colsActive[a].w then collision[2] = 1 end  
        end
      end
      if collision[1] == 1 and collision[2] == 1 then self.atk = 4 self.spriteS = 1 self.spriteC = 0 velplayers = 1 end
    end
    for a = 1, #mapActive do
      for b = 1, #mapActive[a] do
        if self.y + (self.h / 2) >= a * 16 and self.y + (self.h / 2) <= (a + 1) * 16 then
          if self.x + (self.h / 2) >= b * 16 and self.x + (self.w / 2) <= (b + 1) * 16 then self.quadra = {a, b} break end
        end
      end
    end
  end
  self.keypressed = function(key)
    if key == 'x' then
      if self.atk == 0 then
        self.atk = 1
        self.atkn = 1
        self.spriteS = 1
        self.spriteC = 0
      elseif self.atk == 1 then
        self.spriteS = 1
        self.spriteC = 0
        self.atk = 2
      end
    end
  end
  return self
end