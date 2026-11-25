# Interno: {id}. Fila del panel: válidos, excavados, colocados y fuera de cupo.
$execute store result score #v sm.calc run data get storage secret_milestones:soils p$(id).valid
$execute store result score #m sm.calc run data get storage secret_milestones:soils p$(id).mined
$execute store result score #c sm.calc run data get storage secret_milestones:soils p$(id).placed
# fuera de cupo = excavado - válido
scoreboard players operation #o sm.calc = #m sm.calc
scoreboard players operation #o sm.calc -= #v sm.calc
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #v sm.calc
execute store result storage secret_milestones:tmp row.mined int 1 run scoreboard players get #m sm.calc
execute store result storage secret_milestones:tmp row.p int 1 run scoreboard players get #c sm.calc
execute store result storage secret_milestones:tmp row.o int 1 run scoreboard players get #o sm.calc
function secret_milestones:milestone/soil_250k/progress_text with storage secret_milestones:tmp row
