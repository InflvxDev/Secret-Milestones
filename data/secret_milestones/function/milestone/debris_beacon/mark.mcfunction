# Interno: {d, x, y, z, kx, ky, kz}. Anota el primero que no estuviera anotado.
$execute if data storage secret_milestones:debris_marks "$(d)"."$(kx),$(ky),$(kz)"[{x:$(x),y:$(y),z:$(z)}] run return 0
$data modify storage secret_milestones:debris_marks "$(d)"."$(kx),$(ky),$(kz)" append value {x:$(x),y:$(y),z:$(z)}
scoreboard players set #found sm.calc 1
