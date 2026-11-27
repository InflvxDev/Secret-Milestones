# Desinstalar: /function secret_milestones:uninstall y después quitar el datapack.
# No borra claimed, players, stone, zones, bow, debris*, fishing, farlands, redstone, life, logs, log_zones, deep, deep_zones, soils, soil_zones, moves, jump_zones, hurt, hurt_zones, harvest, fruit_marks ni feast: sin esos registros, al reinstalar se
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
function secret_milestones:gen/deep_uninstall
function secret_milestones:gen/soil_uninstall
scoreboard objectives remove sm.smined
scoreboard objectives remove sm.soil
scoreboard objectives remove sm.deep
scoreboard objectives remove sm.crown
scoreboard objectives remove sm.lmined
scoreboard objectives remove sm.lkind
scoreboard objectives remove sm.log
scoreboard objectives remove sm.crouch
scoreboard objectives remove sm.sprint
scoreboard objectives remove sm.jump
scoreboard objectives remove sm.mc
scoreboard objectives remove sm.ms
scoreboard objectives remove sm.mj
scoreboard objectives remove sm.dcd
scoreboard objectives remove sm.jprev
scoreboard objectives remove sm.dtap
scoreboard objectives remove sm.dair
scoreboard objectives remove sm.dgo
scoreboard objectives remove sm.dpb
scoreboard objectives remove sm.dgt
tag @a remove sm.msave
scoreboard objectives remove sm.hmel
scoreboard objectives remove sm.hpro
scoreboard objectives remove sm.hexp
scoreboard objectives remove sm.hfir
scoreboard objectives remove sm.hbos
scoreboard objectives remove sm.aworn
scoreboard objectives remove sm.sheld
scoreboard objectives remove sm.chaos
scoreboard objectives remove sm.mchaos
scoreboard objectives remove sm.tchaos
scoreboard objectives remove sm.tproc
scoreboard objectives remove sm.tgo
scoreboard objectives remove sm.tfall
scoreboard objectives remove sm.tcd
function secret_milestones:gen/feast_uninstall
scoreboard objectives remove sm.food
kill @e[type=minecraft:marker,tag=sm.mimp]
kill @e[type=minecraft:marker,tag=sm.mdir]
function secret_milestones:gen/harvest_uninstall
scoreboard objectives remove sm.harv
scoreboard objectives remove sm.hg
scoreboard objectives remove sm.hbs
scoreboard objectives remove sm.hage
scoreboard objectives remove sm.huse
kill @e[type=minecraft:item_display,tag=sm.hb]
kill @e[type=minecraft:marker,tag=sm.hx]
kill @e[type=minecraft:marker,tag=sm.ht]
tag @e[type=minecraft:item,tag=sm.hl] remove sm.hl
data remove storage secret_milestones:tmp th
data remove storage secret_milestones:tmp hv
data remove storage secret_milestones:tmp fr
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
data remove storage secret_milestones:tmp deep
data remove storage secret_milestones:db milestones
tellraw @s {text:"Secret-Milestones desinstalado. Ahora quita el datapack de la carpeta datapacks y usa /reload.",color:"green"}
