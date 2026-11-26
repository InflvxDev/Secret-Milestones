# Hito 11: agacharse, correr y saltar. @s ya llegó a las tres metas.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/movement/check_run with storage secret_milestones:tmp who
