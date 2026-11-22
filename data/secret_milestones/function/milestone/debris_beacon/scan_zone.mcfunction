# Interno: {d, kx, ky, kz}
$execute store result score #n sm.calc run data get storage secret_milestones:debris_orphans "$(d)"."$(kx),$(ky),$(kz)"
execute if score #n sm.calc matches 1.. run function secret_milestones:milestone/debris_beacon/orphan_take with storage secret_milestones:tmp near
data remove storage secret_milestones:tmp marks
$data modify storage secret_milestones:tmp marks set from storage secret_milestones:debris_marks "$(d)"."$(kx),$(ky),$(kz)"
execute if score #left sm.calc matches 1.. if data storage secret_milestones:tmp marks[0] run function secret_milestones:milestone/debris_beacon/scan_loop
