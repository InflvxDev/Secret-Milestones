# Interno: {id}. Carga el progreso de @s (0 si es nuevo), en décimas de vida.
$execute store result score @s sm.hmel run data get storage secret_milestones:hurt p$(id).mel
$execute store result score @s sm.hpro run data get storage secret_milestones:hurt p$(id).pro
$execute store result score @s sm.hexp run data get storage secret_milestones:hurt p$(id).exp
$execute store result score @s sm.hfir run data get storage secret_milestones:hurt p$(id).fir
$execute store result score @s sm.hbos run data get storage secret_milestones:hurt p$(id).bos
