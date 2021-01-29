function fMove(char, dt)
  if char.dir == 'w' then
    if char.acc < 200 then char.acc = char.acc + 20 end
    char.yd = char.yd - (char.acc * dt)
    char.y = math.floor(char.yd)
  elseif char.dir == 's' then
    if char.acc < 200 then char.acc = char.acc + 20 end
    char.yd = char.yd + (char.acc * dt)
    char.y = math.floor(char.yd)
  elseif char.dir == 'a' then
    if char.acc < 200 then char.acc = char.acc + 20 end
    char.xd = char.xd - (char.acc * dt)
    char.x = math.floor(char.xd)
  elseif char.dir == 'd' then
    if char.acc < 200 then char.acc = char.acc + 20 end
    char.xd = char.xd + (char.acc * dt)
    char.x = math.floor(char.xd)
  elseif char.dir == 'wa' then
    if char.acc < 160 then char.acc = char.acc + 20
    elseif char.acc > 160 then char.acc = 160 end
    char.yd = char.yd - (char.acc * dt)
    char.y = math.floor(char.yd)
    char.xd = char.xd - (char.acc * dt)
    char.x = math.floor(char.xd)
  elseif char.dir == 'wd' then
    if char.acc < 160 then char.acc = char.acc + 20
    elseif char.acc > 160 then char.acc = 160 end
    char.yd = char.yd - (char.acc * dt)
    char.y = math.floor(char.yd)
    char.xd = char.xd + (char.acc * dt)
    char.x = math.floor(char.xd)
  elseif char.dir == 'sa' then
    if char.acc < 160 then char.acc = char.acc + 20
    elseif char.acc > 160 then char.acc = 160 end
    char.yd = char.yd + (char.acc * dt)
    char.y = math.floor(char.yd)
    char.xd = char.xd - (char.acc * dt)
    char.x = math.floor(char.xd)
  elseif char.dir == 'sd' then
    if char.acc < 160 then char.acc = char.acc + 20
    elseif char.acc > 160 then char.acc = 160 end
    char.yd = char.yd + (char.acc * dt)
    char.y = math.floor(char.yd)
    char.xd = char.xd + (char.acc * dt)
    char.x = math.floor(char.xd)
  elseif string.find(char.dir, 'x') then
    if char.acc > 0 then char.acc = char.acc - 20 end
  end
end