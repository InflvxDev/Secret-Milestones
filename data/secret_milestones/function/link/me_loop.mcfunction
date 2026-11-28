# Interno: la parte lq[0] y sigue (recursivo)
data modify storage secret_milestones:tmp lp set from storage secret_milestones:tmp lq[0]
execute store result score #lg sm.calc run data get storage secret_milestones:tmp lp.g
function secret_milestones:link/value
data modify storage statscraft:ext me append value {v:0,d:0b}
execute store result storage statscraft:ext me[-1].v int 1 run scoreboard players get #lv sm.calc
execute if score #lv sm.calc matches 1.. if score #lv sm.calc >= #lg sm.calc run data modify storage statscraft:ext me[-1].d set value 1b
data remove storage secret_milestones:tmp lq[0]
execute if data storage secret_milestones:tmp lq[0] run function secret_milestones:link/me_loop
