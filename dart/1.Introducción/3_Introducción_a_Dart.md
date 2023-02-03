# Introducción a Dart

Vamos a dar una breve introducción sobre Dart para luego a lo largo del curso, ir adentrándonos en mayor detalle.

## 🎯 Qué significa _dart_

Es una palabra en inglés que significa 'dardo' y no fue elegida casualmente sino que está relacionada directamente a lo que el equipo de Google intentaba lograr creando este lenguaje. Por cada característica, piensen primero en el objeto y luego les voy a explicar su correspondencia en el lenguaje:

1. __Precisión__: el lenguaje debía estar optimizado al máximo posible para ofrecer la mayor cantidad de ventajas con la menor cantidad de recursos, haciéndolo posible de usar por un público mayor.
2. __Velocidad__: el lenguaje tenía que ser minimalista y correr rápido.
3. __Fuerte__: el lenguaje debía permitir sostener estructuras cada vez más complejas pero mantenerse de forma fácil.
4. __Modificable__: el lenguaje tenía que poder permitirle al desarrollador transformar lo que estaba creando de forma rápida.
5. __Popular__: el lenguaje tenía que ser usado por muchos desarrolladores y así asegurar su constante crecimiento y evolución.

Todo lo anterior ha sido logrado en este maravilloso lenguaje y através de las características que vamos a ir nombrando ahora.

## 👮🏽 _Type safe_

También llamado fuertemente tipado o de seguridad de tipo, significa que __las únicas operaciones que se pueden realizar sobre los datos en el lenguaje, son las permitidas por el tipo de los datos.__

Esto significa que si el dato es de tipo `X` y ese tipo no soporta un método `f`, entonces el lenguaje no nos va a permitir realizarlo. Eso nos ahorra un montón de problemas y errores antes siquiera, de escribirlos!

Por ejemplo si tenemos un dato que es un número, no podemos aplicarle un método que nos permita pasar un texto a mayúsculas.

Pero cómo logra esto?

## ☑️ _Checks_ y _sound type system_

Mediante un __sistema de comprobaciones de dos tipos: _static type check_ o de chequeo estático antes de compilar__ el programa (antes de que lo preparemos para ejecutar) __o mediante _runtime check_ o de chequeo en tiempo de ejecución, mientras estamos corriendo el programa.__

Y __lo anterior mediante un _sound type system_ o sistema sonorizado!__ 😒 Qué? Básicamente significa que se va a encargar de __hacernos dar cuenta de los errores__ y si bien no va a producir sonidos va a producir diferentes tipos de alertas para que sepamos en todo momento qué estamos haciendo de forma incorrecta.

Pero cómo realiza estas comprobaciones? Cómo sabe de qué tipo se trata?

## 🔍 _Type inference_

O __inferencia de tipo, significa que Dart tiene la posibilidad de entender de qué tipo estamos hablando__, casi, en todo momento, a través de su propio _static analyzer_ o sistema de análisis.

Esto significa que si no decimos de qué tipo de dato se trata, Dart intentará dar con el tipo de dato preciso y sino, durante tiempo de ejecución le asignará uno dinámico llamado, ejem, _dynamic_ aunque si aun allí no encuentra ningún tipo, le asignará uno del tipo nulo, aunque no es algo que queramos en la mayoría de los casos y para ello, estos genios de Google agregaron...

## 📢 _Sound Null Safety_

Debido a que nos avisará con bombos y trompetas, nos vamos a dar cuenta de la premisa más importante en este tópico y es que __ningún dato puede ser nulo o vacío a no ser que explícitamente así lo definamos.__

Sepan que esto los va a molestar seguido pero es algo que podrán ir entendiendo de forma gradual, sección a sección hasta llegar específicamente a una  destinada absolutamente a ello. Cuando se topen con algún problemita, le den vuelta una o dos veces y no encuentren su porqué, piensen en nulidad, null safety, y todo lo que conocen hasta el momento y absténgase de insultar a familiares cercanos! (Dicho esto desde la propia experiencia en mis primeras veces con el asunto) 🤣

Y esto se va a mantener al momento de ejecutar nuestro programa y antes incluso, a la hora de compilarlo.

Compi... qué?

## 🚧 _Compile_

__Compilar es convertir el código fuente que escribimos a lenguajes específicos de específicas plataformas__. En nuestro caso (estoy hablando de desarrolladores Flutter), tenemos la mágica posibilidad de lograr que el mismo código fuente compile o se pueda ejecutar en todas las plataformas 🤩: Android, iOS, Mac, Windows, Linux y Web!

Si compilamos para todos salvo web, Dart utiliza dos formas de compilar, cada una utilizada en una etapa de desarrollo distinta:

### Etapa de desarrollo y _JIT_ o _Just in Time Compiler_

__La etapa de desarrollo, en donde escribimos el código__ y esperamos que este se puede probar rápidamente, nos prevenga de errores, tengamos métricas y sea fácil de testear.

En __desarrollo, Dart utiliza la forma de compilar llamada _JIT_ que refiere a solo en el tiempo y significa que compila solo el código que necesita y cuando lo necesita.__

Además, este mismo proceso se encarga de no recompilar partes del código si éstas no cambiaron! Una hermosa locura!

### Etapa de producción y _AOT_ o _Ahead of Time Compiler_

__La etapa de producción es aquella donde el código se ejecuta, donde el usuario lo utiliza__.  Allí, esperamos que nuestra aplicación arranque rápidamente, se ejecute rápidamente y sea estable pero no necesitamos ninguna de las características que sí necesitamos cuando desarrollamos.

Por estas razones, __aquí Dart utiliza _AOT_ o compilación antes de tiempo__.

En el caso de producir código web, Dart utiliza herramientas y procesos similares pero con nombres distintos que ya veremos en el futuro!
