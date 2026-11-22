# Interno: {id}. Fila del panel: tipos de mob que lleva, sobre la meta de esta versión.
$execute store result score #c sm.calc run data get storage secret_milestones:bow p$(id)
execute store result storage secret_milestones:tmp row.c int 1 run scoreboard players get #c sm.calc
execute store result storage secret_milestones:tmp row.g int 1 run scoreboard players get #bow_goal sm.calc
function secret_milestones:milestone/bow_all/progress_text with storage secret_milestones:tmp row
