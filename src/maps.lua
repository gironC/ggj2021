function map1(player)
  mapImage = love.graphics.newImage('imgs/map1.png')
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,2,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(mapActive,{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1})
  table.insert(colsActive,{x=0, y=0, w=384, h=80})
  table.insert(colsActive,{x=0, y=0, w=80, h=384})
  table.insert(colsActive,{x=272, y=0, w=80, h=384})
  table.insert(colsActive,{x=0, y=272, w=384, h=80})
  table.insert(colsActive,{x=160, y=160, w=32, h=32})
  for a = 1, #mapActive do
    for b = 1, #mapActive[a] do
      if mapActive[a][b] == 2 then
        player.x = b * 16 player.xd = player.x
        player.y = a * 16 player.yd = player.y
        player.quadra = {a, b}
      end
    end
  end
  table.insert(enemies,dummyClass.new(96, 96, 16, 16, 6, player))
  table.insert(enemies,dummyClass.new(240, 96, 16, 16, 6, player))
end