# Secret-Milestones

Secretos e easter eggs para SMP (Minecraft 26.3 y 26.4) que dan recompensas al alcanzar hitos.

**Spoilers:** este archivo revela los secretos.

## Hitos
| # | Hito | Recompensa |
|---|---|---|
| 1 | Minar 1.000.000 de piedra (`minecraft:stone`) | **Chunk Destroyer Infinitum**: pico de netherita irrompible con Eficiencia X y Toque de seda |
| 2 | Matar con arco cada tipo de mob (87 en 26.3, 88 en 26.4) | **Españita Chaos Bow**: arco con Poder V, Irrompibilidad III, Infinidad y Reparación |
| 3 | Minar 5904 de ancient debris: un beacon de netherita completo (164 bloques x 36) | **Debris Finder**: pico de netherita irrompible con Eficiencia V, Fortuna V, radar de debris y Resistencia al fuego en la mano |
| 4 | Pescar 500 tesoros en aguas abiertas | **Anzuelo del Abismo**: caña irrompible con Suerte marina V y Atracción III, saca tesoros también en agua cerrada (revive las fish farms antiguas) |
| 5 | Llegar al borde del mundo (las Farlands): 29.999.900 bloques en X o Z | **Farlands Explorer**: botas de netherita irrompibles con todas las protecciones y todos los encantamientos de botas, dan Velocidad II puestas |
| 6 | Craftear 1000 de cada componente de redstone (16) | **RedKeyStone**: llave irrompible (sin mostrarlo, en su lugar trae una explicación corta) que gira repetidores, comparadores, pistones, observadores, dispensadores, droppers y tolvas sin romperlos |
| 7 | Sobrevivir 1000 días del juego sin morir, en tiempo jugado | **Kars Totem**: tótem encantado que vuelve cada vez que te salva y da Regeneración I en la segunda mano |
| 8 | Talar 100.000 troncos | **Woodozer**: hacha de netherita irrompible con Filo V, Eficiencia V y Fortuna III que tala el árbol entero |
| 9 | Minar en las cuevas profundas: 100.000 de deepslate, 25.000 de tuff y menas de deepslate: 3500 de diamante, 5000 de redstone, 3000 de oro, 3000 de hierro, 2000 de lapislázuli y 1000 de cobre | **DeepMine Crown**: casco de netherita irrompible con todas las protecciones, Respiración III, Afinidad acuática y Espinas III, da Visión nocturna e inmunidad a la Oscuridad puesto |
| 10 | Excavar 250.000 bloques blandos (tierra, arena, grava, nieve, barro...) | **Terra Magnet**: pala de netherita irrompible con Eficiencia V y Toque de seda; lo que excava con ella va directo al inventario |
| 11 | Recorrer 300 km agachado, 1000 km corriendo y saltar 100.000 veces | **Dash Shadow**: pantalones de netherita irrompibles con todas las protecciones, Sigilo rápido V y Espinas III; doble espacio con WASD apretada da un dash hacia esa dirección |
| 12 | Aguantar daño (antes de la armadura): 50.000 corazones de golpes, 25.000 de proyectiles, 10.000 de explosiones, 10.000 de fuego y lava y 5.000 de jefes | **Aegis Heart**: pechera de netherita irrompible con todas las protecciones y Espinas III; al recibir un golpe da Absorción II y te hace inmune al Wither |

- Cada jugador cobra cada hito **una sola vez**.
- **Cuenta desde que se instala** el datapack: todos empiezan en 0.
- Del hito 1 solo cuenta `stone`: no deepslate, granito, cobblestone ni otras variantes. En creativo no suma.
- El aviso solo lo ve quien lo consigue.
- Con el inventario lleno, muerto o en espectador, la recompensa queda esperando.

## Reglas del hito del arco
- La flecha de un **arco** tiene que dar el **golpe final**. No cuentan ballesta, dispensador, cuerpo a cuerpo, quemado por Fuego ni muerto por la poción de la flecha.
- Cada tipo cuenta una vez. En creativo no cuenta.
- Entran también los pacíficos: aldeano, allay, lobo, gato, etc.
- **Enderman:** cuenta con flecha. Solo la recibe si está montado (bote o vagoneta), suelto la esquiva.
- **Breeze y Wither:** como son inmunes a las flechas, cuentan si el **último golpe** es cuerpo a cuerpo con un **arco en la mano principal**. Es la única excepción: con los demás no vale pegar con el arco.
- **No entran**, porque sería imposible: Creaking (solo muere por su corazón), Giant e Illusioner (no salen en survival).
- El Frostbite solo se pide en 26.4, con `overlay_26_4`.
- La lista está en `tools/generate.py`. Después de editarla ejecuta `python tools/generate.py`.

