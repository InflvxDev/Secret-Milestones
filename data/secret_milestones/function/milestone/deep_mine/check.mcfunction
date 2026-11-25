# Hito 9: minar en las cuevas profundas. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/deep_mine/check_run with storage secret_milestones:tmp who
