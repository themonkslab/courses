# _Test driven development_

El desarrollo guiado por pruebas o más comúnmente llamado por sus siglas en
inglés _TDD_, se refiere a crear primero el test (generalmente unitario), para
luego escribir nuestro código o bien terminar de escribirlo. Para entenderlo,
vamos a ejemplificarlo.

Vamos a seguir con nuestra amada calculadora pero ahora van a entrar a la
función de resta (`lib/src/substract.dart`) y van a borrar la única línea de
código que tiene como si nunca hubiera existido.

Paso siguiente, van a ingresar al archivo que creamos para testear esa función
(`test/src/substract_test.dart`) y quiero que escriban los casos de uso que una
función de resta podría tener. 💀 Los espero! Tengo toda la madrugada!🤣

Ah, escriban cuatro casos de uso, como hicimos con la suma. Listos? Los míos se
verían así:

```dart
import 'package:test/test.dart';

main() {
  test('substract 1 to 2, results in 1', () {
    // Arrange
    // Act
    // Assert
  });
  test('substract 2 to 2, results in 0', () {
    // Arrange
    // Act
    // Assert
  });
  test('substract 3 to 2, results in -1', () {
    // Arrange
    // Act
    // Assert
  });
  test('substract -1 to -2, results in -3', () {
    // Arrange
    // Act
    // Assert
  });
}
```

Ahora prestemos atención: ustedes borraron la función que estaba en
`lib/src/substract.dart`y no hay absolutamente nada allí. Vamos a crear el test
del primer caso y va a empezar a fallar aun sin ejecutarlo o por lo menos,
marcarnos ciertos errores:

![No function](9_1.no_function.png)

Claro! Borramos la función entonces nos dice que `substract` no existe. Vayamos
entonces al archivo y creemos una función llamada `substract` en su forma
mínima, en su forma más simple, recordando que vamos pasito a pasito para
entender el proceso:

```dart
substract() {}
```

Listo! Allí tenemos la función. Qué les parece si la importamos en nuestro test?
Oh! Ya el error no está sobre 'substract' sino ahora en el primero de sus
argumentos:

![Extra arguments](9_2.extra_arguments.png)

Cuando creamos el test, obviamente llamamos a la función con argumentos porque
queríamos poder pasarle valores no? Y además esperábamos que esos valores fueran
enteros (`1` y `2` en nuestro test). Como la estamos llamando con argumentos
pero la función no los espera, nos dice que le pasamos demasiados argumentos!
Que no esperaba ninguno! 🤣

Vamos entonces a agregarle la posibilidad de que reciba argumentos y
específicamente del tipo que queremos:

```dart
substract(int a, int b) {}
```

Y ahora sí, finalmente, deja de producir esos molestos errores! Vamos a
correrla! Y ahora como ustedes ya saben cómo leer un test que falla, me voy a
concentrar en lo que esperábamos y lo que sucedió:

```shell
  Expected: <1>
    Actual: <null>
```

Esperaba `1` pero el resultado fue `null`. Por qué? Porque no estamos retornando
nada de nuestra función, lo que sería lo mismo a escribirla de la siguiente
manera:

```dart
void substract(int a, int b) {}
```

Eso sería una función sin retorno; que solamente hace algo pero no devuelve
ningún valor. Pero si hacemos eso, nuestro test vuelve a fallar:

![Result void](9_3.result_void.png)

Fíjense que si nos paramos encime del error (el recuadro inferior), nos expande
la explicación (recuadro superior) y allí dice que la expresión es del tipo
`void`, que no podemos usar ese velor. Y luego nos dice que nos fijemos si
estamos utilizando la interface (API) apropiada o finalmente fíjense si los
parámetros están bien.

