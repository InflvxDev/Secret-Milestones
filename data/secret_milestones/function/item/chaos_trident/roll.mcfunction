# Interno: como el jugador que lanzó el tridente. El mismo sistema que la espada y el mazo, con su propia
# probabilidad en milésimas (sm.tchaos): empieza en #tchaos_base, cada impacto sin suerte suma #tchaos_step
# hasta #tchaos_max, y al salir vuelve al inicio.
execute unless score @s sm.tchaos matches 1.. run scoreboard players operation @s sm.tchaos = #tchaos_base sm.calc
execute store result score #r sm.calc run random value 0..999
execute if score #r sm.calc < @s sm.tchaos run return run function secret_milestones:item/chaos_trident/proc
scoreboard players operation @s sm.tchaos += #tchaos_step sm.calc
scoreboard players operation @s sm.tchaos < #tchaos_max sm.calc
