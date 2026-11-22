# Interno: {x, y, z, d, t}. Lo ve y lo oye solo @s.
$title @s actionbar [{text:""},{text:"Debris a $(d) bloques: ",color:"gold"},{text:"$(t)",color:"white"}]
$execute facing ~$(x) ~$(y) ~$(z) run function secret_milestones:item/debris_finder/trail
execute at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 0.5 1.4
return 1
