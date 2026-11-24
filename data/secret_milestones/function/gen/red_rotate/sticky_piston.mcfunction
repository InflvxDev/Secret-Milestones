# GENERADO por tools/generate.py: no editar a mano
execute if block ~ ~ ~ minecraft:sticky_piston[facing=north,extended=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:sticky_piston[facing=east,extended=false]"}
execute if block ~ ~ ~ minecraft:sticky_piston[facing=east,extended=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:sticky_piston[facing=south,extended=false]"}
execute if block ~ ~ ~ minecraft:sticky_piston[facing=south,extended=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:sticky_piston[facing=west,extended=false]"}
execute if block ~ ~ ~ minecraft:sticky_piston[facing=west,extended=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:sticky_piston[facing=up,extended=false]"}
execute if block ~ ~ ~ minecraft:sticky_piston[facing=up,extended=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:sticky_piston[facing=down,extended=false]"}
execute if block ~ ~ ~ minecraft:sticky_piston[facing=down,extended=false] run return run function secret_milestones:item/red_power/set {b:"minecraft:sticky_piston[facing=north,extended=false]"}
return fail
