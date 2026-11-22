# Interno: {id}. Fila del panel: válidas, minadas, recolocadas y fuera de cupo.
$execute store result score #v sm.calc run data get storage secret_milestones:debris p$(id).valid
$execute store result score #m sm.calc run data get storage secret_milestones:debris p$(id).mined
$execute store result score #c sm.calc run data get storage secret_milestones:debris p$(id).placed
$execute store result score #r sm.calc run data get storage secret_milestones:debris p$(id).reused
scoreboard players operation #o sm.calc = #m sm.calc
scoreboard players operation #o sm.calc -= #v sm.calc
scoreboard players operation #o sm.calc -= #r sm.calc
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #v sm.calc
execute store result storage secret_milestones:tmp row.mined int 1 run scoreboard players get #m sm.calc
execute store result storage secret_milestones:tmp row.p int 1 run scoreboard players get #c sm.calc
execute store result storage secret_milestones:tmp row.r int 1 run scoreboard players get #r sm.calc
execute store result storage secret_milestones:tmp row.o int 1 run scoreboard players get #o sm.calc
function secret_milestones:milestone/debris_beacon/progress_text with storage secret_milestones:tmp row
