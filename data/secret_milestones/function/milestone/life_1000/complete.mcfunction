# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/kars_totem
title @s times 10 80 20
title @s subtitle {text:"Kars Totem",color:"gold"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Sobreviviste 1000 días sin morir. Recompensa: ",color:"gray"},{text:"Kars Totem",color:"gold"},{text:". Vuelve cada vez que te salva, y en la segunda mano da Regeneración.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
