# Interno: cada tick, para quien tiene el Debris Finder en la mano principal.
# Resistencia al fuego: al instante al sacarlo, y se renueva cada segundo.
execute unless score @s sm.held matches 1.. run effect give @s minecraft:fire_resistance 3 0 true
execute if score #t sm.calc matches 0 run effect give @s minecraft:fire_resistance 3 0 true
scoreboard players set @s sm.held 2
# Radar: agachado, una vez cada 2 segundos
execute if predicate secret_milestones:sneaking unless score @s sm.radar matches 1.. run function secret_milestones:item/debris_finder/scan
