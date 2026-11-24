# Hito 5: llegar al borde del mundo (las Farlands). @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/farlands/check_run with storage secret_milestones:tmp who
