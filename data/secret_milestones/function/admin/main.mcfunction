# Interno: lista de hitos, página #p (un botón por hito, las acciones van en admin/detail)
data modify storage secret_milestones:tmp ui set value {type:"minecraft:multi_action",title:{text:"Secret Milestones",color:"red",bold:true},external_title:{text:"Secret Milestones",color:"red"},body:[],columns:1,pause:false,after_action:"wait_for_response",actions:[]}

# Páginas = (hitos - 1) / tamaño + 1. Se corrige #p si quedó fuera.
execute store result score #total sm.calc run data get storage secret_milestones:db milestones
scoreboard players operation #pages sm.calc = #total sm.calc
scoreboard players remove #pages sm.calc 1
scoreboard players operation #pages sm.calc /= #page sm.calc
scoreboard players add #pages sm.calc 1
# Sin hitos sigue habiendo una página
execute if score #pages sm.calc matches ..0 run scoreboard players set #pages sm.calc 1
execute if score #p sm.calc >= #pages sm.calc run scoreboard players operation #p sm.calc = #pages sm.calc
execute if score #p sm.calc = #pages sm.calc run scoreboard players remove #p sm.calc 1

data modify storage secret_milestones:tmp h set value {}
execute store result storage secret_milestones:tmp h.k int 1 run scoreboard players get #total sm.calc
execute store result storage secret_milestones:tmp h.t int 1 run scoreboard players get #pages sm.calc
scoreboard players operation #v sm.calc = #p sm.calc
scoreboard players add #v sm.calc 1
execute store result storage secret_milestones:tmp h.p int 1 run scoreboard players get #v sm.calc
function secret_milestones:admin/header with storage secret_milestones:tmp h
# Estadísticas de StatsCraft: aviso si no está instalado, y el resultado del último botón
function secret_milestones:link/check
execute unless data storage secret_milestones:link statscraft run data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",width:310,contents:{text:"⚠ StatsCraft no está instalado: los botones de estadísticas no funcionan. El resto del panel sí.",color:"red"}}
execute if data storage secret_milestones:tmp status run data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",width:310,contents:""}
execute if data storage secret_milestones:tmp status run data modify storage secret_milestones:tmp ui.body[-1].contents set from storage secret_milestones:tmp status
data remove storage secret_milestones:tmp status

# Hitos de esta página: de #i hasta antes de #end
scoreboard players operation #i sm.calc = #p sm.calc
scoreboard players operation #i sm.calc *= #page sm.calc
scoreboard players operation #end sm.calc = #i sm.calc
scoreboard players operation #end sm.calc += #page sm.calc
execute if score #end sm.calc > #total sm.calc run scoreboard players operation #end sm.calc = #total sm.calc
execute if score #i sm.calc < #end sm.calc run function secret_milestones:admin/list_loop

execute if score #p sm.calc matches 1.. run function secret_milestones:admin/page_prev
scoreboard players operation #v sm.calc = #p sm.calc
scoreboard players add #v sm.calc 1
execute if score #v sm.calc < #pages sm.calc run function secret_milestones:admin/page_next
execute if score #total sm.calc matches 1.. run function secret_milestones:admin/stat_buttons
# Un multi_action no admite cero botones
execute if score #total sm.calc matches 0 run data modify storage secret_milestones:tmp ui.actions append value {width:260,label:{text:"Todavía no hay hitos",color:"gray"},action:{type:"minecraft:run_command",command:"trigger sm.admin set 1"}}
function secret_milestones:admin/show with storage secret_milestones:tmp
