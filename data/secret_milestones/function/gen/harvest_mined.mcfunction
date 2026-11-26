# GENERADO por tools/generate.py: no editar a mano
# Cada tick: lo cosechado de cada cultivo (solo cuenta si estaba maduro) y los frutos
execute as @a[scores={sm.hv.wheat=1..}] run function secret_milestones:milestone/harvest/crop {k:"wheat",p:"minecraft:wheat",min:1,g:10000}
execute as @a[scores={sm.hv.carrots=1..}] run function secret_milestones:milestone/harvest/crop {k:"carrots",p:"minecraft:carrot",min:2,g:10000}
execute as @a[scores={sm.hv.potatoes=1..}] run function secret_milestones:milestone/harvest/crop {k:"potatoes",p:"minecraft:potato",min:2,g:10000}
execute as @a[scores={sm.hv.beetroots=1..}] run function secret_milestones:milestone/harvest/crop {k:"beetroots",p:"minecraft:beetroot",min:1,g:10000}
execute as @a[scores={sm.hv.nether_wart=1..}] run function secret_milestones:milestone/harvest/crop {k:"nether_wart",p:"minecraft:nether_wart",min:2,g:10000}
execute as @a[scores={sm.hv.melon=1..}] run function secret_milestones:milestone/harvest/fruit {k:"melon",g:5000,s:"melon_stem",a:"attached_melon_stem"}
execute as @a[scores={sm.hv.pumpkin=1..}] run function secret_milestones:milestone/harvest/fruit {k:"pumpkin",g:5000,s:"pumpkin_stem",a:"attached_pumpkin_stem"}
