# Interno: @s rompió un tronco con el Woodozer. Busca su marker: si ese tronco ya no está, tala desde ahí.
scoreboard players operation #me sm.calc = @s sm.id
scoreboard players operation #kind sm.calc = @s sm.lkind
execute as @e[type=minecraft:marker,tag=sm.aim] if score @s sm.id = #me sm.calc at @s unless block ~ ~ ~ #minecraft:logs run function secret_milestones:item/woodozer/fell_run
