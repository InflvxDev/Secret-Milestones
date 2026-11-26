# Interno: @s es un marker nuevo de la cadena (ola siguiente). sm.hx: ya visitado, para no volver a pasar.
tag @s add sm.hx
tag @s add sm.hn
scoreboard players operation @s sm.id = #own sm.calc
scoreboard players operation @s sm.hg = #gen sm.calc
