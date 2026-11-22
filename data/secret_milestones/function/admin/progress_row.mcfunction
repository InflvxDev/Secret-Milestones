# Interno: {n, v, m, p, o}
$data modify storage secret_milestones:tmp ui.body append value {type:"minecraft:plain_message",width:380,contents:[{text:""},{type:"object",object:"player",player:{name:"$(n)"}},{text:" $(n)",color:"white",bold:true},{text:"  $(v) válidas",color:"green"},{text:"\nMinadas: $(m)  ·  Colocadas: $(p)  ·  ",color:"gray"},{text:"Fuera de cupo: $(o)",color:"red"}]}
