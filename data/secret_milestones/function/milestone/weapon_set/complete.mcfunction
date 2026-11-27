# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/chaos_trident
title @s times 10 80 20
title @s subtitle {text:"Españita Chaos Trident",color:"#4D8CFF"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Conseguiste las 3 armas secretas. Recompensa: ",color:"gray"},{text:"Españita Chaos Trident",color:"#4D8CFF"},{text:". Lanzado, a veces desata el caos y le cae un rayo a lo que golpea, aunque no haya tormenta. Agachado al lanzarlo, te lleva con él.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
