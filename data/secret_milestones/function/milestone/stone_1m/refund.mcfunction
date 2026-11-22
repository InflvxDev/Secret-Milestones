# Interno: devuelve a cada jugador la stone que se le descontó por colocar
data modify storage secret_milestones:db refunded set value 1b
data modify storage secret_milestones:tmp queue set from storage secret_milestones:players list
execute if data storage secret_milestones:tmp queue[0] run function secret_milestones:milestone/stone_1m/refund_loop
