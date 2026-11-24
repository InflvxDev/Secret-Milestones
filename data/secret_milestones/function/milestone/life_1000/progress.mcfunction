# Interno: {id}. Fila del panel: días vivo desde la última muerte.
$execute store result score #v sm.calc run data get storage secret_milestones:life p$(id)
scoreboard players operation #v sm.calc /= #24000 sm.calc
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #v sm.calc
function secret_milestones:milestone/life_1000/progress_text with storage secret_milestones:tmp row
