# Interno: botones "Activar / Desactivar todas" de la lista (#a = 2 activar, 3 desactivar)
function secret_milestones:link/check
execute unless data storage secret_milestones:link statscraft run data modify storage secret_milestones:tmp status set value {text:"✘ Error de admin: StatsCraft no está instalado. Instálalo y usa /reload para mostrar las estadísticas de los hitos.",color:"red"}
execute unless data storage secret_milestones:link statscraft run return run function secret_milestones:admin/main
execute if score #a sm.calc matches 2 run function secret_milestones:gen/stats_all_on
execute if score #a sm.calc matches 2 run data modify storage secret_milestones:tmp status set value {text:"✔ Todas las estadísticas activadas en StatsCraft.",color:"green"}
execute if score #a sm.calc matches 3 run data modify storage secret_milestones:link on set value {}
execute if score #a sm.calc matches 3 run data modify storage secret_milestones:tmp status set value {text:"Todas las estadísticas desactivadas.",color:"yellow"}
function secret_milestones:admin/main
