# Interno: cada tick, para quien lleva las Farlands Explorer puestas.
# Velocidad II: al instante al ponérselas, y se renueva cada segundo. Dura hasta 3 segundos más al quitarlas.
execute unless score @s sm.worn matches 1.. run effect give @s minecraft:speed 3 1 true
execute if score #t sm.calc matches 0 run effect give @s minecraft:speed 3 1 true
scoreboard players set @s sm.worn 2
