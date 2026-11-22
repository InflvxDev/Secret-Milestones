# Interno: {k, p, t} cabecera de la lista
$data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",width:310,contents:[{text:""},{text:"Elige un hito",color:"white"},{text:"  ·  $(k) en total  ·  página $(p) de $(t)",color:"gray"}]}
data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",width:310,contents:[{text:"Pulsa ",color:"gray",italic:true},{text:"Esc",color:"yellow",italic:true},{text:" para salir.",color:"gray",italic:true}]}
