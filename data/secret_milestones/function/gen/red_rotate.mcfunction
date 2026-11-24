# GENERADO por tools/generate.py: no editar a mano
# Interno: gira el bloque de esta posición. Falla si no se puede girar
execute if block ~ ~ ~ minecraft:repeater run return run function secret_milestones:gen/red_rotate/repeater
execute if block ~ ~ ~ minecraft:comparator run return run function secret_milestones:gen/red_rotate/comparator
execute if block ~ ~ ~ minecraft:piston run return run function secret_milestones:gen/red_rotate/piston
execute if block ~ ~ ~ minecraft:sticky_piston run return run function secret_milestones:gen/red_rotate/sticky_piston
execute if block ~ ~ ~ minecraft:observer run return run function secret_milestones:gen/red_rotate/observer
execute if block ~ ~ ~ minecraft:dispenser run return run function secret_milestones:gen/red_rotate/dispenser
execute if block ~ ~ ~ minecraft:dropper run return run function secret_milestones:gen/red_rotate/dropper
execute if block ~ ~ ~ minecraft:hopper run return run function secret_milestones:gen/red_rotate/hopper
return fail
