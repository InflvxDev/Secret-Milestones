# Hito 8: talar 100.000 troncos. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/log_100k/check_run with storage secret_milestones:tmp who
