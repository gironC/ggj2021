function drawGame()
  love.graphics.print(player.x..'-'..player.y,player.x, player.y-20)
  love.graphics.rectangle('fill',player.x,player.y,player.w,player.h)
end