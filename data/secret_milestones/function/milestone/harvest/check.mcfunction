# Hito 14: cosechar cultivos maduros. @s ya llegó a todas las metas.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/harvest/check_run with storage secret_milestones:tmp who
