# Interno: cada tick, para quien lleva la DeepMine Crown puesta.
# Visión nocturna de 13 s renovada cada segundo: nunca baja de 10 s, así no parpadea.
# Al instante al ponérsela, y dura hasta 13 segundos más al quitársela.
execute unless score @s sm.crown matches 1.. run effect give @s minecraft:night_vision 13 0 true
execute if score #t sm.calc matches 0 run effect give @s minecraft:night_vision 13 0 true
# Inmune a la Oscuridad (Warden y sculk shrieker)
effect clear @s minecraft:darkness
scoreboard players set @s sm.crown 2
