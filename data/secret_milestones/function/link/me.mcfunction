# API para StatsCraft (tag #statscraft:ext/me). Entrada: storage statscraft:ext req {num, u}.
# Deja en statscraft:ext me [{v, d}], uno por parte del hito num (en orden), con lo que lleva el jugador u.
data modify storage statscraft:ext me set value []
data modify storage secret_milestones:tmp lk set value {p:0}
data modify storage secret_milestones:tmp lk.num set from storage statscraft:ext req.num
function secret_milestones:link/find with storage secret_milestones:tmp lk
execute unless data storage secret_milestones:tmp lm run return 0
# Sin registro todavía: el id 0 no tiene progreso en ningún lado
data modify storage secret_milestones:tmp lr set value {id:0,n:"?"}
data modify storage secret_milestones:tmp lr.u set from storage statscraft:ext req.u
function secret_milestones:link/me_who with storage secret_milestones:tmp lr
data modify storage secret_milestones:tmp lq set from storage secret_milestones:tmp lm.parts
execute if data storage secret_milestones:tmp lq[0] run function secret_milestones:link/me_loop
