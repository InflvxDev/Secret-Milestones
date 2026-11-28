# Interno: {u}
$execute if data storage secret_milestones:players list[{u:$(u)}] run data modify storage secret_milestones:tmp lr set from storage secret_milestones:players list[{u:$(u)}]
