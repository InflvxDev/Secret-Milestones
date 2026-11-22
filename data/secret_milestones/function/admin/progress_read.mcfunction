# Interno: {id}. Completa la fila: v = válido, m = minado, p = colocado, o = fuera de cupo.
$execute store result score #v sm.calc run data get storage secret_milestones:stone p$(id).valid
$execute store result score #m sm.calc run data get storage secret_milestones:stone p$(id).mined
$execute store result score #p sm.calc run data get storage secret_milestones:stone p$(id).placed
# válido = minado - fuera de cupo
scoreboard players operation #o sm.calc = #m sm.calc
scoreboard players operation #o sm.calc -= #v sm.calc
execute store result storage secret_milestones:tmp row.v int 1 run scoreboard players get #v sm.calc
execute store result storage secret_milestones:tmp row.m int 1 run scoreboard players get #m sm.calc
execute store result storage secret_milestones:tmp row.p int 1 run scoreboard players get #p sm.calc
execute store result storage secret_milestones:tmp row.o int 1 run scoreboard players get #o sm.calc
