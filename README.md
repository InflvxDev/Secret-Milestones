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
