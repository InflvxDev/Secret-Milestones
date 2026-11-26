# Interno: cada tick, para cada boomerang (@s), en su posición.
scoreboard players add @s sm.hage 1
data modify storage secret_milestones:tmp th set value {}
execute store result storage secret_milestones:tmp th.own int 1 run scoreboard players get @s sm.id
scoreboard players operation #own sm.calc = @s sm.id
# Por si algo falla (un chunk que se descargó...): a los 30 segundos vuelve solo
execute if score @s sm.hage matches 600.. run return run function secret_milestones:item/thorfinn/finish with storage secret_milestones:tmp th
execute if score @s sm.hbs matches 1 run return run function secret_milestones:item/thorfinn/out with storage secret_milestones:tmp th
function secret_milestones:item/thorfinn/back with storage secret_milestones:tmp th
