# Interno: {u}. Cuenta haber cobrado los 4 hitos de herramientas, no tenerlas encima:
# perder una no lo quita, y las de "Obtener recompensa" del panel no cuentan.
# El pico vale cualquiera de los dos: Chunk Destroyer (1) o Debris Finder (3).
$execute if data storage secret_milestones:claimed tool_set[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed stone_1m[{u:$(u)}] unless data storage secret_milestones:claimed debris_beacon[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed log_100k[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed soil_250k[{u:$(u)}] run return 0
$execute unless data storage secret_milestones:claimed harvest[{u:$(u)}] run return 0
# Sin espacio no se marca como cobrado: se reintenta cada segundo
execute unless function secret_milestones:player/space run return run title @s actionbar {text:"Te espera una recompensa secreta: libera un espacio del inventario",color:"#7FE9FF"}
$data modify storage secret_milestones:claimed tool_set append value {u:$(u)}
function secret_milestones:milestone/tool_set/complete
