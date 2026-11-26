# Interno: {d, x, y, z, s, a}. El fruto roto en x y z: cuenta si no era colocado y su tallo está al lado.
# Si era colocado se borra la anotación (el hueco queda libre para uno que crezca después).
$execute if data storage secret_milestones:fruit_marks "$(d)"."$(x),$(y),$(z)" run return run data remove storage secret_milestones:fruit_marks "$(d)"."$(x),$(y),$(z)"
$execute positioned $(x) $(y) $(z) run function secret_milestones:gen/harvest_stem {s:"$(s)",a:"$(a)"}
execute if score #st sm.calc matches 1 run scoreboard players add #n sm.calc 1
