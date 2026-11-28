# Interno: {id, u}
$execute unless data storage secret_milestones:link on.$(id) run return 0
data modify storage statscraft:ext hitos append from storage secret_milestones:tmp lq[0]
$execute if data storage secret_milestones:claimed $(id)[{u:$(u)}] run data modify storage statscraft:ext hitos[-1].got set value 1b
