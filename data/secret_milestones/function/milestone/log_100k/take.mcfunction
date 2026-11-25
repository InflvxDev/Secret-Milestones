# Interno: {k, i}. Pasa lo talado de un tipo de tronco a sm.lmined, y anota el tipo (para el Woodozer).
$scoreboard players operation @s sm.lmined += @s sm.l.$(k)
$scoreboard players reset @s sm.l.$(k)
$scoreboard players set @s sm.lkind $(i)
