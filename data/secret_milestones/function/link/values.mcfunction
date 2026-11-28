# API para StatsCraft (tag #statscraft:ext/values). Entrada: storage statscraft:ext req {num, p}.
# Deja en statscraft:ext values [{n, v, d}] de todos los jugadores (también los desconectados) que llevan
# algo en la parte p del hito num: n nombre, v cuánto lleva, d 1b si llegó a la meta. La meta no se manda.
data modify storage statscraft:ext values set value []
function secret_milestones:link/find with storage statscraft:ext req
execute unless data storage secret_milestones:tmp lp run return 0
execute store result score #lg sm.calc run data get storage secret_milestones:tmp lp.g
data modify storage secret_milestones:tmp lq set from storage secret_milestones:players list
execute if data storage secret_milestones:tmp lq[0] run function secret_milestones:link/values_loop
