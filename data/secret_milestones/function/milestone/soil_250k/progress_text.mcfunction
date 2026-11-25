# Interno: {v, mined, p, o}
$data modify storage secret_milestones:tmp line set value {text:"  $(v)/250000",color:"#7CBD3B",extra:[{text:"\nExcavados: $(mined)  ·  Colocados: $(p)  ·  ",color:"gray"},{text:"Fuera de cupo: $(o)",color:"red"}]}
