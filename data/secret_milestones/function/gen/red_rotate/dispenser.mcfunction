# GENERADO por tools/generate.py: no editar a mano
execute if block ~ ~ ~ minecraft:dispenser[facing=north,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=east,triggered=false]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=east,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=south,triggered=false]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=south,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=west,triggered=false]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=west,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=up,triggered=false]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=up,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=down,triggered=false]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=down,triggered=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=north,triggered=false]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=north,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=east,triggered=true]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=east,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=south,triggered=true]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=south,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=west,triggered=true]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=west,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=up,triggered=true]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=up,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=down,triggered=true]"}
execute if block ~ ~ ~ minecraft:dispenser[facing=down,triggered=true] run return run function secret_milestones:item/red_power/set {b:"minecraft:dispenser[facing=north,triggered=true]"}
return fail