## Debris Finder
- **Radar:** agachado con él en la mano principal. Cada 2 segundos dice a cuántos bloques está el debris más cercano (radio 8, desde los pies) y hacia dónde, con una línea de partículas. Solo lo ve quien lo usa.
- **Resistencia al fuego:** mientras está en la mano principal. Dura hasta 3 segundos más al guardarlo.
- Trae Eficiencia V: el debris tarda 1,3 segundos y la netherrack se rompe al instante. La piedra solo es instantánea con Prisa II. No trae Toque de seda.

## Reglas del hito del debris
- **El debris colocado no cuenta al minarlo**, lo haya puesto quien sea. Se anota su posición exacta, así que tener debris guardado o de adorno no le quita nada a quien mina natural al lado, y colocar no resta progreso.
- **Cupo:** 16 por zona de 16x16x16 y por jugador, por si lo mueven con pistones (`#debris_cap` en `load`). En Nether real se alcanzan 12 como máximo desde una zona.
- El debris colocado antes de instalar esta versión, o con comandos, no está anotado.

## Anzuelo del Abismo
- **Tesoros en cualquier agua:** con esta caña no hacen falta aguas abiertas. Las demás cañas siguen como en vanilla.
- **Quién gana:** vale la caña con la que se recoge el sedal. Con dos cañas en las manos se usa la principal.
- **Otros packs:** esto reemplaza `minecraft:gameplay/fishing`. Si otro datapack también la cambia solo funciona el que carga de último.

## Reglas del hito de pesca
- Cuentan los **tesoros**: etiqueta, montura, caparazón de nautilo, libro encantado, arco y caña encantada. Peces y basura no.
- **Solo en aguas abiertas**, también con el Anzuelo: uno prestado no sirve para hacer el hito en una farm.
- Enganchar un ítem tirado no cuenta, y en creativo tampoco.

## Farlands Explorer
- **Encantamientos:** Protección, Protección contra el fuego, contra explosiones y contra proyectiles IV, Caída de pluma IV, Espinas III, Agilidad acuática III, Velocidad de alma III y Sigilo rápido III. Combinaciones imposibles en vanilla. Sin maldiciones.
- **Velocidad II:** mientras están puestas. Dura hasta 3 segundos más al quitarlas.

## Reglas del hito de las Farlands
- Cuenta llegar a **29.999.900** en X o Z (positivo o negativo), en el **Overworld o el End**. El borde vanilla está en 29.999.984.
- **El Nether no cuenta**, porque sus coordenadas valen x8. Se puede viajar por el Nether y salir por un portal cerca del borde.
- Se revisa una vez por segundo y se guarda lo más lejos que llegó cada jugador (se ve en el panel). En creativo no suma.
- Si el server achicó el borde con `/worldborder`, cambia `#farlands` en `load` y el texto `rules` en `milestone/registry`.

## RedKeyStone
- **Clic derecho** sobre el bloque para girarlo un paso. Repetidores, comparadores, dispensadores, droppers y tolvas se abren o cambian al tocarlos: con esos hay que estar **agachado**.
- Gira a: norte, este, sur, oeste, arriba, abajo (la tolva: abajo y los 4 lados; repetidor y comparador: los 4 lados). Lo demás se queda igual: retardo, modo y el contenido de los contenedores.
- Los pistones extendidos no se giran. Alcance de 5 bloques, no funciona en aventura.
- Al girarlo el bloque no se actualiza solo: si queda prendido o apagado de más, cualquier cambio al lado lo corrige.
- Es una caña con zanahoria por dentro: montado en un cerdo con montura también lo dirige.

## Reglas del hito de redstone
- Hay que craftear **1000 de cada uno**: repetidor, comparador, pistón, pistón pegajoso, observador, dispensador, dropper, tolva, antorcha de redstone, lámpara, palanca, diana, sensor de luz solar, gancho de cuerda, bloque musical y crafter.
- El **bloque de redstone no entra**: se craftea y descraftea en bucle con solo 9 de redstone.
- Cuentan los ítems que salen, no las veces que se craftea (una receta de gancho da 2). Lo que pasa de 1000 en un componente no suma para otro.
- Lo que craftea el **crafter** (bloque) no cuenta, y en creativo tampoco.
- La lista está en `tools/generate.py` (`RED_ITEMS`). Después de editarla ejecuta `python tools/generate.py`.

