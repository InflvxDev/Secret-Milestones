# Interno: lo llama el encantamiento secret_milestones:trident_chaos cuando el tridente lanzado le da a @s (la víctima).
# El que lo lanzó es su "attacker". Si sale el caos, le marca sm.tproc y el mismo encantamiento invoca el rayo
# justo después (como la Canalización, pero sin tormenta) y llama a item/chaos_trident/struck.
# Solo mobs (tags/entity_type/attackers.json): no jugadores, aldeanos (el rayo los vuelve brujas) ni mascotas.
execute unless entity @s[type=#secret_milestones:attackers,type=!minecraft:villager,type=!minecraft:wandering_trader] run return 0
execute if function secret_milestones:item/chaos_trident/pet run return 0
scoreboard players set #proc sm.calc 0
execute on attacker if entity @s[type=minecraft:player] run function secret_milestones:item/chaos_trident/roll
execute if score #proc sm.calc matches 0 run return 0
execute on attacker run scoreboard players set @s sm.tproc 1
execute at @s run particle minecraft:witch ~ ~1 ~ 0.4 0.6 0.4 0 30
