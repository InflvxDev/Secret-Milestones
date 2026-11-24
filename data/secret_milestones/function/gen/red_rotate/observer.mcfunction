# GENERADO por tools/generate.py: no editar a mano
execute if block ~ ~ ~ minecraft:observer[facing=north,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=east,powered=false]"}
execute if block ~ ~ ~ minecraft:observer[facing=east,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=south,powered=false]"}
execute if block ~ ~ ~ minecraft:observer[facing=south,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=west,powered=false]"}
execute if block ~ ~ ~ minecraft:observer[facing=west,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=up,powered=false]"}
execute if block ~ ~ ~ minecraft:observer[facing=up,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=down,powered=false]"}
execute if block ~ ~ ~ minecraft:observer[facing=down,powered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=north,powered=false]"}
execute if block ~ ~ ~ minecraft:observer[facing=north,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=east,powered=true]"}
execute if block ~ ~ ~ minecraft:observer[facing=east,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=south,powered=true]"}
execute if block ~ ~ ~ minecraft:observer[facing=south,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=west,powered=true]"}
execute if block ~ ~ ~ minecraft:observer[facing=west,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=up,powered=true]"}
execute if block ~ ~ ~ minecraft:observer[facing=up,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=down,powered=true]"}
execute if block ~ ~ ~ minecraft:observer[facing=down,powered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:observer[facing=north,powered=true]"}
return fail