Ahora, díganme hasta acá si este no es mejor compañero que
[ChatGPT?](https://openai.com/blog/chatgpt/) 😂 __Si lo aprendemos a utilizar de
forma correcta, nos acompaña todo el camino y va señalando lo que tenemos que
hacer.__ Y es entendible que el proceso les parezca super lento, pero a medida que
lo van entrenando es súper poderoso porque la posibilidad de errores disminuye
al mínimo y con ello, la posibilidad de tener que volver atrás en una tarea que
les llevó mucho tiempo y tiempo de otros involucrados en el proceso. Y __aquí
quiero hacer una salvedad muy importante: hasta el momento, en solo una de las
compañías que trabajé, logramos luego de mucho insistir, que el TDD sea el modo
por defecto o por lo menos, incluir tests en la primera instancia del
desarrollo.__ Sin embargo, es entendible que no suceda usualmente ya que los
tiempos en esta industria vuelan y __aun no entendemos que a veces caminar
lentamente al comienzo, nos permite correr en el mediano plazo y finalmente,
volar en el futuro__.

Bueno, entre tanta cháchara, me perdí! Ah! 💡 __Menos mal que tenemos nuestros
tests para recordarnos donde estamos!__ 😉

Decíamos que tenemos que agregarle un tipo de retorno! A hacerlo:

```dart
int substract(int a, int b) {}
```

Lo hacemos y vuelve a aparecernos un error: 'The body might complete normally,
causing 'null' to be returned, but the return type, 'int', is a potentially
non-nullable type. Try adding either a return or a throw statement at the end.'

Como no tenemos nada en el cuerpo de dicha función, Dart nos dice que puede
llegar a retornar un `null` cuando en realidad necesitamos un `int`, que no es
nulleable. Entonces nos pide un `return` que podría verse así:

```dart
int substract(int a, int b) {
  return
}
```

Pero entonces nos pide un punto y coma:

```dart
int substract(int a, int b) {
  return;
}
```

Y entonces nos pide un valor! No se cansa nunca! 🤣 Por suerte nosotros tampoco
y menos ahora que hemos llegado al punto clave de la cuestión! Qué tenemos que
poner en este cuerpecito? La función de resta:

```dart
int substract(int a, int b) {
  return b - a;
}
```

Fíjense que como yo había asignado `1` a `a` y `2` a `b` y nuestra desripción
dice sustraer 1 a 2, entonces tuve que invertirlo en el cuerpo de la función. Lo
lógico sería hacerlo a la inversa pero eso podría confundirlos en las variables
así que creo ninguna opción es mejor! 😆 No importa porque lo que persigo es que
entiendan el proceso. Córranlo!

Y ahora sí, finalmente, pueden ver que no hay ningún error en la escritura del
test pero aun tenemos que comprobar si corre de forma correcta! 💀 Vamos a ver
si funciona?

Imagino habrán ido a probar! Sino, vengo a contarles que funciona perfectamente.
El asunto es que ahora van a tener que hacer ustedes los próximos tests. 💀

Estoy viendo que esto se está volviendo bastante tétrico con tantas 💀! 🤣 Ya
vamos a encontrar otro mecanismo mejor. Mientras tanto me alegro de haberles
consumido un poco de espacio para que no vean la solución!

La hicieron? Será que tanto a ustedes como a mí se les pasó que la últrima
descripción de nuestro test estaba mal? Juro que no lo hice a propósito:
'substract -1 to -2, results in -3'. Si a `-2` le restamos `-1`, no nos queda
`-3`, nos debería quedar `-1`. Saben cómo me di cuenta? Adivinen! Sí! Cuando
corrí mis tests! Aquí todas las soluciones corregidas:

```dart
import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

main() {
  test('substract 1 to 2, results in 1', () {
    // Arrange
    const a = 1;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, 1);
  });
  test('substract 2 to 2, results in 0', () {
    // Arrange
    const a = 2;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, 0);
  });
  test('substract 3 to 2, results in -1', () {
    // Arrange
    const a = 3;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, -1);
  });
  test('substract -1 to -2, results in -3', () {
    // Arrange
    const a = -1;
    const b = -2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, -1);
  });
}
```

Y ahora que ya hicieron todo, me di cuenta de algo más; no me odien 🫣: nunca
probamos qué sucedería si restamos 1.5 a 2 por ejemplo! 💀 Tengan en cuenta que
van a tener que realizar cambios y no solo agregar un nuevo caso de uso con su
respectivo test. A trabajar!

Así quedaron mis tests:

```dart
import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

main() {
  test('substract 1 to 2, results in 1', () {
    // Arrange
    const a = 1;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, 1);
  });
  test('substract 2 to 2, results in 0', () {
    // Arrange
    const a = 2;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, 0);
  });
  test('substract 3 to 2, results in -1', () {
    // Arrange
    const a = 3;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, -1);
  });
  test('substract -1 to -2, results in -3', () {
    // Arrange
    const a = -1;
    const b = -2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, -1);
  });
  test('substract 1.5 to 2, results in 0.5', () {
    // Arrange
    const a = 1.5;
    const b = 2;
    // Act
    var result = substract(a, b);
    // Assert
    expect(result, 0.5);
  });
}
```

Y así quedó mi función:

```dart
num substract(num a, num b) => b - a;
```

Ahora sí! Ya tenemos todo y díganme si realmente no es de enorme ayuda en el
proceso?

Para dejarlo cerradito como un paquete (🎁), nos faltaría alguito más.

## Given Then When

La convención "_Given_ (Dado), _When_ (Cuando) _Then_ (Entonces)" es un enfoque
ampliamente utilizado para escribir casos de prueba en pruebas unitarias. Nos
da una forma estructurada de organizar y escribir casos de prueba que es
realmente muy fácil de entender y seguir. Y lo más importante, es que es una
[convención](), lo que significa que no solamente lo vamos a utilizar nosotros
sino que el resto de la industria también lo usa, por lo que si van a trabajar a
una empresa de primer nivel, ya van a conocer la forma en la que escriben sus tests! 🥳

Funciona así:

1. _Given_: Este paso establece el contexto para el caso de prueba. Establece
   las condiciones iniciales en las que operará la prueba. En pocas palabras, lo
   que ya conocen como _Arrange_.

2. _When_: Este paso define las acciones o eventos que realizará el caso de
   prueba. Representa la operación que desea probar; _Act_.

3. _Then_: Este paso especifica los resultados esperados del caso de prueba.
   Involucra verificar que el código haga lo que le pedimos, lo que ya conocían
   como _Assert_.

Esta convención nos ayuda a garantizar que los casos de prueba sean claros,
concisos y bien organizados. También nos ayuda a pensar en los diferentes
escenarios y casos límite (casos bien raros!) que debe probar, asegurando que el
código esté completamente probado y sea confiable.

💀 Qué les parece entonces si arreglamos todos nuestros tests para utilizar dicha
convención, inclusive en los comentarios que nos ordenan el cuerpo del test?
Nuevamente, vayan a por ello!

```dart
main() {
  test(
      'Given two integers 2 and 1, when 1 is subtracted from 2, then the result should be 1',
      () {
    // GIVEN
    const a = 1;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, 1);
  });

  test(
      'Given two integers 2 and 2, when 2 is subtracted from 2, then the result should be 0',
      () {
    // GIVEN
    const a = 2;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, 0);
  });

  test(
      'Given two integers 2 and 3, when 3 is subtracted from 2, then the result should be -1',
      () {
    // GIVEN
    const a = 3;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, -1);
  });

  test(
      'Given two integers -2 and -1, when -1 is subtracted from -2, then the result should be -3',
      () {
    // GIVEN
    const a = -1;
    const b = -2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, -1);
  });

  test(
      'Given two numbers 2 and 1.5, when 1.5 is subtracted from 2, then the result should be 0.5',
      () {
    // GIVEN
    const a = 1.5;
    const b = 2;

    // WHEN
    var result = substract(a, b);

    // THEN
    expect(result, 0.5);
  });
}
```

💀 Y como no podría ser de otra manera, tienen ya todos los elementos para
actualizar con la misma convención los tests para el `add` y para crear los
faltantes (`multiply` y `divide`). Los espero!

Aquí los de multiplicación:

```dart
import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Given 2 and 1, when multiply is called, then it should result in 2',
      () {
    // Given
    const a = 2;
    const b = 1;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, 2);
  });

  test('Given 2 and -1, when multiply is called, then it should result in -2',
      () {
    // Given
    const a = 2;
    const b = -1;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, -2);
  });

  test('Given -2 and -1, when multiply is called, then it should result in 2',
      () {
    // Given
    const a = -2;
    const b = -1;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, 2);
  });

  test(
      'Given 2.0 and 1.0, when multiply is called, then it should result in 2.0',
      () {
    // Given
    const a = 2.0;
    const b = 1.0;

    // When
    var result = multiply(a, b);

    // Then
    expect(result, 2.0);
  });
}
```

Y aquí los de división:

```dart
import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Given 2 and 1, when divide is called, then it should result in 2', () {
    // Given
    const a = 2;
    const b = 1;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 2);
  });

  test('Given 2 and -1, when divide is called, then it should result in -2',
      () {
    // Given
    const a = 2;
    const b = -1;

    // When
    var result = divide(a, b);

    // Then
    expect(result, -2);
  });

  test('Given -2 and -1, when divide is called, then it should result in 2',
      () {
    // Given
    const a = -2;
    const b = -1;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 2);
  });

  test('Given 2.0 and 1.0, when divide is called, then it should result in 2.0',
      () {
    // Given
    const a = 2.0;
    const b = 1.0;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 2.0);
  });

  test('Given 2 and 0, when divide is called, then it should result in 0', () {
    // Given
    const a = 2;
    const b = 0;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 0);
  });

  test('Given 0 and 2, when divide is called, then it should result in 0', () {
    // Given
    const a = 0;
    const b = 2;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 0);
  });

  test('Given 0 and 0, when divide is called, then it should result in 0', () {
    // Given
    const a = 0;
    const b = 0;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 0);
  });
}
```

Perfecto! Ya veo que les está agarr... 🤔 Imagino habrán probado no solamente su
código y comparado con el mío sino que también habrán escrito el mío y lo habrán
probado no? 💀 Si no lo hicieron, es momento de hacerlo!

Bueno, no pienso entrar en explicaciones matemáticas pero básicamente si ustedes
dividen un número por cero, en Dart el resultado esperado no sería `0` sino
`Infinity`. Por otro lado, si intentamos dividir `0` por `0`, es un resultado
imposible de determinar, lo que Dart aquí representa como `NaN` (_Not a number_;
no es un número).

Dicho esto, si efectivamente corrieron mis tests, deberían haber fallado 2.
Estos son los tests fallidos:

```dart
  test('Given 2 and 0, when divide is called, then it should result in 0', () {
    // Given
    const a = 2;
    const b = 0;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 0);
  });

  test('Given 0 and 0, when divide is called, then it should result in 0', () {
    // Given
    const a = 0;
    const b = 0;

    // When
    var result = divide(a, b);

    // Then
    expect(result, 0);
  });
```

Para el primero de los tests que fallan, podríamos tener muchas soluciones. Yo
elegí explorar en el `result`, que es un `num` (ya vieron que sería la clase
padre de `int` y `double`) y ver qué tenía dentro de sus métodos; descubrí
`isInfinity`. Ese método nos arroja un booleano en `true` si efectivamente es
infinito.

Hasta ahí tenemos el _actual_ o la primera parte del `expect`. Cuál sería el
_matcher_? Resulta que hay _matchers_ ya creados para nosotros:

- _equals_: Determina si dos objetos son iguales usando operator ==.
- _isTrue_, isFalse: Determina si el valor actual es verdadero o falso.
- _isNull_: Determina si el valor actual es nulo.
- _isNotNull_: Determina si el valor actual no es nulo.
- _isInstanceOf_\<T>: Determina si el valor actual es una instancia del tipo T.
- _isA_\<T>: Alias para isInstanceOf\<T>.
- _throwsA_\<Exception>: Determina si la función proporcionada lanza una excepción del tipo especificado.
- _throwsA_(predicate): Determina si la función proporcionada lanza una excepción que satisface el predicado proporcionado.
- _closeTo_: Determina si un número de coma flotante está cerca de un valor dado dentro de una cierta tolerancia.
- _greaterThan_: Determina si un valor es mayor que el valor esperado.
- _lessThan_: Determina si un valor es menor que el valor esperado.
- _contains_: Determina si un iterable o una cadena contiene un valor esperado.
- _hasLength_: Determina si un iterable o una cadena tiene la longitud esperada.

Hay alguno de estos que aun no vamos a utilizar pero ya los voy dejando! 🫣

<!-- TODO -CONT-: explicar el isTrue y luego utilizar el result.isNan de la
misma forma  -->