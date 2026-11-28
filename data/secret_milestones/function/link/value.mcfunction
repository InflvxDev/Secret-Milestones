# Interno: cuánto lleva el jugador tmp lr {u, id} en la parte tmp lp {s, k, fn} -> #lv sm.calc
data modify storage secret_milestones:tmp lr.s set from storage secret_milestones:tmp lp.s
data modify storage secret_milestones:tmp lr.k set from storage secret_milestones:tmp lp.k
data modify storage secret_milestones:tmp lr.fn set from storage secret_milestones:tmp lp.fn
scoreboard players set #lv sm.calc 0
function secret_milestones:link/value_run with storage secret_milestones:tmp lr
# Los frutos colocados pueden dejar la cosecha en negativo
execute if score #lv sm.calc matches ..-1 run scoreboard players set #lv sm.calc 0
