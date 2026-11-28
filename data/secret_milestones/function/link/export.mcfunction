# API para StatsCraft (tag #statscraft:ext/hitos), @s = quien mira.
# Deja en storage statscraft:ext hitos los hitos con la estadística activa {num, id, need, atlas, sprite, parts}
# y got:1b en los que @s ya cobró. Nunca manda el nombre de la recompensa.
data modify storage statscraft:ext hitos set value []
data modify storage secret_milestones:tmp lq set from storage secret_milestones:db stats
data modify storage secret_milestones:tmp lu set value {}
data modify storage secret_milestones:tmp lu.u set from entity @s UUID
execute if data storage secret_milestones:tmp lq[0] run function secret_milestones:link/export_loop
