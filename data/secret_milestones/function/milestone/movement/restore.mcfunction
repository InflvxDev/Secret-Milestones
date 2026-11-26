# Interno: {id}. Carga el progreso de @s (0 si es nuevo).
$execute store result score @s sm.mc run data get storage secret_milestones:moves p$(id).c
$execute store result score @s sm.ms run data get storage secret_milestones:moves p$(id).s
$execute store result score @s sm.mj run data get storage secret_milestones:moves p$(id).j
