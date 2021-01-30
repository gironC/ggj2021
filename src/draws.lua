function drawGame()
  if #player.atkarray > 0 then
    for a=1,10 do
      love.graphics.setColor(0.1 * a,0.1 * a,0.1 * a)
      if player.atkarray[a].dt >= 0 and player.atkarray[a].dt <= 0.3 then love.graphics.rectangle('fill',player.atkarray[a].x,player.atkarray[a].y,player.w,player.h) end
    end
  end
  love.graphics.rectangle('fill',player.x,player.y,player.w,player.h)
  love.graphics.print(player.atkn,10,10)
  if player.atk==1 then love.graphics.draw(player.arrowImage,player.arrowSprites[player.atkn],player.x-16,player.y-16) end
end