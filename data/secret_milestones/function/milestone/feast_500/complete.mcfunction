# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar hito" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/eternal_feast
title @s times 10 80 20
title @s subtitle {text:"Eternal Feast",color:"#FFA94D"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Comiste 500 de cada comida del juego. Recompensa: ",color:"gray"},{text:"Eternal Feast",color:"#FFA94D"},{text:". Un estofado que nunca se acaba: llena el hambre y la saturación y quita los efectos negativos, cada 15 segundos.",color:"gray"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
