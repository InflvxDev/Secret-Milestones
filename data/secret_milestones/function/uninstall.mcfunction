# Desinstalar: /function secret_milestones:uninstall y después quitar el datapack.
# No borra secret_milestones:claimed: las estadísticas siguen en el mundo, y sin ese
# registro todos volverían a cobrar al reinstalar.
scoreboard objectives remove sm.calc
scoreboard objectives remove sm.leave
scoreboard objectives remove sm.admin
tag @a remove sm.admin
data remove storage secret_milestones:tmp who
data remove storage secret_milestones:tmp ui
data remove storage secret_milestones:tmp status
tellraw @s {text:"Secret-Milestones desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
