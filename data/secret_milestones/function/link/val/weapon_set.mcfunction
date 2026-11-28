# Interno: tmp lr {u, id}. Cuántos de sus hitos cobró (lo cuenta la fila del panel en #n)
data modify storage secret_milestones:tmp row set from storage secret_milestones:tmp lr
function secret_milestones:milestone/weapon_set/progress with storage secret_milestones:tmp row
scoreboard players operation #lv sm.calc = #n sm.calc
