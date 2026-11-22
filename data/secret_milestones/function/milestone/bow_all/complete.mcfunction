# Interno: recompensa y aviso. Solo lo ve @s, para no revelar el secreto.
# También lo usa "Probar arco" del panel, por eso aquí no se marca como cobrado.
function secret_milestones:reward/chaos_bow
title @s times 10 80 20
title @s subtitle {text:"Españita Chaos Bow",color:"dark_purple"}
title @s title {text:"¡Hito secreto!",color:"gold",bold:true}
tellraw @s [{text:""},{text:"¡Hito secreto descubierto! ",color:"gold",bold:true},{text:"Cazaste con arco a todo tipo de mobs. Recompensa: ",color:"gray"},{text:"Españita Chaos Bow",color:"dark_purple"}]
execute at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.4 0.8 0.4 0.4 120 force @s
