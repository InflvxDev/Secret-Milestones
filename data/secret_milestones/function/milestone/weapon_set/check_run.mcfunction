# Interno: {u}. Cuenta haber cobrado los 3 hitos de armas, no tenerlas encima:
# perder una no lo quita, y las de "Obtener recompensa" del panel no cuentan.
# Arco (hito 2), espada (hito 15) y mazo (hito 10).
$execute if data storage secret_milestones:claimed weapon_set[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed bow_all[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed armor_set[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed tool_set[{u:$(u)}] run return 0
# Sin espacio no se marca como cobrado: se reintenta cada segundo
execute unless function secret_milestones:player/space run return run title @s actionbar {text:"Te espera una recompensa secreta: libera un espacio del inventario",color:"#4D8CFF"}
$data modify storage secret_milestones:claimed weapon_set append value {u:$(u)}
function secret_milestones:milestone/weapon_set/complete
