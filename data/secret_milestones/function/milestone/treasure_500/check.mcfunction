# Hito 1: pescar 500 tesoros. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/treasure_500/check_run with storage secret_milestones:tmp who
