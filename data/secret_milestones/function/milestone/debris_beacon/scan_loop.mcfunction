# Interno: revisa marks[0] y sigue (recursivo)
data modify storage secret_milestones:tmp near merge from storage secret_milestones:tmp marks[0]
function secret_milestones:milestone/debris_beacon/scan_one with storage secret_milestones:tmp near
data remove storage secret_milestones:tmp marks[0]
execute if score #left sm.calc matches 1.. if data storage secret_milestones:tmp marks[0] run function secret_milestones:milestone/debris_beacon/scan_loop
