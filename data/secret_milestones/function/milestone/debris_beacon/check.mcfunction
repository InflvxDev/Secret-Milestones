# Hito 3: minar el debris de un beacon de netherita completo. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/debris_beacon/check_run with storage secret_milestones:tmp who
