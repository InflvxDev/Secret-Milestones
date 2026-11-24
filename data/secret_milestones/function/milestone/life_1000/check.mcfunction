# Hito 7: sobrevivir 1000 días del juego. @s ya llegó a la meta.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/life_1000/check_run with storage secret_milestones:tmp who
