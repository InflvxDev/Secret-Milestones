# Interno: lo que soltó este bloque vuelve con el boomerang de #own (se marca), y el efecto del corte.
execute as @e[type=minecraft:item,distance=..1,tag=!sm.hl,nbt={Age:0s}] run function secret_milestones:item/thorfinn/loot
particle minecraft:sweep_attack ~ ~0.3 ~ 0.2 0.1 0.2 0 1
playsound minecraft:block.crop.break block @a ~ ~ ~ 0.6 1.2
