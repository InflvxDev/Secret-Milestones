# Interno: busca desde el bloque de los pies (el +0.2 es por slabs y soul sand)
scoreboard players set @s sm.radar 40
execute at @s positioned ~ ~0.2 ~ align xyz positioned ~0.5 ~0.5 ~0.5 if function secret_milestones:gen/radar run return 1
title @s actionbar {text:"Radar: no hay debris a 8 bloques",color:"gray"}
