# Interno: {own}. El boomerang vuelve al pecho del jugador (no a los ojos: así no se queda tapando la cámara),
# y lo cosechado viaja con él. Si el jugador se fue (desconectado, murió lejos u otra dimensión), termina ahí.
$execute unless entity @a[scores={sm.id=$(own)},distance=..96] run return run function secret_milestones:item/thorfinn/finish {own:$(own)}
# Lo atrapa en cuanto llega a 2 bloques del pecho
$execute at @a[scores={sm.id=$(own)},limit=1] positioned ~ ~1 ~ if entity @s[distance=..2] run return run function secret_milestones:item/thorfinn/finish {own:$(own)}
# Vuela 1,2 bloques por tick hacia el pecho
$execute at @a[scores={sm.id=$(own)},limit=1] positioned ~ ~1 ~ summon minecraft:marker run function secret_milestones:item/thorfinn/chest
execute facing entity @n[type=minecraft:marker,tag=sm.hc2] feet positioned ^ ^ ^1.2 rotated as @s run tp @s ~ ~ ~ ~45 ~
kill @e[type=minecraft:marker,tag=sm.hc2]
$tp @e[type=minecraft:item,tag=sm.hl,scores={sm.id=$(own)}] @s
