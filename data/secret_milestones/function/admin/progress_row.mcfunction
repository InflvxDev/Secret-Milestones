# Interno: {n, m}. Cabeza y nombre, más el texto que deja milestone/<m>/progress en tmp line
$data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",width:380,contents:[{text:""},{type:"object",object:"player",player:{name:"$(n)"}},{text:" $(n)",color:"white",bold:true},{text:""}]}
data modify storage secret_milestones:tmp line set value {text:""}
$function secret_milestones:milestone/$(m)/progress with storage secret_milestones:tmp row
data modify storage secret_milestones:tmp ui.body[-1].contents[3] set from storage secret_milestones:tmp line
