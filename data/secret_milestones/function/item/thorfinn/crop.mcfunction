# Interno: {b, s}. Corta el cultivo maduro b (con Fortuna V, como la azada) y lo replanta con
# una de sus semillas s. Lo que suelta se marca para que vuelva con el boomerang.
loot spawn ~ ~ ~ mine ~ ~ ~ minecraft:netherite_hoe[minecraft:enchantments={"minecraft:fortune":5}]
scoreboard players set #took sm.calc 0
$execute as @e[type=minecraft:item,distance=..1,tag=!sm.hl,nbt={Age:0s}] if items entity @s contents minecraft:$(s) run function secret_milestones:item/thorfinn/seed
$setblock ~ ~ ~ minecraft:$(b)[age=0]
function secret_milestones:item/thorfinn/cut_fx
