# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/red_power
title @s times 10 80 20
title @s subtitle {text:"RedKeyStone",color:"red"}
title @s title {text:"¡Hito secreto!",color:"red",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"red",bold:true},{text:"Crafteaste 1000 de cada componente de redstone. Recompensa: ",color:"gray"},{text:"RedKeyStone",color:"red"},{text:". Clic derecho sobre un repetidor, comparador, pistón, observador, dispensador, dropper o tolva para girarlo (agachado si al tocarlo se abre o cambia).",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
