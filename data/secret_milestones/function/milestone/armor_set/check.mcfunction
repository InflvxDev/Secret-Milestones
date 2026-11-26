# Hito 13: conseguir las 4 piezas de armadura secretas. Se revisa cada segundo para todos.
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:milestone/armor_set/check_run with storage secret_milestones:tmp who
