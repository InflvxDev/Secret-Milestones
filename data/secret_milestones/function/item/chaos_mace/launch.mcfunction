# Interno: como cada mob cercano, en su posición. Lo lanza hacia arriba y hacia afuera desde el golpe (marker sm.mimp).
# La dirección sale de un marker que se corre 0,6 bloques mirando lejos del golpe, en horizontal: eso es la fuerza
# hacia afuera. La fuerza hacia arriba es #mchaos_lift (en milésimas, en load).
# Pasado ±2.147.000 bloques (Farlands) las posiciones en milésimas no entran en un score: ahí solo sale hacia arriba.
# A los jugadores no se les puede cambiar el Motion, por eso solo mobs (tags/entity_type/attackers.json, sin jefes).
summon minecraft:marker ~ ~ ~ {Tags:["sm.mdir"]}
execute facing entity @e[type=minecraft:marker,tag=sm.mimp,limit=1] feet rotated ~180 0 run tp @e[type=minecraft:marker,tag=sm.mdir,limit=1] ^ ^ ^0.6
execute store result score #mx sm.calc run data get entity @s Pos[0] 1000
execute store result score #mz sm.calc run data get entity @s Pos[2] 1000
execute store result score #dx sm.calc run data get entity @e[type=minecraft:marker,tag=sm.mdir,limit=1] Pos[0] 1000
execute store result score #dz sm.calc run data get entity @e[type=minecraft:marker,tag=sm.mdir,limit=1] Pos[2] 1000
kill @e[type=minecraft:marker,tag=sm.mdir]
scoreboard players operation #dx sm.calc -= #mx sm.calc
scoreboard players operation #dz sm.calc -= #mz sm.calc
execute store result entity @s Motion[0] double 0.001 run scoreboard players get #dx sm.calc
execute store result entity @s Motion[2] double 0.001 run scoreboard players get #dz sm.calc
execute store result entity @s Motion[1] double 0.001 run scoreboard players get #mchaos_lift sm.calc
