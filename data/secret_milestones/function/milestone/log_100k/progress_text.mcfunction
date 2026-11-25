# Interno: {v, mined, p, o}
$data modify storage secret_milestones:tmp line set value {text:"  $(v)/100000",color:"#8B5A2B",extra:[{text:"\nTalados: $(mined)  ·  Colocados: $(p)  ·  ",color:"gray"},{text:"Fuera de cupo: $(o)",color:"red"}]}
