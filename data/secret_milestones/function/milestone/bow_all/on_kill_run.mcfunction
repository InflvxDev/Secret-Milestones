# Interno: {id, m}. Anota el tipo: cada uno cuenta una sola vez.
$data modify storage secret_milestones:bow p$(id)."$(m)" set value 1b
$execute store result score @s sm.bow run data get storage secret_milestones:bow p$(id)
