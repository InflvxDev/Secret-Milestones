# Interno: {u}. Le da a @s su id y carga su progreso.
$execute unless data storage secret_milestones:players list[{u:$(u)}] run function secret_milestones:player/create with storage secret_milestones:tmp who
$execute store result score @s sm.id run data get storage secret_milestones:players list[{u:$(u)}].id
$data modify storage secret_milestones:tmp who.id set from storage secret_milestones:players list[{u:$(u)}].id
function secret_milestones:milestone/stone_1m/restore with storage secret_milestones:tmp who
function secret_milestones:milestone/bow_all/restore with storage secret_milestones:tmp who
function secret_milestones:milestone/debris_beacon/restore with storage secret_milestones:tmp who
function secret_milestones:milestone/treasure_500/restore with storage secret_milestones:tmp who
