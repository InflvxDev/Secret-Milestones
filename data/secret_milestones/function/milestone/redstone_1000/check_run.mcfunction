# Interno: {u}
$execute if data storage secret_milestones:claimed redstone_1000[{u:$(u)}] run return 0
# Sin espacio no se marca como cobrado: se reintenta cada segundo
execute unless function secret_milestones:player/space run return run title @s actionbar {text:"Te espera una recompensa secreta: libera un espacio del inventario",color:"red"}
$data modify storage secret_milestones:claimed redstone_1000 append value {u:$(u)}
function secret_milestones:milestone/redstone_1000/complete