## Kars Totem
- **Infinito:** cada vez que te salva vuelve a la misma mano. Salva como uno normal (Regeneración, Absorción y Resistencia al fuego).
- **No salva** de lo que ningún tótem salva: el vacío y `/kill`.
- **Regeneración I** mientras está en la segunda mano, curando al mismo ritmo que una poción. Dura hasta 7 segundos más al guardarlo.

## Reglas del hito de los 1000 días
- 1000 días del juego son 24.000.000 de ticks: unas **333 horas jugando** sin morir.
- **Morir reinicia la cuenta.** Que te salve un tótem no es morir.
- Solo suma conectado, vivo y en **survival o aventura**. En creativo o espectador la cuenta se pausa (no se pierde).
- **Anti-AFK:** si pasa **2 minutos sin girar la cámara** la cuenta se pausa (no se pierde) hasta que la vuelva a mover. Se mira la cámara y no la posición, porque el agua, los pistones o una vagoneta mueven a un jugador AFK pero no lo giran. El límite se cambia en `load` (`#afk_limit`, en segundos); cambia también el texto `rules` en `milestone/registry`.
- Dormir o `/time set` no adelantan nada: cuenta el tiempo jugado, no la hora del mundo.

## Woodozer
- **Tala el árbol entero:** al romper un tronco con él en la mano principal caen también todos los troncos del mismo tipo conectados (también en diagonal), hasta 256 (`#fell_cap` en `load`). Las hojas se caen solas después.
- **Agachado** rompe un solo tronco.
- **Solo árboles:** tala si algún tronco toca hojas naturales (o la copa de un hongo del Nether). Las hojas colocadas no cuentan, así una casa de troncos no se cae entera. Ojo: lo que esté hecho del mismo tronco y pegado a un árbol de verdad sí cae.
- No funciona en creativo. Los troncos que tala solo no suman para el hito.

## Reglas del hito de los troncos
- Cuentan los **troncos y tallos** de los 11 árboles: roble, abeto, abedul, jungla, acacia, roble oscuro, mangle, cerezo, roble pálido, carmesí y distorsionado. La madera (6 caras) y los troncos pelados no, porque no salen en árboles naturales.
- **Cupo por zona:** cada zona de 16x16x16 (según dónde está parado el jugador) le cuenta hasta 1000 troncos a cada jugador (`#log_cap` en `load`). Es como el stone: poner y romper en el mismo sitio, o una granja de árboles fija, deja de sumar. En el panel, alguien con casi tantos colocados como talados es sospechoso.
- En creativo no suma. La lista está en `tools/generate.py` (`LOGS`). Después de editarla ejecuta `python tools/generate.py`.

## DeepMine Crown
- **Encantamientos:** Protección, Protección contra el fuego, contra explosiones y contra proyectiles IV, Respiración III, Afinidad acuática y Espinas III. Sin maldiciones.
- **Visión nocturna:** mientras está puesta, sin el parpadeo de los últimos segundos. Dura hasta 13 segundos más al quitarla.
- **Inmune a la Oscuridad** del Warden y del sculk shrieker: se quita al instante.

## Reglas del hito de las cuevas profundas
- Hay que llegar a la meta de **cada uno**: 100.000 de deepslate, 25.000 de tuff, y de menas de deepslate 3500 de diamante, 5000 de redstone, 3000 de oro, 3000 de hierro, 2000 de lapislázuli y 1000 de cobre. Lo que pasa de la meta en uno no suma para otro.
- **Balance:** cada meta va según cuánto sale de esa mena en deepslate (datos de 26.4), así todas tardan parecido. El cobre es el más escaso porque casi todo está sobre Y=0: el de deepslate solo sale entre Y −16 y 8. Se cuentan bloques minados, no lo que sueltan: Fortuna no ayuda.
- **Menas:** con **Toque de seda no cuentan**. Cuentan al romperlas después sin él: la mena solo se consigue con Toque de seda y al romperla sin él ya no vuelve, así cada mena natural cuenta una sola vez. Las menas normales (sin deepslate) no entran.
- **Deepslate y tuff:** se pueden poner y romper, así que tienen cupo por zona de 16x16x16 y por jugador, como el stone: 5500 de deepslate y 2000 de tuff (una mancha natural tiene unos 600) (`#cap_deepslate` y `#cap_tuff` en `load`). Con Toque de seda sí cuentan. En el panel salen los colocados y lo que quedó fuera de cupo.
- En creativo no suma. La lista y las metas están en `tools/generate.py` (`DEEP`). Después de editarla ejecuta `python tools/generate.py`, y cambia también los textos en `milestone/registry`.

