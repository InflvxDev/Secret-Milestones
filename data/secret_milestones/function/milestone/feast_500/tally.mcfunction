# Interno: una vez por segundo, para cada jugador. Pasa lo comido a su progreso.
execute if entity @s[gamemode=creative] run return run function secret_milestones:gen/feast_discard
data modify storage secret_milestones:tmp who set value {}
execute store result storage secret_milestones:tmp who.id int 1 run scoreboard players get @s sm.id
function secret_milestones:gen/feast_tally with storage secret_milestones:tmp who
