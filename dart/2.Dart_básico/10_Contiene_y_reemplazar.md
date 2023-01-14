# Contiene y reemplazar

Supongamos que el ajo no me hace muy bien y __quiero elaborar una app__ que lea los ingredientes de una receta en un menú y pueda decirme si tiene o no ajo. __Podríamos empezar escribiendo los pasos para elaborarla__, de la siguiente manera:

1. Crear una variable que almacene si la receta tiene o no ajo.
2. Crear una variable para la receta.
3. Guardar la receta en la variable.
4. Chequear si la receta contiene la palabra ajo.
5. Asignar la respuesta del chequeo del paso previo a nuestra variable que nos dice si tiene ajo o no.
6. Imprimir en consola el resultado de comprobar si la receta tiene ajo o no, segun la variable creada.

Esto que acabamos de hacer recibe el nombre de __Pseudo code__ y es una metodología que nos permite __representar los pasos__ para crear un algoritmo o solucionar un problema, __de forma coloquial o corriente__. Desde aquí, lo único que tenemos que hacer, es traducirlo a código! Vamos a ir haciendo esa conversión de a poquito y yendo de atrás hacia adelante, siguiendo nuestra __estrategia de crear desde los tests o desde qué deberíamos tener cuando nuestro programa esté terminado__.

El objetivo final es '6. Imprimir en consola el resultado de comprobar si la receta tiene ajo o no, según la variable creada'. Se vería algo así:

```dart
void main() {
    print('Contains \'garlic\': $containsGarlic');
}
```

Como ya vieron, esto nos da un error porque la variable _containsGarlic_ (contieneAjo),  aun no ha sido declarada ni inicializada y esta es la forma en la que vamos creando desde el final: sabemos que nuestro paso entonces es crear dicha variable.

```dart
void main() {
    bool containsGarlic;
    print('Contains \'garlic\': $containsGarlic');
}
```

Ahora nos tira otro error: _'The non-nullable local variable 'containsGarlic' must be assigned before it can be used.'_ Dice que la variable local no nulleable (no puede estar vacía) debe estar asignada antes de ser utilizada. Sin embargo, antes de asignarle un valor, tenemos que chequear si la receta contiene o no ajo. Observen cómo __de esta forma, es más bien Dart que nos va guiando qué código escribir__.

## _Contains_ o contiene

Para hacerlo, podemos utilizar otro método propio de este tipo de _primitive object_ (objeto primitivo) que ya conocemos, llamado `String`. Primero, guardamos la receta en una variable:

```dart
void main() {
    bool containsGarlic;
    String recipe = '''
Vegan Pizza without TACC
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil
''';
    print('Contains \'garlic\': $containsGarlic');
}
```

Sigue quejándose de la misma forma así que vamos a resolverlo utilizando el método _contains_. Este método __se encarga de buscar dentro de nuestras cadenas de texto el patrón que decidamos y nos devuelve o retorna un valor booleano__: es verdadero o falso que nuestro texto contiene dicho patrón. En el siguiente caso, si solamente tuviéramos la receta, sería algo así:

```dart
void main() {
    print('''
Vegan Pizza without TACC
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil
'''.contains('garlic'));
}
```

Vieron? Respondió que no contiene la palabra _'garlic'_ ('ajo') aunque yo no estoy convencido de que realmente funcione. 💀 Prueben con otras palabras y vean si el método funciona.

Como pudieron comprobar, salvo un caso 🤨, funciona a la perfección. Sin embargo, recuerden que nosotros tratamos de escribir código para personas además de computadoras, por lo que vamos a retomar nuestro enfoque inicial y reescribirlo de forma tal que sea más simple de entender :

```dart
void main() {
    bool containsGarlic;
    String recipe = '''
Vegan Pizza without TACC
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil
''';
    containsGarlic = recipe.contains('garlic');
    print('Contains \'garlic\': $containsGarlic');
}
```

