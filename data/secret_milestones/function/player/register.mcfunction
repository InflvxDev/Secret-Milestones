# Interno: guarda el nombre de @s para el panel (así salen también los desconectados).
# El nombre se saca de su cabeza, generada en un item_display temporal. Si el chunk
# todavía no cargó, falla y se reintenta cada segundo.
execute at @s run summon minecraft:item_display ~ ~ ~ {Tags:["sm.name"]}
execute at @s run loot replace entity @n[type=minecraft:item_display,tag=sm.name,distance=..1] contents loot secret_milestones:player_head
data modify storage secret_milestones:tmp reg set value {}
execute at @s run data modify storage secret_milestones:tmp reg.n set from entity @n[type=minecraft:item_display,tag=sm.name,distance=..1] item.components."minecraft:profile".name
data modify storage secret_milestones:tmp reg.u set from entity @s UUID
kill @e[type=minecraft:item_display,tag=sm.name]
execute unless data storage secret_milestones:tmp reg.n run return fail
function secret_milestones:player/register_run with storage secret_milestones:tmp reg
scoreboard players set @s sm.named 1
