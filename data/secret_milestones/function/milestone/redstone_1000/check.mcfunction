# Hito 6: craftear 1000 de cada componente de redstone. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/redstone_1000/check_run with storage secret_milestones:tmp who
