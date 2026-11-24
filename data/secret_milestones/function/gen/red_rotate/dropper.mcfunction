# GENERADO por tools/generate.py: no editar a mano
execute if block ~ ~ ~ minecraft:dropper[facing=north,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=east,triggered=false]"}
execute if block ~ ~ ~ minecraft:dropper[facing=east,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=south,triggered=false]"}
execute if block ~ ~ ~ minecraft:dropper[facing=south,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=west,triggered=false]"}
execute if block ~ ~ ~ minecraft:dropper[facing=west,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=up,triggered=false]"}
execute if block ~ ~ ~ minecraft:dropper[facing=up,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=down,triggered=false]"}
execute if block ~ ~ ~ minecraft:dropper[facing=down,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=north,triggered=false]"}
execute if block ~ ~ ~ minecraft:dropper[facing=north,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=east,triggered=true]"}
execute if block ~ ~ ~ minecraft:dropper[facing=east,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=south,triggered=true]"}
execute if block ~ ~ ~ minecraft:dropper[facing=south,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=west,triggered=true]"}
execute if block ~ ~ ~ minecraft:dropper[facing=west,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=up,triggered=true]"}
execute if block ~ ~ ~ minecraft:dropper[facing=up,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=down,triggered=true]"}
execute if block ~ ~ ~ minecraft:dropper[facing=down,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dropper[facing=north,triggered=true]"}
return fail
