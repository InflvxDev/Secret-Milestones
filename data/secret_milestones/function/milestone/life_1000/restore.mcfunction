# Interno: {id}. Tiempo vivo de @s en ticks (0 si es nuevo).
$execute store result score @s sm.life run data get storage secret_milestones:life p$(id)
