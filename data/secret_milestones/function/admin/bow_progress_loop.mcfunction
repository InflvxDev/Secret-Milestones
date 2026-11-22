# Interno: agrega queue[0] y sigue (recursivo)
data modify storage secret_milestones:tmp row set from storage secret_milestones:tmp queue[0]
execute store result storage secret_milestones:tmp row.g int 1 run scoreboard players get #bow_goal sm.calc
function secret_milestones:admin/bow_progress_read with storage secret_milestones:tmp row
function secret_milestones:admin/bow_progress_row with storage secret_milestones:tmp row
data remove storage secret_milestones:tmp queue[0]
execute if data storage secret_milestones:tmp queue[0] run function secret_milestones:admin/bow_progress_loop
