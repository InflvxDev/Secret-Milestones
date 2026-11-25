# Desinstalar: /function secret_milestones:uninstall y después quitar el datapack.
# No borra claimed, players, stone, zones, bow, debris*, fishing, farlands, redstone, life, logs ni log_zones: sin esos registros, al reinstalar se
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
scoreboard objectives remove sm.far
scoreboard objectives remove sm.worn
scoreboard objectives remove sm.red
scoreboard objectives remove sm.wrench
scoreboard objectives remove sm.wcd
scoreboard objectives remove sm.life
scoreboard objectives remove sm.died
scoreboard objectives remove sm.afk
scoreboard objectives remove sm.yaw
scoreboard objectives remove sm.pitch
scoreboard objectives remove sm.khand
scoreboard objectives remove sm.koff
function secret_milestones:gen/red_uninstall
function secret_milestones:gen/log_uninstall
scoreboard objectives remove sm.lmined
scoreboard objectives remove sm.lkind
scoreboard objectives remove sm.log
kill @e[type=minecraft:marker,tag=sm.aim]
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
data remove storage secret_milestones:tmp be
data remove storage secret_milestones:db milestones
tellraw @s {text:"Secret-Milestones desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
