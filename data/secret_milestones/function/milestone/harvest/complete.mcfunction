# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/thorfinn_harvest
title @s times 10 80 20
title @s subtitle {text:"Thorfinn Harvest",color:"gold"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"\"No tengo enemigos.\" Cosechaste los campos de Vinland. Recompensa: ",color:"gray"},{text:"Thorfinn Harvest",color:"gold"},{text:". Clic derecho en un cultivo: la lanzas como un boomerang que cosecha todo el campo y replanta.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
