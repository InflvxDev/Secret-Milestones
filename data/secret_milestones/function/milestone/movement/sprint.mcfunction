# Interno: @s corrió en este tick (sm.sprint, en cm). Solo cuenta apretando W.
scoreboard players operation #d sm.calc = @s sm.sprint
scoreboard players set @s sm.sprint 0
execute unless function secret_milestones:milestone/movement/active run return 0
execute unless predicate secret_milestones:input/forward run return 0
scoreboard players operation @s sm.ms += #d sm.calc
tag @s add sm.msave
