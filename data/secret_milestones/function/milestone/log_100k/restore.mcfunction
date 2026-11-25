# Interno: {id}. Carga el progreso de @s (0 si es nuevo).
$execute store result score @s sm.log run data get storage secret_milestones:logs p$(id).valid
