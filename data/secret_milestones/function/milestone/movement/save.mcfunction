# Interno: una vez por segundo, para quien sumó algo. Guarda el progreso de @s en storage
# (por UUID, sobrevive al cambio de nick). Solo se pierde lo del último segundo si sale justo ahí.
tag @s remove sm.msave
data modify storage secret_milestones:tmp who set value {}
execute store result storage secret_milestones:tmp who.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/movement/save_run with storage secret_milestones:tmp who
