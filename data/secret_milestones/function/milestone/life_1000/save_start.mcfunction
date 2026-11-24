# Interno: guarda el tiempo vivo de @s en storage (por UUID, sobrevive al cambio de nick)
data modify storage secret_milestones:tmp who set value {}
execute store result storage secret_milestones:tmp who.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/life_1000/save with storage secret_milestones:tmp who