De esta manera, nuestro código se entiende sin tener que explicar cómo está escrito pero... qué caso no estaríamos cubriendo? 💀 Lo siguiente que van a ver, debería dejar en claro qué nos faltó. Sin embargo, para entenderlo del todo, deben saber qué hace el operador '||'.

## El operador || (OR)

Va a retornar el primer _true_ que encuentre. Si de analizar la primer operación resulta un _true_, ya no continua y retorna ese valor; si la primera da _false_, continua a la siguiente y solamente retorna _false_ si todas dieron como resultado _false_. No se preocupen que esto lo veremos luego, aunque me gusta ir mostrándole estas cosas de apoquito, con el uso.

```dart
void main() {
    bool containsCheese;
    String recipe = '''
Vegan Pizza without TACC
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil
''';
    containsCheese = recipe.contains('Cheese') || recipe.contains('cheese');
    print('Contains \'Cheese\' or \'cheese\': $containsCheese');
}
```

Exacto! Estábamos buscando una palabra toda en minúsculas pero ya vimos que de empezar la oración con dicha palabra, podría estar en mayúsculas y nos perderíamos del ingrediente. Además, por supuesto puede haber errores en la receta y decir _'gralic'_ en lugar de _'garlic'_ por lo que en el futuro van a ver formas más avanzadas de chequear. 💀 Bien! Anímense solitos y solitas a escribir el ejemplo final!

```dart
void main() {
    bool containsGarlic;
    String recipe = '''
Vegan Pizza without TACC
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil
''';
    containsGarlic = recipe.contains('Garlic') || recipe.contains('garlic');
    print('Contains \'Garlic\' or \'garlic\': $containsGarlic');
}
```

Bien! Qué pasa si fueron ustedes los que escribieron esta receta y no solo listaron ingredientes sino que luego, explicaron cómo utilizarlos, algo que les podría haber llevado mucho tiempo y, finalmente, luego de mucho esfuerzo se dieron cuenta que en realidad, en lugar de llevar _'Arugula'_ ('rúcula'), llevaba _'Spinach'_ ('espinaca')?

## _Replace_ o reemplazar

Podríamos __buscar el _Pattern_ (patrón) que representa a esa palabra y reemplazarlo__ y eso es básicamente lo que hace el método. Primero, cómo se vería el problema:

```dart
void main() {
    String recipe = '''
Vegan Pizza without TACC
------------------------

Ingredients
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil

Steps to reproduce
---
1. Put arugula into it.
2. Then do a particular thing with arugula.
3. After that, do much more things with the arugula.
4. Finally, eat the arugula... and the pizza!
''';
    print(recipeWithSpinach);
}
```

Aquí podemos ver una recomendación en azul y un error en rojo. 💀 Solucionaremos los dos de una vez aunque con los conocimientos que ya tienen (_tip_: recuerden que si colocan un '.' luego de la variable `String`, les aparecen una lista de métodos; busquen _replaceAll_) pueden tratar de entender cómo funciona ese método e intentarlo ustedes mismos! Vale la pena probar!

💀 Algo más antes de que vean la solución: recuerden que la palabra puede empezar con mayúsculas o minúsculas:

```dart
void main() {
  String recipe = '''
Vegan Pizza without TACC
------------------------

Ingredients
---
Dehidrated tomatos
Vegan cheese
Arugula
Olive oil

Steps to reproduce
---
1. Put arugula into it.
2. Then do a particular thing with arugula.
3. After that, do much more things with the arugula.
4. Finally, eat the arugula... and the pizza!
''';
  String recipeWithSpinach = recipe.replaceAll('Arugula', 'Spinach');
  recipeWithSpinach = recipeWithSpinach.replaceAll('arugula', 'spinach');

  print(recipeWithSpinach);
}
```

Fíjense que tienen una enorme cantidad de métodos a disposición para el tipo `String`! Pruébenlos! También les recomiendo se sumen a nuestro [Discord](https://discord.gg/vpPVf7guPC) en donde van a encontrar más ejercicios!
