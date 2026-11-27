# Interno: como el jugador que pegó. El mismo sistema que la espada (item/chaos_sword/roll), con su propia
# probabilidad en milésimas (sm.mchaos): empieza en #mchaos_base, cada golpe pesado sin suerte suma
# #mchaos_step hasta #mchaos_max, y al salir vuelve al inicio.
execute unless score @s sm.mchaos matches 1.. run scoreboard players operation @s sm.mchaos = #mchaos_base sm.calc
execute store result score #r sm.calc run random value 0..999
execute if score #r sm.calc < @s sm.mchaos run return run function secret_milestones:item/chaos_mace/proc
scoreboard players operation @s sm.mchaos += #mchaos_step sm.calc
scoreboard players operation @s sm.mchaos < #mchaos_max sm.calc
