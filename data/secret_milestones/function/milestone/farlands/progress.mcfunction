# Interno: {id}. Fila del panel: lo más lejos que llegó.
$execute store result score #v sm.calc run data get storage secret_milestones:farlands p$(id)
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #v sm.calc
execute store result storage secret_milestones:tmp row.g int 1 run scoreboard players get #farlands sm.calc
function secret_milestones:milestone/farlands/progress_text with storage secret_milestones:tmp row
