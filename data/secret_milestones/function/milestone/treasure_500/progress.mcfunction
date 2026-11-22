# Interno: {id}. Fila del panel.
$execute store result score #v sm.calc run data get storage secret_milestones:fishing p$(id).valid
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #v sm.calc
function secret_milestones:milestone/treasure_500/progress_text with storage secret_milestones:tmp row