## Terra Magnet
- **Imán:** lo que sueltan los bloques blandos que rompe con ella en la mano principal va directo al inventario. Solo esos bloques (la misma lista del hito, `tags/item/soil.json`): la piedra o los minerales caen normal.
- Lo que no entra en el inventario queda a los pies. Los ítems tirados con Q no los atrae.
- No funciona en creativo (ahí el juego no anota lo excavado).

## Reglas del hito de los bloques blandos
- Cuentan tierra, pasto, tierra gruesa, podzol, micelio, tierra enraizada, caminos, arena, arena roja, grava, arcilla, capas y bloques de nieve, soul sand, soul soil, barro y raíces de mangle con barro. Con cualquier herramienta, o a mano.
- **Cupo por zona:** cada zona de 16x16x16 (según dónde está parado el jugador) le cuenta hasta 2000 a cada jugador (`#soil_cap` en `load`). Así poner y romper en el mismo sitio, o la nieve que dejan los golems de nieve, deja de sumar. En el panel salen los colocados y lo que quedó fuera de cupo.
- En creativo no suma. La lista está en `tools/generate.py` (`SOIL`). Después de editarla ejecuta `python tools/generate.py`.

## Dash Shadow
- **Encantamientos:** Protección, Protección contra el fuego, contra explosiones y contra proyectiles IV, Sigilo rápido V (en vanilla el máximo es III) y Espinas III. Sin maldiciones. Trae también **Dash**, un encantamiento propio del datapack que es el que empuja.
- **Dash:** apretar **espacio dos veces seguidas** (dentro de 7 ticks, `#dash_window` en `load`) con **W, A, S o D** apretada. Va hacia esa dirección según adónde mira la cámara, siempre en horizontal y un poco hacia arriba. W+A va en diagonal. En el suelo, el primer espacio salta y el segundo dashea en el aire.
- **Límites:** un dash por salto (se recarga al tocar el suelo) y 1,5 segundos de espera (`#dash_cd` en `load`, en ticks). Mantener el espacio apretado no dashea.
- **No dashea** con elytra puesta (el doble espacio la abre), montado, en agua, lava o columnas de burbujas, ni en creativo (ahí el doble espacio es para volar).
- La fuerza se cambia en `tools/generate.py` (`DASH_SPEED` y `DASH_LIFT`). Después de editarla ejecuta `python tools/generate.py` y `/reload`.
- **Ojo:** la piedra de afilar le quita los encantamientos, también el Dash.

## Reglas del hito de agacharse, correr y saltar
- Hay que llegar a la meta de **cada uno**: 300 km agachado, 1000 km corriendo y 100.000 saltos. Lo que pasa de la meta en uno no suma para otro.
- **Agachado:** solo cuenta apretando agacharse **y** una tecla WASD. Así no suman las corrientes de agua, los pistones ni el hielo.
- **Corriendo:** solo cuenta apretando W. Sigilo rápido y correr saltando ayudan, y está bien: correr saltando suma a dos metas a la vez.
- **Saltos:** cada zona de 16x16x16 (según dónde está parado el jugador) le cuenta hasta 500 a cada jugador (`#jump_cap` en `load`). Saltar en el mismo lugar con una macro deja de sumar. En el panel salen los saltos fuera de cupo.
- **Anti-AFK:** el mismo del hito de los 1000 días. Si pasa 2 minutos sin girar la cámara no suma nada.
- Solo en survival o aventura. Las metas están en `milestone/check_all` (en cm para las distancias) y los textos en `milestone/registry` y `milestone/movement/`.

## Aegis Heart
- **Encantamientos:** Protección, Protección contra el fuego, contra explosiones y contra proyectiles IV y Espinas III. Sin maldiciones.
- **Corazón de hierro:** al recibir daño (de lo que sea) da Absorción II por 10 segundos: 4 corazones extra. Después espera 20 segundos (`#aegis_cd` en `load`, en ticks).
- **Inmune al Wither:** el efecto del Wither y del wither skeleton se quita al instante.

