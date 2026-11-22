# Hito 2: matar todos los tipos de mob con arco. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/bow_all/check_run with storage secret_milestones:tmp who
