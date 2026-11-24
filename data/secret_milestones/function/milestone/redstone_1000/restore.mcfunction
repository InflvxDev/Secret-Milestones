# Interno: {id}. Cuántos componentes tiene listos @s (0 si es nuevo).
$execute store result score @s sm.red run data get storage secret_milestones:redstone p$(id).done
