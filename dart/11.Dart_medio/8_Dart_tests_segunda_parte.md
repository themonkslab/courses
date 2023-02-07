
# Dart tests segunda parte

Ahora que ya tienen una muy buena base para entender cómo esto va funcionando,
abramos el paquete `calculator` que creamos (ya no dije proyecto! 🥳) y vamos a
pensar un poquito en él y hacernos algunas preguntas:

- Qué pasaría si a la función de suma (`add`) le pasamos un número negativo?
- Y si hacemos eso con cada una de las otras funciones?
- Qué pasaría si intentamos dividir un número por 0? Y si dividimos 0 por
  cualquier otro número?
- Qué pasaría si algún otro desarrollador quiere subir algo a nuestro paquete.
  Cómo se asegura que no va a estar rompiendo nada de lo que ya está hecho? O
  inclusive nosotros mismos!

Entiendo que parecen preguntas muy sencillas pero __trasladen esto a un programa
mucho más complejo: cómo se asegurarían ustedes que está haciendo lo que debe
hacer? Tendríamos que manualmente emular todos los casos de uso__ de aquello que
estamos creando para ver que no falle y es empezaría a poner más complejo a
medida que agreguemos funcionalidad, lo que haría la tarea super larga y en
algún punto, absolutamente irrealizable.

Por ello existen los tests.

En cuestión de segundos podemos testear toda nuestra aplicación y asegurarnos
que cada pieza de código nueva que metamos, no va a romper lo que ya está
escrito. Y ustedes se preguntarán toda la aplicación no es un poco demasiado? 🤣
Se acuerdan que yo les insisto con los tests desde que empezaron aunque recién
ahora en el capítulo 11 empezamos a ver específicamente qué son? __Si nos
acostumbramos a escribir nuestro código y testearlo al instante o, dependiendo
que _approach_ o enfoque elijan, a escribir los tests y luego ipmlementar el
código, en todo momento, toda su aplicación va estar testeada!__

Por ello, de ahora en más, todo lo que hagamos y hagan, incluirá tests! 🥳 x 1000!

Vamos a encontrar diferentes tipos de tests en Dart! Empecemos con los que más
vamos a estar escribiendo!

## _Unit tests_ o tests unitarios

Un test unitario básicamente __inicializa una pequeña parte de nuestro programa
y testea su comportamiento__. Recuerdan que varias veces les mencioné que cada
pieza de código, función, variable, debe tener una y sola una necesidad por la
cual se creó? Un sólo propósito? Si nosotros hicimos eso a lo largo de nuestro
código, estos _unit tests_ van a tomar cada una de esas partecitas y chequear
que funcionen como esperamos.

Cómo los armamos? Basándonos en la triple A!

1. _Arrange_: arreglar, inicializarlo, preparamos todo
2. _Act_: actuar, ejecutar específicamente lo que queremos
3. _Assert_: afirmar, observar el resultado esperado

Estos tests unitarios deberían ser:

- Simples: una sola función, un solo propósito.
- Fáciles de leer: como si fuera una historia pero muuuuuy resumida, con
  principio (_arrange_), conflicto (_act_) y desenlace (_assert_).
- Confiable: ...medio obvio no? Sino para que escribimos tests!
- Independiente: deben funcionar en cualquier orden, no dependiendo de otros
  tests o servicios, como el estar conectado a internet.
- Rápidos: si están escribiendo uno que demora, hay algo que no está bien
  escrito.
