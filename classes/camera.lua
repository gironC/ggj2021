cameraClass = {}
cameraClass.new = function(x, y)
  local self = {}
  self.x = x
  self.y = y
  self.move = function(parent)
    self.x = -((parent.x + (parent.w / 2)) - (love.graphics.getWidth() / 6))
    self.y = -((parent.y + (parent.h / 2)) - (love.graphics.getHeight() / 6))
  end
  return self
end