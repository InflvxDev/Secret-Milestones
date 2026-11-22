# Interno: @s acaba de entrar (o se recargó el datapack)
scoreboard players set @s sm.leave 0
# El permiso del panel dura hasta salir: hay que volver a abrir /function secret_milestones:menu
tag @s remove sm.admin
scoreboard players reset @s sm.admin
