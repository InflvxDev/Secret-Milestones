# Interno: {id}. Cuántos cultivos tiene listos @s (0 si es nuevo).
$execute store result score @s sm.harv run data get storage secret_milestones:harvest p$(id).done
