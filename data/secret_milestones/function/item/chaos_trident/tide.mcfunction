# Interno: como el jugador que lo lanzó sin agacharse. El tridente vuelve a su mano y en el siguiente tick
# el encantamiento lo empuja hacia donde mira (sm.tgo), como la Propulsión pero sin agua ni lluvia.
# Con la espera (#tide_cd, si se pone más de 0) o con algo en la mano principal se lanza normal (vuela).
execute if score @s sm.tcd matches 1.. run return 0
execute if items entity @s weapon.mainhand * run return 0
item replace entity @s weapon.mainhand from entity @e[type=minecraft:trident,tag=sm.tnow,limit=1] contents
kill @e[type=minecraft:trident,tag=sm.tnow]
scoreboard players set @s sm.tgo 1
scoreboard players operation @s sm.tcd = #tide_cd sm.calc
