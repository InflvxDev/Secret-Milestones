# Interno: @s acaba de entrar (o se recargó el datapack)
scoreboard players set @s sm.leave 0
# El permiso del panel dura hasta salir: hay que volver a abrir /function secret_milestones:menu
tag @s remove sm.admin
scoreboard players reset @s sm.admin
# El progreso vive en storage por UUID: los scores van por nombre y se perderían al cambiar de nick
data modify storage secret_milestones:tmp who set value {}
data modify storage secret_milestones:tmp who.u set from entity @s UUID
function secret_milestones:player/identify with storage secret_milestones:tmp who
scoreboard players set @s sm.named 0
function secret_milestones:player/register
