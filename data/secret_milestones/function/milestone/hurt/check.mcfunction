# Hito 13: aguantar daño de todo tipo. @s ya llegó a las cinco metas.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/hurt/check_run with storage secret_milestones:tmp who
