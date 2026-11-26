# Interno: cada tick, para quien lleva la Aegis Heart puesta.
# Resistencia II: al instante al ponérsela, y se renueva cada segundo. Dura hasta 3 segundos más al quitársela.
execute unless score @s sm.aworn matches 1.. run effect give @s minecraft:resistance 3 1 true
execute if score #t sm.calc matches 0 run effect give @s minecraft:resistance 3 1 true
scoreboard players set @s sm.aworn 2
# Inmune al efecto Wither (del Wither y del wither skeleton): se quita al instante, como la Oscuridad con la DeepMine Crown.
effect clear @s minecraft:wither
