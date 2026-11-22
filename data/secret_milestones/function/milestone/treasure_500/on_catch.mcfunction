# Interno: recompensa del advancement treasure_catch. @s pescó un tesoro en aguas abiertas.
# En agua cerrada no cuenta: si no, con un Anzuelo prestado el hito se haría en una farm.
scoreboard players set #hits sm.calc 0
execute if entity @s[advancements={secret_milestones:treasure_catch={plain=true}}] run scoreboard players add #hits sm.calc 1
execute if entity @s[advancements={secret_milestones:treasure_catch={rod=true}}] run scoreboard players add #hits sm.calc 1
# Se revoca para detectar el siguiente tesoro
advancement revoke @s only secret_milestones:treasure_catch
# Cada pesca da un solo ítem: los dos a la vez es un /advancement grant @a everything
execute unless score #hits sm.calc matches 1 run return 0
execute if entity @s[gamemode=creative] run return 0
data modify storage secret_milestones:tmp who set value {}
execute store result storage secret_milestones:tmp who.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/treasure_500/on_catch_run with storage secret_milestones:tmp who
