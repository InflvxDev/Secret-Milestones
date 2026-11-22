# Interno: {v, mined, p, r, o}
$data modify storage secret_milestones:tmp line set value {text:"  $(v)/5904",color:"gold",extra:[{text:"\nMinadas: $(mined)  ·  Colocadas: $(p)",color:"gray"},{text:"\nMinadas que eran colocadas: $(r)  ·  Fuera de cupo: $(o)",color:"red"}]}
