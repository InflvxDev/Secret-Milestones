# GENERADO por tools/generate.py: no editar a mano
# Interno: {id}. Fila del panel
$execute store result storage secret_milestones:tmp row.done int 1 run data get storage secret_milestones:harvest p$(id).done
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).wheat
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.wheat int 1 run scoreboard players get #v sm.calc
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).carrots
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.carrots int 1 run scoreboard players get #v sm.calc
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).potatoes
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.potatoes int 1 run scoreboard players get #v sm.calc
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).beetroots
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.beetroots int 1 run scoreboard players get #v sm.calc
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).nether_wart
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.nether_wart int 1 run scoreboard players get #v sm.calc
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).melon
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.melon int 1 run scoreboard players get #v sm.calc
$execute store result score #v sm.calc run data get storage secret_milestones:harvest p$(id).pumpkin
execute if score #v sm.calc matches ..-1 run scoreboard players set #v sm.calc 0
execute store result storage secret_milestones:tmp row.pumpkin int 1 run scoreboard players get #v sm.calc
function secret_milestones:gen/harvest_progress_text with storage secret_milestones:tmp row
