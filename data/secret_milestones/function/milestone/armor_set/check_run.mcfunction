# Interno: {u}. Cuenta haber cobrado los 4 hitos de armadura, no tenerlas encima:
# perder una pieza no lo quita, y las de "Obtener recompensa" del panel no cuentan.
$execute if data storage secret_milestones:claimed armor_set[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed deep_mine[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed hurt[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed movement[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed farlands[{u:$(u)}] run return 0
# Sin espacio no se marca como cobrado: se reintenta cada segundo
execute unless function secret_milestones:player/space run return run title @s actionbar {text:"Te espera una recompensa secreta: libera un espacio del inventario",color:"red"}
$data modify storage secret_milestones:claimed armor_set append value {u:$(u)}
function secret_milestones:milestone/armor_set/complete
