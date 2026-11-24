# Interno: @s murió desde el último segundo. Vuelve a empezar de cero.
scoreboard players reset @s sm.died
scoreboard players set @s sm.life 0
function secret_milestones:milestone/life_1000/save_start
