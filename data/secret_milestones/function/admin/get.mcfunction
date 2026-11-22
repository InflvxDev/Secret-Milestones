# Interno: {reward}. Botón "Obtener recompensa"
$function secret_milestones:reward/$(reward)
data modify storage secret_milestones:tmp status set value {text:"Recibiste ",color:"green",extra:[{text:""}]}
data modify storage secret_milestones:tmp status.extra[0].text set from storage secret_milestones:tmp m.name
function secret_milestones:admin/detail
