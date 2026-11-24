# Interno: {u}
$execute if data storage secret_milestones:claimed farlands[{u:$(u)}] run return 0
# Sin espacio no se marca como cobrado: se reintenta cada segundo
execute unless function secret_milestones:player/space run return run title @s actionbar {text:"Te espera una recompensa secreta: libera un espacio del inventario",color:"aqua"}
$data modify storage secret_milestones:claimed farlands append value {u:$(u)}
function secret_milestones:milestone/farlands/complete
