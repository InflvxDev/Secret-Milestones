# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/dash_shadow
title @s times 10 80 20
title @s subtitle {text:"Dash Shadow",color:"dark_gray"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Recorriste 300 km agachado, 1000 km corriendo y saltaste 100.000 veces. Recompensa: ",color:"gray"},{text:"Dash Shadow",color:"dark_gray"},{text:". Doble espacio con WASD apretada: dash hacia esa dirección.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
