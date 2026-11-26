# Interno: @s se movió agachado en este tick (sm.crouch, en cm).
# Solo cuenta si aprieta agacharse y una tecla WASD: así no suman el agua, los pistones ni el hielo.
scoreboard players operation #d sm.calc = @s sm.crouch
scoreboard players set @s sm.crouch 0
execute unless function secret_milestones:milestone/movement/active run return 0
execute unless predicate secret_milestones:input/sneak_move run return 0
scoreboard players operation @s sm.mc += #d sm.calc
tag @s add sm.msave
