# Interno: {id}. Fila del panel: componentes listos y total crafteado.
$execute store result storage secret_milestones:tmp row.v int 1 run data get storage secret_milestones:redstone p$(id).done
$function secret_milestones:gen/red_sum {id:$(id)}
execute store result storage secret_milestones:tmp row.s int 1 run scoreboard players get #s sm.calc
execute store result storage secret_milestones:tmp row.g int 1 run scoreboard players get #red_goal sm.calc
execute store result storage secret_milestones:tmp row.t int 1 run scoreboard players get #red_total sm.calc
function secret_milestones:milestone/redstone_1000/progress_text with storage secret_milestones:tmp row
