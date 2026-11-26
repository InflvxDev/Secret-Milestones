# Interno: cada tick, para quien tiene la Españita Chaos Sword en la mano principal.
# Fuerza II: al instante al sacarla, y se renueva cada segundo. Dura hasta 3 segundos más al guardarla.
execute unless score @s sm.sheld matches 1.. run effect give @s minecraft:strength 3 1 true
execute if score #t sm.calc matches 0 run effect give @s minecraft:strength 3 1 true
scoreboard players set @s sm.sheld 2
