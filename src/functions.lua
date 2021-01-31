function fMove(char, dt)
  if char.move == 1 then
    if char.dir == 'w' then
      if char.acc < 80 then char.acc = char.acc + 10 end
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
    elseif char.dir == 's' then
      if char.acc < 80 then char.acc = char.acc + 10 end
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
    elseif char.dir == 'a' then
      if char.acc < 80 then char.acc = char.acc + 10 end
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'd' then
      if char.acc < 80 then char.acc = char.acc + 10 end
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'wa' then
      if char.acc < 60 then char.acc = char.acc + 10
      elseif char.acc > 60 then char.acc = 60 end
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'wd' then
      if char.acc < 60 then char.acc = char.acc + 10
      elseif char.acc > 60 then char.acc = 60 end
      char.yd = char.yd - (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'sa' then
      if char.acc < 60 then char.acc = char.acc + 10
      elseif char.acc > 60 then char.acc = 60 end
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd - (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    elseif char.dir == 'sd' then
      if char.acc < 60 then char.acc = char.acc + 10
      elseif char.acc > 60 then char.acc = 60 end
      char.yd = char.yd + (char.acc * dt * velplayers)
      char.y = math.floor(char.yd)
      char.xd = char.xd + (char.acc * dt * velplayers)
      char.x = math.floor(char.xd)
    end
  else
    if char.acc > 0 then char.acc = char.acc - (20 * velplayers)
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

function aStar(enemy,player)
  local terminado = false
  local qs = {}
  local abiertosanalizar = {}
  local posactual = 1
  local estaenabierta = false
  local estaencerrada = false
  local nuevah = 0
  local nuevag = 0
  local nuevaf = 0
  local posabierta = 0
  local costemenor = 0
  local posabiertamenor = 0
  local abiertaacerrada = {}
  local padreactual = {}
  enemy.ruta = {}
  enemy.aAbierta = {}
  table.insert(qs,{enemy.aQuadra[1] - 1, enemy.aQuadra[2]})
  table.insert(qs,{enemy.aQuadra[1] + 1, enemy.aQuadra[2]})
  table.insert(qs,{enemy.aQuadra[1], enemy.aQuadra[2] + 1})
  table.insert(qs,{enemy.aQuadra[1], enemy.aQuadra[2] - 1})
  while terminado == false do
    terminado = false
    abiertosanalizar = {}
    for i = 1, 4 do
      if qs[i][1] < 1 or qs[i][2] < 1 or qs[i][1] > #mapActive or qs[i][2] > #mapActive[1] then
        goto continuar
      else
        if mapActive[qs[i][1]][qs[i][2]] ~= 1 then
          estaenabierta = false estaencerrada = false
          for a = 1, #enemy.aCerrada do
            if qs[i][1] == enemy.aCerrada[a].q[1] and qs[i][2] == enemy.aCerrada[a].q[2] then estaencerrada = true break end
          end
          if estaencerrada == true then goto continuar end
          if #enemy.aAbierta > 0 then
            for a = 1, #enemy.aAbierta do
              if qs[i][1] == enemy.aAbierta[a].q[1] and qs[i][2] == enemy.aAbierta[a].q[2] then
                posabierta = a
                estaenabierta = true
                break end
            end
          end
          if estaenabierta == true then
            nuevag = enemy.aCerrada[posactual].g + 10
            if nuevag < enemy.aAbierta[posabierta].g then
              if enemy.aFin[2] > enemy.aAbierta[posabierta].q[2] then nuevah = enemy.aAbierta[posabierta].q[2] - qs[i][2]
              else nuevah = qs[i][2] - enemy.aAbierta[posabierta].q[2] end
              if enemy.aAbierta[posabierta].q[1] > qs[i][1] then nuevah = nuevah + (enemy.aAbierta[posabierta].q[1] - qs[i][1])
              else nuevah = nuevah + (qs[i][1] - enemy.aAbierta[posabierta].q[2]) end
              nuevaf = nuevag + nuevah
              enemy.aAbierta[posabierta].p = enemy.aCerrada[posactual].q
              enemy.aAbierta[posabierta].g = nuevag
              enemy.aAbierta[posabierta].h = nuevah
              enemy.aAbierta[posabierta].f = nuevaf
              table.insert(abiertosanalizar,enemy.aAbierta[posabierta])
            end
          else
            if enemy.aFin[2] > qs[i][2] then nuevah = enemy.aFin[2] - qs[i][2]
            else nuevah = qs[i][2] - enemy.aFin[2] end
            if enemy.aFin[1] > qs[i][1] then nuevah = nuevah + (enemy.aFin[1] - qs[i][1])
            else nuevah = nuevah + (qs[i][1] - enemy.aFin[1]) end
            nuevag = enemy.aCerrada[posactual].g + 10
            nuevaf = nuevag + nuevah
            table.insert(enemy.aAbierta,{q={qs[i][1],qs[i][2]}, p = enemy.aCerrada[posactual].q, g = nuevag, h = nuevah, f = nuevaf})
            table.insert(abiertosanalizar,enemy.aAbierta[#enemy.aAbierta])
          end
        end
      end
      ::continuar::
    end
    if #abiertosanalizar > 0 then
      costemenor = 0
      for i = 1, #abiertosanalizar do
        if abiertosanalizar[i].q[1] == enemy.aFin[1] and abiertosanalizar[i].q[2] == enemy.aFin[2] then
          posabiertamenor = i
          terminado = true
          break
        end
        if costemenor == 0 then
          costemenor = abiertosanalizar[i].f
          posabiertamenor = i
        else
          if abiertosanalizar[i].f < costemenor then
            costemenor = abiertosanalizar[i].f
            posabiertamenor = i
          end
        end
      end
      for a = 1, #enemy.aAbierta do
        if enemy.aAbierta[a].q[1] == abiertosanalizar[posabiertamenor].q[1] and enemy.aAbierta[a].q[2] == abiertosanalizar[posabiertamenor].q[2] then
          table.insert(enemy.aCerrada,enemy.aAbierta[a])
          posactual = posactual + 1
          table.remove(enemy.aAbierta,a)
          break
        end
      end
    else terminado = true end
    qs = {}
    table.insert(qs,{enemy.aCerrada[posactual].q[1] - 1, enemy.aCerrada[posactual].q[2]})
    table.insert(qs,{enemy.aCerrada[posactual].q[1] + 1, enemy.aCerrada[posactual].q[2]})
    table.insert(qs,{enemy.aCerrada[posactual].q[1], enemy.aCerrada[posactual].q[2] + 1})
    table.insert(qs,{enemy.aCerrada[posactual].q[1], enemy.aCerrada[posactual].q[2] - 1})
  end
  for a = posactual, 1, -1 do
    if a == posactual then
      table.insert(enemy.ruta,enemy.aCerrada[a].q)
      padreactual = enemy.aCerrada[a].p
    else
      if enemy.aCerrada[a].q[1] == padreactual[1] and enemy.aCerrada[a].q[2] == padreactual[2] then
        table.insert(enemy.ruta,enemy.aCerrada[a].q)
        padreactual = enemy.aCerrada[a].p
      else goto sigpos end
    end
    ::sigpos::
  end
  local rutatemp = {}
  for a = #enemy.ruta, 1, -1 do
    table.insert(rutatemp,enemy.ruta[a])
  end
  enemy.ruta = rutatemp
end