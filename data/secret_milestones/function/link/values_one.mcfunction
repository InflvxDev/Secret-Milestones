# Interno: el jugador tmp lr {u, n, id} en la parte tmp lp
execute if data storage secret_milestones:tmp lr{n:"?"} run return 0
function secret_milestones:link/value
execute unless score #lv sm.calc matches 1.. run return 0
data modify storage statscraft:ext values append value {n:"",v:0,d:0b}
data modify storage statscraft:ext values[-1].n set from storage secret_milestones:tmp lr.n
execute store result storage statscraft:ext values[-1].v int 1 run scoreboard players get #lv sm.calc
execute if score #lv sm.calc >= #lg sm.calc run data modify storage statscraft:ext values[-1].d set value 1b
