# GENERADO por tools/generate.py: no editar a mano
execute if block ~ ~ ~ minecraft:comparator[facing=north,mode=compare,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=east,mode=compare,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=east,mode=compare,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=south,mode=compare,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=south,mode=compare,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=west,mode=compare,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=west,mode=compare,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=north,mode=compare,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=north,mode=compare,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=east,mode=compare,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=east,mode=compare,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=south,mode=compare,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=south,mode=compare,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=west,mode=compare,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=west,mode=compare,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=north,mode=compare,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=north,mode=subtract,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=east,mode=subtract,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=east,mode=subtract,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=south,mode=subtract,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=south,mode=subtract,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=west,mode=subtract,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=west,mode=subtract,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=north,mode=subtract,powered=false]"}
execute if block ~ ~ ~ minecraft:comparator[facing=north,mode=subtract,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=east,mode=subtract,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=east,mode=subtract,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=south,mode=subtract,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=south,mode=subtract,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=west,mode=subtract,powered=true]"}
execute if block ~ ~ ~ minecraft:comparator[facing=west,mode=subtract,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:comparator[facing=north,mode=subtract,powered=true]"}
return fail
