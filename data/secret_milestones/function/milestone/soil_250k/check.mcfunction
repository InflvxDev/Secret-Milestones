# Hito 10: excavar 250.000 bloques blandos. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/soil_250k/check_run with storage secret_milestones:tmp who
