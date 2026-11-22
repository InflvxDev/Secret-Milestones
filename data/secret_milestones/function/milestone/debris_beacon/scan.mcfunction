# Interno: {x, y, z} zona vecina. Descuenta de #left los colocados que ya no están.
data modify storage secret_milestones:tmp near set value {}
data modify storage secret_milestones:tmp near.d set from storage secret_milestones:tmp zone.d
$scoreboard players set #x sm.calc $(x)
$scoreboard players set #y sm.calc $(y)
$scoreboard players set #z sm.calc $(z)
execute store result storage secret_milestones:tmp near.kx int 1 run scoreboard players operation #x sm.calc += #px sm.calc
execute store result storage secret_milestones:tmp near.ky int 1 run scoreboard players operation #y sm.calc += #py sm.calc
execute store result storage secret_milestones:tmp near.kz int 1 run scoreboard players operation #z sm.calc += #pz sm.calc
function secret_milestones:milestone/debris_beacon/scan_zone with storage secret_milestones:tmp near
