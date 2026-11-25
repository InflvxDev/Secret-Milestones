# Interno: una vez por segundo, para quien está vivo en survival o aventura. Suma 20 ticks.
# Anti-AFK: solo suma si giró la cámara en los últimos #afk_limit segundos.
# Se mira la cámara y no la posición: el agua, los pistones o una vagoneta mueven al jugador, pero no la giran.
execute store result score #yaw sm.calc run data get entity @s Rotation[0] 100
execute store result score #pitch sm.calc run data get entity @s Rotation[1] 100
scoreboard players add @s sm.afk 1
execute unless score #yaw sm.calc = @s sm.yaw run scoreboard players set @s sm.afk 0
execute unless score #pitch sm.calc = @s sm.pitch run scoreboard players set @s sm.afk 0
scoreboard players operation @s sm.yaw = #yaw sm.calc
scoreboard players operation @s sm.pitch = #pitch sm.calc
execute if score @s sm.afk >= #afk_limit sm.calc run return 0
scoreboard players add @s sm.life 20
function secret_milestones:milestone/life_1000/save_start
