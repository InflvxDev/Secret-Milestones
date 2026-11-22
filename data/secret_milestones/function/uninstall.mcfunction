# Desinstalar: /function secret_milestones:uninstall y después quitar el datapack.
# No borra claimed, players, stone, zones, bow, debris* ni fishing: sin esos registros, al reinstalar se
# repetirían premios, se perdería el progreso y se vaciarían los cupos de los generadores.
scoreboard objectives remove sm.calc
scoreboard objectives remove sm.leave
scoreboard objectives remove sm.admin
scoreboard objectives remove sm.time
scoreboard objectives remove sm.id
scoreboard objectives remove sm.named
scoreboard objectives remove sm.mined
scoreboard objectives remove sm.placed
scoreboard objectives remove sm.valid
scoreboard objectives remove sm.bow
scoreboard objectives remove sm.dmined
scoreboard objectives remove sm.debris
scoreboard objectives remove sm.fish
scoreboard objectives remove sm.held
scoreboard objectives remove sm.radar
tag @a remove sm.admin
data remove storage secret_milestones:tmp who
data remove storage secret_milestones:tmp ui
data remove storage secret_milestones:tmp reg
data remove storage secret_milestones:tmp zone
data remove storage secret_milestones:tmp pos
data remove storage secret_milestones:tmp place
data remove storage secret_milestones:tmp queue
data remove storage secret_milestones:tmp row
data remove storage secret_milestones:tmp kill
data remove storage secret_milestones:tmp status
data remove storage secret_milestones:tmp sel
data remove storage secret_milestones:tmp m
data remove storage secret_milestones:tmp h
data remove storage secret_milestones:tmp b
data remove storage secret_milestones:tmp line
data remove storage secret_milestones:tmp at
data remove storage secret_milestones:tmp pl
data remove storage secret_milestones:tmp near
data remove storage secret_milestones:tmp marks
data remove storage secret_milestones:db milestones
tellraw @s {text:"Secret-Milestones desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
