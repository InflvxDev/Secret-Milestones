# Interno: recompensa del advancement bow_kill. @s mató un mob con una flecha de arco.
scoreboard players set #hits sm.calc 0
data modify storage secret_milestones:tmp kill set value {}
function secret_milestones:gen/bow_hits
# Se revoca para detectar la siguiente muerte
advancement revoke @s only secret_milestones:bow_kill
# Más de uno a la vez no es una muerte real: es un /advancement grant @a everything
execute unless score #hits sm.calc matches 1 run return 0
execute if entity @s[gamemode=creative] run return 0
execute store result storage secret_milestones:tmp kill.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/bow_all/on_kill_run with storage secret_milestones:tmp kill
