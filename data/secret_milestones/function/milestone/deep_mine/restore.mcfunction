# Interno: {id}. Cuántos bloques tiene listos @s (0 si es nuevo).
$execute store result score @s sm.deep run data get storage secret_milestones:deep p$(id).done