## Reglas del hito del daño
- Hay que llegar a la meta de **cada uno**: 50.000 corazones de golpes, 25.000 de proyectiles, 10.000 de explosiones, 10.000 de fuego y lava y 5.000 de jefes. Lo que pasa de la meta en uno no suma para otro.
- **Cuenta el daño antes de la armadura**: lo que pega el golpe, sin restar armadura, encantamientos, Resistencia ni Absorción. Así el mejor equipo no frena el hito. En Difícil los mobs pegan más y se avanza más rápido.
- **Golpes, proyectiles y explosiones:** solo si los causa un mob (`tags/entity_type/attackers.json`). No cuentan PvP, TNT, camas, anclas de reaparición, end crystals ni dispensadores.
- **Fuego y lava:** fuego, lava, magma y quemarse. Lo que anula la Resistencia al fuego no cuenta, porque el juego ni registra el golpe.
- **Jefes:** Wither, Ender Dragon, Warden y Elder Guardian (`tags/entity_type/bosses.json`). Su daño cuenta también para su tipo (golpe, proyectil o explosión).
- **Lo bloqueado con escudo no cuenta.** Tampoco la caída, el ahogo, la asfixia, el vacío ni `/kill`.
- **Cupo por zona:** cada zona de 16x16x16 le cuenta a cada jugador hasta 250 corazones de cada tipo y 50 de fuego y lava (`#hcap_*` en `load`, en décimas de vida: 1 corazón = 20). Una granja de mobs fija o quedarse en lava curándose deja de sumar. Los jefes no tienen cupo. En el panel sale lo que quedó fuera de cupo.
- **Anti-AFK:** el mismo del hito de los 1000 días. Solo en survival o aventura.
- **Cómo se mide:** ninguna estadística guarda el daño antes de la armadura. Cada tipo tiene un advancement (`hurt_*`) con un criterio por tramo de daño: de medio punto de vida en medio punto hasta 20 corazones (exacto para el daño vanilla), de a 2,5 corazones hasta 50, y un tramo de 50 o más. Se generan con `python tools/generate.py` (`HURT`, `BOSSES`, `HURT_EXTRA`).

## Contra los generadores de stone
- **Cupo por zona:** cada zona de 16x16x16 (según dónde está parado el jugador) le cuenta hasta 5500 stone a cada jugador. En una zona natural caben 4096 bloques. Un generador fijo deja de sumar a los 5500, sin avisar.
- **Colocar no resta:** construir y terraformar con stone no afecta el progreso. Poner y romper en el mismo sitio lo frena el cupo de la zona. En el panel, alguien con casi tantas colocadas como minadas es sospechoso.
- El cupo se cambia en `load` (`#cap`). Cambia también el texto `rules` en `milestone/registry`.

## Panel de admin
`/function secret_milestones:menu` (requiere OP)

La pantalla principal es la lista de hitos (8 por página). Al tocar uno se abre su detalle, con vista previa y:

- **Obtener recompensa:** te da solo el ítem.
- **Probar hito:** cierra el panel y reproduce lo que verá el jugador, con el ítem incluido.
- **Ver progreso:** cuánto lleva cada jugador, también los desconectados.

Probar las recompensas no marca el hito como conseguido. Los botones solo funcionan para quien abrió el panel él mismo, durante **2 minutos desde el último botón**, o hasta que sale o se usa `/reload`. Al quitarle el OP a alguien usa `/reload` para cortarle el permiso al instante.

## Notas
- Con **Wearbound**, el pico necesita el tier de diamante desbloqueado, como cualquier pico de netherita.
- En el yunque, un libro de Eficiencia baja el Chunk Destroyer a Eficiencia V (regla de vanilla).
- Desinstalar: `/function secret_milestones:uninstall` y después quitar el datapack. Se conservan el progreso, los cupos y quién cobró, por si se reinstala.

## Agregar un hito
1. La condición: un score (como `sm.valid`) o un predicate.
2. `function/reward/<recompensa>.mcfunction`: el premio.
3. `function/milestone/<hito>/`: `check`, `check_run`, `complete` y `progress` (deja en `tmp line` el texto de la fila del panel).
4. Una línea en `milestone/check_all` y su lista en `load`.
5. Un bloque en `milestone/registry`. El panel lo muestra solo: no hay que tocar `admin/`.

El ícono se genera con `python tools/icon.py`.
