# Interno: {d, kx, ky, kz}. Gasta lo menor entre #left y los que hay (#n)
scoreboard players operation #take sm.calc = #left sm.calc
scoreboard players operation #take sm.calc < #n sm.calc
scoreboard players operation #left sm.calc -= #take sm.calc
scoreboard players operation #n sm.calc -= #take sm.calc
$execute store result storage secret_milestones:debris_orphans "$(d)"."$(kx),$(ky),$(kz)" int 1 run scoreboard players get #n sm.calc
