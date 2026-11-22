# Interno: {axis, o, e}. o = distancia al bloque, e = la misma para el caso del borde.
scoreboard players add #hits sm.calc 1
$data modify storage secret_milestones:tmp at.$(axis) set value "$(o)"
$data modify storage secret_milestones:tmp at.$(axis)e set value "$(e)"
