# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/abyss_hook
title @s times 10 80 20
title @s subtitle {text:"Anzuelo del Abismo",color:"blue"}
title @s title {text:"¡Hito secreto!",color:"blue",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"blue",bold:true},{text:"Pescaste 500 tesoros. Recompensa: ",color:"gray"},{text:"Anzuelo del Abismo",color:"blue"},{text:". Con él pescas tesoros sin aguas abiertas.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
