# Hito 7: minar 1.000.000 de stone. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/stone_1m/check_run with storage secret_milestones:tmp who
