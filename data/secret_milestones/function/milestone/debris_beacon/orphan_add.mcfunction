# Interno: {d, kx, ky, kz}
$execute store result score #n sm.calc run data get storage secret_milestones:debris_orphans "$(d)"."$(kx),$(ky),$(kz)"
scoreboard players add #n sm.calc 1
$execute store result storage secret_milestones:debris_orphans "$(d)"."$(kx),$(ky),$(kz)" int 1 run scoreboard players get #n sm.calc
