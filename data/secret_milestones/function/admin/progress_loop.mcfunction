# Interno: agrega queue[0] y sigue (recursivo)
data modify storage secret_milestones:tmp row set from storage secret_milestones:tmp queue[0]
data modify storage secret_milestones:tmp row.m set from storage secret_milestones:tmp m.id
function secret_milestones:admin/progress_row with storage secret_milestones:tmp row
data remove storage secret_milestones:tmp queue[0]
execute if data storage secret_milestones:tmp queue[0] run function secret_milestones:admin/progress_loop
