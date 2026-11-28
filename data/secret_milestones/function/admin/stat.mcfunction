# Interno: botón "Activar / Desactivar estadística" del hito tmp m.
# Necesita StatsCraft: sin él no hay dónde mostrarla, así que avisa al admin y no cambia nada.
function secret_milestones:link/check
execute unless data storage secret_milestones:link statscraft run data modify storage secret_milestones:tmp status set value {text:"✘ Error de admin: StatsCraft no está instalado. Sin él los jugadores no pueden ver las estadísticas de los hitos. Instálalo y usa /reload.",color:"red"}
execute unless data storage secret_milestones:link statscraft run return run function secret_milestones:admin/detail
function secret_milestones:admin/stat_flip with storage secret_milestones:tmp m
function secret_milestones:admin/detail
