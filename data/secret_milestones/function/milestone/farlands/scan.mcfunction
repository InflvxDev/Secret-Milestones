# Interno: una vez por segundo. Guarda lo más lejos que llegó @s del centro, en X o Z (en bloques).
execute store result score #x sm.calc run data get entity @s Pos[0]
execute if score #x sm.calc matches ..-1 store result score #x sm.calc run data get entity @s Pos[0] -1
execute store result score #z sm.calc run data get entity @s Pos[2]
execute if score #z sm.calc matches ..-1 store result score #z sm.calc run data get entity @s Pos[2] -1
scoreboard players operation #x sm.calc > #z sm.calc
execute if score #x sm.calc <= @s sm.far run return 0
scoreboard players operation @s sm.far = #x sm.calc
data modify storage secret_milestones:tmp who set value {}
execute store result storage secret_milestones:tmp who.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/farlands/save with storage secret_milestones:tmp who
