# GENERADO por tools/generate.py: no editar a mano
# Interno: como un marker de la cadena, en su bloque. Corta si está maduro y replanta.
execute if block ~ ~ ~ minecraft:wheat[age=7] run return run function secret_milestones:item/thorfinn/crop {b:"wheat",s:"wheat_seeds"}
execute if block ~ ~ ~ minecraft:carrots[age=7] run return run function secret_milestones:item/thorfinn/crop {b:"carrots",s:"carrot"}
execute if block ~ ~ ~ minecraft:potatoes[age=7] run return run function secret_milestones:item/thorfinn/crop {b:"potatoes",s:"potato"}
execute if block ~ ~ ~ minecraft:beetroots[age=3] run return run function secret_milestones:item/thorfinn/crop {b:"beetroots",s:"beetroot_seeds"}
execute if block ~ ~ ~ minecraft:nether_wart[age=3] run return run function secret_milestones:item/thorfinn/crop {b:"nether_wart",s:"nether_wart"}
execute if block ~ ~ ~ minecraft:melon if block ~1 ~ ~ minecraft:attached_melon_stem[facing=west] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:melon if block ~-1 ~ ~ minecraft:attached_melon_stem[facing=east] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:melon if block ~ ~ ~1 minecraft:attached_melon_stem[facing=north] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:melon if block ~ ~ ~-1 minecraft:attached_melon_stem[facing=south] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_melon_stem[facing=west] positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:melon run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_melon_stem[facing=east] positioned ~1 ~ ~ if block ~ ~ ~ minecraft:melon run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_melon_stem[facing=north] positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:melon run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_melon_stem[facing=south] positioned ~ ~ ~1 if block ~ ~ ~ minecraft:melon run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:pumpkin if block ~1 ~ ~ minecraft:attached_pumpkin_stem[facing=west] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:pumpkin if block ~-1 ~ ~ minecraft:attached_pumpkin_stem[facing=east] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:pumpkin if block ~ ~ ~1 minecraft:attached_pumpkin_stem[facing=north] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:pumpkin if block ~ ~ ~-1 minecraft:attached_pumpkin_stem[facing=south] run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_pumpkin_stem[facing=west] positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:pumpkin run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_pumpkin_stem[facing=east] positioned ~1 ~ ~ if block ~ ~ ~ minecraft:pumpkin run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_pumpkin_stem[facing=north] positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:pumpkin run return run function secret_milestones:item/thorfinn/fruit
execute if block ~ ~ ~ minecraft:attached_pumpkin_stem[facing=south] positioned ~ ~ ~1 if block ~ ~ ~ minecraft:pumpkin run return run function secret_milestones:item/thorfinn/fruit
