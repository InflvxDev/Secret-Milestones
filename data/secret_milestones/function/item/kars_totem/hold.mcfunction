# Interno: cada tick, para quien tiene el Kars Totem en la segunda mano.
# Regeneración I de 7 segundos, renovada cada 5: así cura cada 2,5 segundos, igual que la de una poción.
# (Renovarla cada segundo la haría curar más rápido.) Dura hasta 7 segundos más al guardarlo.
execute unless score @s sm.koff matches 1.. run effect give @s minecraft:regeneration 7 0 true
execute if score #t sm.calc matches 0 if score #t5 sm.calc matches 0 run effect give @s minecraft:regeneration 7 0 true
scoreboard players set @s sm.koff 2
