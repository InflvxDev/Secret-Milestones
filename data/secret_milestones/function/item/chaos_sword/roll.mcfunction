# Interno: como el jugador que pegó. Probabilidad acumulable, en milésimas (sm.chaos):
# empieza en #chaos_base, cada golpe sin suerte suma #chaos_step hasta #chaos_max, y al salir vuelve al inicio.
execute unless score @s sm.chaos matches 1.. run scoreboard players operation @s sm.chaos = #chaos_base sm.calc
execute store result score #r sm.calc run random value 0..999
execute if score #r sm.calc < @s sm.chaos run return run function secret_milestones:item/chaos_sword/proc
scoreboard players operation @s sm.chaos += #chaos_step sm.calc
scoreboard players operation @s sm.chaos < #chaos_max sm.calc
