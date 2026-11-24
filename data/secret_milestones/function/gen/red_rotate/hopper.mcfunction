# GENERADO por tools/generate.py: no editar a mano
execute if block ~ ~ ~ minecraft:hopper[facing=down,enabled=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=north,enabled=false]"}
execute if block ~ ~ ~ minecraft:hopper[facing=north,enabled=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=east,enabled=false]"}
execute if block ~ ~ ~ minecraft:hopper[facing=east,enabled=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=south,enabled=false]"}
execute if block ~ ~ ~ minecraft:hopper[facing=south,enabled=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=west,enabled=false]"}
execute if block ~ ~ ~ minecraft:hopper[facing=west,enabled=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=down,enabled=false]"}
execute if block ~ ~ ~ minecraft:hopper[facing=down,enabled=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=north,enabled=true]"}
execute if block ~ ~ ~ minecraft:hopper[facing=north,enabled=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=east,enabled=true]"}
execute if block ~ ~ ~ minecraft:hopper[facing=east,enabled=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=south,enabled=true]"}
execute if block ~ ~ ~ minecraft:hopper[facing=south,enabled=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=west,enabled=true]"}
execute if block ~ ~ ~ minecraft:hopper[facing=west,enabled=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:hopper[facing=down,enabled=true]"}
return fail
