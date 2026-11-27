# Interno: {id}. Fila del panel: comidas listas y total comido.
$execute store result storage secret_milestones:tmp row.v int 1 run data get storage secret_milestones:feast p$(id).done
$function secret_milestones:gen/feast_sum {id:$(id)}
execute store result storage secret_milestones:tmp row.s int 1 run scoreboard players get #s sm.calc
execute store result storage secret_milestones:tmp row.g int 1 run scoreboard players get #food_goal sm.calc
execute store result storage secret_milestones:tmp row.t int 1 run scoreboard players get #food_total sm.calc
function secret_milestones:milestone/feast_500/progress_text with storage secret_milestones:tmp row
