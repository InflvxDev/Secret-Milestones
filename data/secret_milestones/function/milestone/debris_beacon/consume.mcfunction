# Interno: {d, kx, ky, kz, x, y, z}. Era colocado: no cuenta, y se borra la nota.
scoreboard players remove #left sm.calc 1
$data remove storage secret_milestones:debris_marks "$(d)"."$(kx),$(ky),$(kz)"[{x:$(x),y:$(y),z:$(z)}]
