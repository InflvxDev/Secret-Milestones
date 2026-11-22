# Jugador nuevo o que volvió a entrar
execute as @a unless score @s sm.leave matches 0 run function secret_milestones:player/login

# Botones del panel de admin (van por /trigger, así no sale la confirmación de comandos)
execute as @a[scores={sm.admin=1..}] run function secret_milestones:admin/trigger
execute as @a[tag=sm.admin] run function secret_milestones:admin/session

# Hito 1: solo corre para quien minó o colocó stone en este tick
execute as @a[scores={sm.placed=1..}] run function secret_milestones:milestone/stone_1m/on_place
execute as @a[scores={sm.mined=1..}] run function secret_milestones:milestone/stone_1m/on_mine

# Los hitos se revisan una vez por segundo
scoreboard players add #t sm.calc 1
execute if score #t sm.calc matches 20.. run function secret_milestones:milestone/check_all
