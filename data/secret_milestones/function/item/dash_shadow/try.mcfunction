# Interno: segundo espacio de @s. Dashea si puede.
scoreboard players set @s sm.dtap 0
execute if score @s sm.dcd matches 1.. run return 0
execute if score @s sm.dair matches 1 run return 0
# Con elytra el doble espacio la abre. Montado, nadando o en lava no hay dash.
execute if items entity @s armor.chest *[minecraft:glider] run return 0
execute on vehicle run return 0
execute at @s if block ~ ~ ~ minecraft:water run return 0
execute at @s if block ~ ~ ~ minecraft:lava run return 0
execute at @s if block ~ ~ ~ minecraft:bubble_column run return 0
# Dirección: #f adelante (+1) o atrás (-1), #s izquierda (+1) o derecha (-1)
scoreboard players set #f sm.calc 0
scoreboard players set #s sm.calc 0
execute if predicate secret_milestones:input/forward run scoreboard players add #f sm.calc 1
execute if predicate secret_milestones:input/backward run scoreboard players remove #f sm.calc 1
execute if predicate secret_milestones:input/left run scoreboard players add #s sm.calc 1
execute if predicate secret_milestones:input/right run scoreboard players remove #s sm.calc 1
execute if score #f sm.calc matches 0 if score #s sm.calc matches 0 run return 0
# Código de dirección: (f+1)*3 + s + 2, del 1 al 9 (el 5 es sin dirección). Lo usa enchantment/dash.json.
scoreboard players operation @s sm.dgo = #f sm.calc
scoreboard players add @s sm.dgo 1
scoreboard players operation @s sm.dgo *= #3 sm.calc
scoreboard players operation @s sm.dgo += #s sm.calc
scoreboard players add @s sm.dgo 2
# Tramo de la cámara (pitch de -90 a 90, de a 10 grados: 0 a 17), para que el dash vaya siempre en horizontal
execute store result score @s sm.dpb run data get entity @s Rotation[1]
scoreboard players add @s sm.dpb 90
scoreboard players operation @s sm.dpb /= #10 sm.calc
execute if score @s sm.dpb matches 18.. run scoreboard players set @s sm.dpb 17
execute if score @s sm.dpb matches ..-1 run scoreboard players set @s sm.dpb 0
# El encantamiento empuja y borra sm.dgo (item/dash_shadow/done). Si no llega a hacerlo, sm.dgt lo borra en tick.
scoreboard players set @s sm.dgt 3
scoreboard players operation @s sm.dcd = #dash_cd sm.calc
scoreboard players set @s sm.dair 1
execute at @s run playsound minecraft:entity.breeze.wind_burst player @a ~ ~ ~ 0.6 1.4
execute at @s run particle minecraft:cloud ~ ~0.3 ~ 0.3 0.1 0.3 0.02 12
