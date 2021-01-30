function fMove(char, dt)
  if char.move == 1 then
    if char.dir == 'w' then
      if char.acc < 200 then char.acc = char.acc + 10 end
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
    elseif char.dir == 's' then
      if char.acc < 200 then char.acc = char.acc + 10 end
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
    elseif char.dir == 'a' then
      if char.acc < 200 then char.acc = char.acc + 10 end
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'd' then
      if char.acc < 200 then char.acc = char.acc + 10 end
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'wa' then
      if char.acc < 160 then char.acc = char.acc + 10
      elseif char.acc > 160 then char.acc = 160 end
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'wd' then
      if char.acc < 160 then char.acc = char.acc + 10
      elseif char.acc > 160 then char.acc = 160 end
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'sa' then
      if char.acc < 160 then char.acc = char.acc + 10
      elseif char.acc > 160 then char.acc = 160 end
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'sd' then
      if char.acc < 160 then char.acc = char.acc + 10
      elseif char.acc > 160 then char.acc = 160 end
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    end
  else
    if char.acc > 0 then char.acc = char.acc - (10 * velplayers)
    elseif char.acc < 0 then char.acc = 0 end
    if string.find(char.dir, 'w') then
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
    elseif string.find(char.dir, 's') then
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
    end
    if string.find(char.dir, 'a') then
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif string.find(char.dir, 'd') then
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    end
  end
end