# Interno: {v, mined, p, o}
$data modify storage secret_milestones:tmp line set value {text:"  $(v)/1000000",color:"green",extra:[{text:"\nMinadas: $(mined)  ·  Colocadas: $(p)  ·  ",color:"gray"},{text:"Fuera de cupo: $(o)",color:"red"}]}
