# Hito 16: comer 500 de cada comida. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/feast_500/check_run with storage secret_milestones:tmp who
