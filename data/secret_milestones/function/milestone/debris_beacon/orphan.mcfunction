# Interno: suma un "colocado que ya no está" en la zona del jugador
execute at @s align xyz summon minecraft:marker run function secret_milestones:milestone/debris_beacon/locate
function secret_milestones:milestone/debris_beacon/orphan_add with storage secret_milestones:tmp pl
