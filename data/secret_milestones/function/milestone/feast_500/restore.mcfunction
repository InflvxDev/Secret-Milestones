# Interno: {id}. Cuántas comidas tiene listas @s (0 si es nuevo).
$execute store result score @s sm.food run data get storage secret_milestones:feast p$(id).done
