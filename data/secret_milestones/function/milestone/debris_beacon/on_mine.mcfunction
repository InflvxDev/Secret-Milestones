# Interno: @s minó ancient debris.
#   1. Si cerca falta debris de los anotados como colocados, es lo que acaba de minar: no cuenta.
#      El debris anotado que sigue en su sitio no le quita nada a quien mina al lado.
#   2. El resto cuenta hasta el cupo de la zona (respaldo contra pistones).
scoreboard players operation #mined sm.calc = @s sm.dmined
scoreboard players set @s sm.dmined 0
scoreboard players operation #left sm.calc = #mined sm.calc
data modify storage secret_milestones:tmp zone set value {}
execute store result storage secret_milestones:tmp zone.id int 1 run scoreboard players get @s sm.id
data modify storage secret_milestones:tmp pos set from entity @s Pos
data modify storage secret_milestones:tmp zone.d set from entity @s Dimension
execute store result score #px sm.calc run data get storage secret_milestones:tmp pos[0] 0.0625
execute store result score #py sm.calc run data get storage secret_milestones:tmp pos[1] 0.0625
execute store result score #pz sm.calc run data get storage secret_milestones:tmp pos[2] 0.0625
execute store result storage secret_milestones:tmp zone.x int 1 run scoreboard players get #px sm.calc
execute store result storage secret_milestones:tmp zone.y int 1 run scoreboard players get #py sm.calc
execute store result storage secret_milestones:tmp zone.z int 1 run scoreboard players get #pz sm.calc
function secret_milestones:gen/debris_around
function secret_milestones:milestone/debris_beacon/on_mine_run with storage secret_milestones:tmp zone
