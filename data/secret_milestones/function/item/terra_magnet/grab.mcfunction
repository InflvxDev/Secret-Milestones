# Interno: @s es un ítem recién caído. Lo lleva al jugador con sm.magnet y se puede recoger ya.
tp @s @p[tag=sm.magnet]
data modify entity @s PickupDelay set value 0s
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
