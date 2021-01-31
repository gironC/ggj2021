function drawGame()
  love.graphics.scale(3,3)
  love.graphics.translate(camera.x,camera.y)
  love.graphics.draw(mapImage,16,16)
  if #player.atkarray > 0 then
    for a=1,#player.atkarray do
      love.graphics.setColor(1,1,1,(1-(a/10)))
      if player.atkarray[a].dt >= 0 and player.atkarray[a].dt <= 0.3 then
        love.graphics.draw(player.playerImage,player.playerSprites[(player.spriteT * 2) + (player.spriteF)][player.spriteS], player.atkarray[a].x, player.atkarray[a].y)
      end
    end
  end
  love.graphics.setColor(1,1,1)
  if #enemies > 0 then
    for a = 1, #enemies do
      love.graphics.draw(enemies[a].enemyImg,enemies[a].enemySprites[enemies[a].spriteT + 1][enemies[a].spriteS], enemies[a].x, enemies[a].y)
      if #enemies[a].atkquads > 0 then
        for b = 1, #enemies[a].atkquads do
          love.graphics.draw(enemies[a].enemyatkImg, enemies[a].enemyatkSprites[enemies[a].spriteS], enemies[a].atkquads[b][1], enemies[a].atkquads[b][2])
        end
      end
    end
  end
  --love.graphics.rectangle('fill',player.x,player.y,player.w,player.h)
  love.graphics.draw(player.playerImage,player.playerSprites[(player.spriteT * 2) + (player.spriteF)][player.spriteS], player.x, player.y)
  --love.graphics.print(player.quadra[2]..' - '..player.quadra[1],player.x,player.y - 10)
  if player.atk==1 then love.graphics.draw(player.arrowImage,player.arrowSprites[player.atkn],player.x-8,player.y-8) end
end