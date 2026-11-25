# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/terra_magnet
title @s times 10 80 20
title @s subtitle {text:"Terra Magnet",color:"#7CBD3B"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Excavaste 250.000 bloques de tierra, arena, grava y otros blandos. Recompensa: ",color:"gray"},{text:"Terra Magnet",color:"#7CBD3B"},{text:". Lo que excavas con ella va directo a tu inventario.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
