# Interno: como cada tridente nuevo (cualquiera, una sola vez). Si es el Españita Chaos Trident y quien lo lanzó
# (su "origin") NO estaba agachado, en vez de volar sale con Propulsión (item/chaos_trident/tide).
# Agachado se lanza normal (el que invoca los rayos).
tag @s add sm.tseen
execute unless items entity @s contents minecraft:trident[minecraft:custom_data~{secret_milestones:"chaos_trident"}] run return 0
tag @s add sm.tnow
execute on origin if entity @s[type=minecraft:player,gamemode=!creative,gamemode=!spectator] unless predicate secret_milestones:sneaking run function secret_milestones:item/chaos_trident/tide
tag @s remove sm.tnow
