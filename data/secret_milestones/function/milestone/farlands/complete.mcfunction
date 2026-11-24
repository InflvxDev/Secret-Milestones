# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/farlands_explorer
title @s times 10 80 20
title @s subtitle {text:"Farlands Explorer",color:"aqua"}
title @s title {text:"¡Hito secreto!",color:"aqua",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"aqua",bold:true},{text:"Llegaste al borde del mundo. Recompensa: ",color:"gray"},{text:"Farlands Explorer",color:"aqua"},{text:". Puestas te dan Velocidad II.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
