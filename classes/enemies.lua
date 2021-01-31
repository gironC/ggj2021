dummyClass = {}
dummyClass.new = function(x, y, w, h, vel, player)
  local self = {}
  --POSICION
  self.x = x
  self.y = y
  self.xd = x
  self.yd = y
  --PROPIEDADES
  self.w = w
  self.h = h
  self.life = 10
  self.move = 1
  self.state = 1
  self.atkquads = {}
  --ANIM
  self.enemyImg = love.graphics.newImage('imgs/enemy.png')
  self.enemyatkImg = love.graphics.newImage('imgs/enemyatk.png')
  self.enemySprites = {}
  self.enemyatkSprites = {}
  self.spriteT = 0 --c d a m
  self.spriteC = 0
  self.spriteS = 1
  --A*
  self.aQuadra = {(y + (h / 2)) / 16, (x + (w / 2)) / 16}
  self.aQuadra = {math.floor(self.aQuadra[1]), math.floor(self.aQuadra[2])}
  self.aAbierta = {}
  self.aCerrada = {{q = self.aQuadra, p = {0, 0}, f = 0, g = 0, h = 0}}
  self.aFin = {player.quadra[1], player.quadra[2]}
  self.ruta = {}
  self.vel = vel * 10
  self.fSprites = function()
    for a = 1, 8 do
      table.insert(self.enemyatkSprites, love.graphics.newQuad((a-1)*16, 0, 16, 16, self.enemyatkImg:getDimensions()))
    end
    for a = 1, 4 do
      table.insert(self.enemySprites, {})
      for b = 1, 8 do
        table.insert(self.enemySprites[a], love.graphics.newQuad((b - 1) * 16, (a - 1) * 16, 16, 16, self.enemyImg:getDimensions()))
      end
    end
  end
  self.fAnim = function(dt, player)
    self.spriteC = self.spriteC + (dt * velplayers)
    if self.spriteC >= 0.1 then
      self.spriteC = 0
      self.spriteS = self.spriteS + 1
      if self.spriteS > 8 then
        if self.move == 3 then
        end
        if self.move == 5 then
          self.move = 1
          self.atkquads = {}
        end
        if self.move == 6 then self.state = 0 end
        self.spriteS = 1
      end
    end
  end
  self.update = function(dt, player)
    print(self.x..' - '..self.y)
    if self.move == 1 then
      self.spriteT = 0
      if player.quadra[1] == self.aFin[1] and player.quadra[2] == self.aFin[2] then
        if #self.ruta > 1 then
          if self.x >= self.ruta[1][2] * 16 and self.x <= (self.ruta[1][2] * 16) + 4 and self.y >= self.ruta[1][1] * 16 and self.y <= (self.ruta[1][1] * 16) + 4 then
            self.x = self.ruta[1][2] * 16 self.xd = self.x
            self.y = self.ruta[1][1] * 16 self.yd = self.y
            table.remove(self.ruta, 1)
          end
          if self.ruta[1][1] * 16 > self.y then
            self.yd = self.yd + (self.vel * dt * velplayers)
            self.y = math.floor(self.yd)
          elseif self.ruta[1][1] * 16 < self.y then
            self.yd = self.yd - (self.vel * dt * velplayers)
            self.y = math.floor(self.yd)
          else
            if self.ruta[1][2] * 16 > self.x then
              self.xd = self.xd + (self.vel * dt * velplayers)
              self.x = math.floor(self.xd)
            elseif self.ruta[1][2] * 16 < self.x then
              self.xd = self.xd - (self.vel * dt * velplayers)
              self.x = math.floor(self.xd)
            end
          end
        else self.move = 4 end
      else
        self.aQuadra = self.ruta[1]
        self.aCerrada = {{q = self.aQuadra, p = {0, 0}, f = 0, g = 0, h = 0}}
        self.aFin = {player.quadra[1], player.quadra[2]}
        aStar(self,player)
      end
    elseif self.move == 2 then
      self.move = 3
      self.spriteC = 0
      self.spriteS = 1
      self.spriteT = 1
    end
  end
  self.fAtk = function()
    if self.move == 4 then
      self.move = 5
      self.spriteC = 0
      self.spriteS = 1
      self.spriteT = 2
      self.atkquads = {}
      table.insert(self.atkquads,{self.x,self.y-16})
      table.insert(self.atkquads,{self.x,self.y+16})
      table.insert(self.atkquads,{self.x+16,self.y})
      table.insert(self.atkquads,{self.x-16,self.y})
    end
  end
  return self
end