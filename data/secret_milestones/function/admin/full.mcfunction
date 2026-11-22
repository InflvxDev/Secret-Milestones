# Interno: el admin no tiene espacio para la recompensa
data modify storage secret_milestones:tmp status set value {text:"Inventario lleno: libera un espacio.",color:"red"}
function secret_milestones:admin/detail
