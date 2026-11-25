# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/woodozer
title @s times 10 80 20
title @s subtitle {text:"Woodozer",color:"#8B5A2B"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Talaste 100.000 troncos. Recompensa: ",color:"gray"},{text:"Woodozer",color:"#8B5A2B"},{text:". Rompe un tronco y tala el árbol entero; agachado, solo ese tronco.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
