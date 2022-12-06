# Nuevos operadores y _statement_

## _Collection-if_

Supongamos que queremos agregar condicionalmente algo a una lista. Lo podríamos hacer así:

```dart
void main() {
  final listOfColors = ['green', 'yellow'];
  const addBlue = false;
  const addRed = true;
  if (addBlue) {
    listOfColors.add('blue');
  }
  if (addRed) {
    listOfColors.add('red');
  }
  print(listOfColors);
}
```

Podemos ver dos cosas:

1. Que utilizamos `listOfColors` en lugar de lo que parecería más lógico, `colors`. El motivo es que resulta luego mucho más fácil de leer cuando empezamos a utilizar las variables individuales, como `color` en este caso: desde el comienzo de la palabra podemos identificar de qué variable se trata sin tener que ir hasta el final. 😒 Obsesivos nosotros? 🤣
2. Se podría hacer más simple utilizando _collection-if_:

```dart
void main() {
  final listOfColors = ['green', 'yellow'];
  const addBlue = false;
  const addRed = true;
  if (addBlue) {
    listOfColors.add('blue');
  }
  if (addRed) {
    listOfColors.add('red');
  }
  print(listOfColors);
  //
  // Vean cómo logramos lo mismo de manera más simple
  //
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
  ];
  print(coolListOfColors);
}
```

Noten que no es un `if` _statement_ ya que no podrían aplicarlo aquí sino un tipo nuevo de _statement_!

## _Collection-for_

Vamos a partir limpiando un poco el código anterior y suponiendo que quisiéramos agregar los valores de otro listado de colores al previo:

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
  ];
  final extraColors = ['grey', 'brown'];
  print(coolListOfColors);
}
```

Podríamos utilizar el método de las `List` llamado __`addAll()`, que nos permite agregar todos los valores de una colección a otra__:

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
  ];
  final extraColors = ['grey', 'brown'];
  coolListOfColors.addAll(extraColors);
  print(coolListOfColors);
}
```

Si bien este método también es muy simple, necesitamos utilizarlo una vez que nuestra lista ya fue inicializada. Para hacer lo mismo pero en una inicialización, utilizamos _Collection-for_:

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  final extraColors = ['grey', 'brown'];
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    for (var color in extraColors) color,
  ];
  print(coolListOfColors);
}
```

## _Spread operator_

No sería hermoso poder poner en lugar de ese _Collection-for_ directamente la variable `extraColors`? Sucede que si hiciéramos eso, estaríamos agregando la lista y no sus elementos. Para poder hacerlo, tenemos que usar este operador: `...`. __El _spread operator_ o llamado algo así como operador de difuminación, nos permite retornar todos los elementos de la lista pero como valores independientes.__:

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  final extraColors = ['grey', 'brown'];
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    ...extraColors,
  ];
  print(coolListOfColors);
}
```

## _Composable_

Todos los operadores y declaraciones que vimos en este artículo, __son _composable_, quiere decir que pueden combinarse:__

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  const addExtraColors = true;
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    if(addExtraColors)
    ...['brown', 'grey'],
  ];
  print(coolListOfColors);
}
```

## También con `Set` y `Map`

Todas estas _collections_ y _operators_ que aprendimos, también pueden utilizarse en los otros tipos de colecciones:

```dart
void main() {
  const addBlue = false;
  const addRed = true;
  const addExtraColors = true;
  final coolListOfColors = [
    'green',
    'yellow',
    if (addBlue) 'blue',
    if (addRed) 'red',
    if (addExtraColors) ...['brown', 'grey'],
  ];
  print(coolListOfColors);
  const ratings = [4.0, 4.5, 3.5, 4.4, 5.0];
  final restaurant = {
    'name': 'Loving Hut',
    'cuisine': 'Vegan Fast Food',
    if (ratings.length > 3) ...{
      'ratings': ratings,
      'isPopular': true,
    },
  };
  print(restaurant);
}
```

## 💪 Shopping List

__Requirement__: reescribir el siguiente código utilizando _collection-if_, _collection-for_ y _spread_, consiguiendo el mismo output.

```dart
void main() {
  const bananas = 5;
  const apples = 6;
  const grains = {
    'pasta': '500g',
    'rice': '1kg',
  };
  const addGrains = true;
  var shoppingList = {};
  if (bananas > 0) {
    shoppingList['bananas'] = bananas;
  }
  if (apples > 0) {
    shoppingList['apples'] = apples;
  }
  if (addGrains) {
    shoppingList.addAll(grains);
  }
  print(shoppingList);
  // {bananas: 5, apples: 6, pasta: 500g, rice: 1kg}
}

```

---

__💀 Solución__:

```dart
void main() {
  const bananas = 5;
  const apples = 6;
  const grains = {
    'pasta': '500g',
    'rice': '1kg',
  };
  const addGrains = true;
  final Map<String, dynamic> shoppingList = {
    if(bananas > 0) 'bananas': bananas,
    if(apples > 0) 'apples': apples,
    if(addGrains) ...grains,
  };
  print(shoppingList);
}
```
