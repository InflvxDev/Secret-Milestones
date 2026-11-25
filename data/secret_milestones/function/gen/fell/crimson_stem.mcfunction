# GENERADO por tools/generate.py: no editar a mano
# Interno: en un crimson_stem del árbol. Lo marca y sigue por los que toca.
summon minecraft:marker ~ ~ ~ {Tags:["sm.fell"]}
scoreboard players add #fell sm.calc 1
execute if score #leafy sm.calc matches 0 if block ~1 ~ ~ #secret_milestones:fungus_cap run scoreboard players set #leafy sm.calc 1
execute if score #leafy sm.calc matches 0 if block ~-1 ~ ~ #secret_milestones:fungus_cap run scoreboard players set #leafy sm.calc 1
execute if score #leafy sm.calc matches 0 if block ~ ~1 ~ #secret_milestones:fungus_cap run scoreboard players set #leafy sm.calc 1
execute if score #leafy sm.calc matches 0 if block ~ ~-1 ~ #secret_milestones:fungus_cap run scoreboard players set #leafy sm.calc 1
execute if score #leafy sm.calc matches 0 if block ~ ~ ~1 #secret_milestones:fungus_cap run scoreboard players set #leafy sm.calc 1
execute if score #leafy sm.calc matches 0 if block ~ ~ ~-1 #secret_milestones:fungus_cap run scoreboard players set #leafy sm.calc 1
function secret_milestones:gen/fell/crimson_stem_around
