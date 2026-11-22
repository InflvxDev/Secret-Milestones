# Desinstalar: /function secret_milestones:uninstall y después quitar el datapack.
# No borra claimed, players, stone ni zones: sin esos registros, al reinstalar se
# repetirían premios, se perdería el progreso y se vaciarían los cupos de los generadores.
scoreboard objectives remove sm.calc
scoreboard objectives remove sm.leave
scoreboard objectives remove sm.admin
scoreboard objectives remove sm.id
scoreboard objectives remove sm.named
scoreboard objectives remove sm.mined
scoreboard objectives remove sm.placed
scoreboard objectives remove sm.valid
tag @a remove sm.admin
data remove storage secret_milestones:tmp who
data remove storage secret_milestones:tmp ui
data remove storage secret_milestones:tmp reg
data remove storage secret_milestones:tmp zone
data remove storage secret_milestones:tmp pos
data remove storage secret_milestones:tmp place
data remove storage secret_milestones:tmp queue
data remove storage secret_milestones:tmp row
data remove storage secret_milestones:tmp status
tellraw @s {text:"Secret-Milestones desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
