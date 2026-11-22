# Interno: recompensa del advancement debris_place. @s colocó ancient debris.
# Anota la posición exacta, para todo el server, sin restarle progreso a nadie.
scoreboard players set #hits sm.calc 0
data modify storage secret_milestones:tmp at set value {}
function secret_milestones:gen/debris_hits
advancement revoke @s only secret_milestones:debris_place
# Una colocación da 1 franja por eje: otra cosa es un /advancement grant
execute unless score #hits sm.calc matches 3 run return 0

data modify storage secret_milestones:tmp pl set value {}
execute store result storage secret_milestones:tmp pl.id int 1 run scoreboard players get @s sm.id
data modify storage secret_milestones:tmp pl.d set from entity @s Dimension
scoreboard players set #found sm.calc 0
execute at @s run function secret_milestones:gen/debris_candidates with storage secret_milestones:tmp at
# Todos los candidatos ya estaban anotados (o quedó fuera de alcance): se volvió a poner
# en un hueco anotado, así que ya hay uno minado que no debe contar.
execute if score #found sm.calc matches 0 run function secret_milestones:milestone/debris_beacon/orphan
function secret_milestones:milestone/debris_beacon/on_place_run with storage secret_milestones:tmp pl
