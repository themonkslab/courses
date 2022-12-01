# _List methods_

Vamos a recorrer métodos muy útiles que nos provee esta clase o tipo.

## _isEmpty_ o _isNotEmpty_

Nos permite __chequear si la lista está vacía o no__. En nuestro ejemplo anterior pueden probarlo:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    print(cities.isEmpty);
    print(cities.isNotEmpty);
}
```

Y también pueden hacerlo más claro, creando una _list literal_ vacía:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    print(cities.isEmpty); // false
    print(cities.isNotEmpty); // true
    assert(cities.isNotEmpty); // Para no olvidarnos de los asserts! 😉
    print([].isEmpty); // true
    print([].isNotEmpty); // false
}
```

## _Length_

Nos permite obtener la __cantidad de elementos__ que tiene dicha lista:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    print(cities.length); // 3
}
```

## _First_ y _last_

Nos permite __obtener el primer y último elemento__ de la lista:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    print(cities.first); // 'Cordoba'.
    print(cities.last); // 'Paris'.
}
```

💀 Recuerdan qué sucedía si buscábamos un elemento a través de un _index_ que no estaba dentro del rango de la lista? Prueben qué sucede si buscan con estos dos métodos en una lista vacía, así: `print([].first)` o `print([].last)`.

Exacto: un error que nos dice que dicho elemento no existe.

## _Add_ e _insert_

Podemos __agregar valores a una lista__ de las siguientes dos maneras. __La primera lo agrega luego del último elemento__ de la lista:

```dart
void main() {
    var cities = ['Coirdoba', 'New York', 'Paris'];
    cities.add('Moscow');
    print(cities); // ['Cordoba', 'New York', 'Paris', 'Moscow']
}
```

__La segunda__, nos permite __decidir en qué lugar__ insertamos dicho valor y para ello nos pide como primer _argument_ (argumento), el índice en donde queremos colocarlo y luego el valor; recuerden que empezamos a contar en las listas, desde el 0:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    cities.insert(1, 'Moscow');
    print(cities); // ['Cordoba', 'Moscow', 'New York', 'Paris']
}
```

## _RemoveAt_ y _clear_

Como podemos agregar valores, también podemos eliminarlos. Para __remover valores__ de una lista, utilizamos el __método _removeAt_ con el _index_ para indicar de qué valor se trata__:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    cities.insert(1, 'Moscow');
    print(cities); // ['Cordoba', 'Moscow', 'New York', 'Paris']
    cities.removeAt(2);
    print(cities); // ['Cordoba', 'Moscow', 'Paris']
}
```

Y si quisiéramos __borrar completamente todos los valores__ de una lista, podemos utilizar el método `clear`:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    cities.insert(1, 'Moscow');
    print(cities); // ['Cordoba', 'Moscow', 'New York', 'Paris']
    cities.removeAt(2);
    print(cities); // ['Cordoba', 'Moscow', 'Paris']
    cities.clear();
    print(cities);
}
```

## _Contains_ e _indexOf_

Si quisiéramos saber __si un elemento se encuentra dentro de nuestra lista, utilizamos _contains_:__

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    cities.insert(1, 'Moscow');
    print(cities.contains('Moscow')); // true
}
```

Pero si además quisiéramos saber __en qué posición se encuentra? Utilizamos _indexOf_:__

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    cities.insert(1, 'Moscow');
    print(cities.indexOf('Moscow')); // 1
}
```

## 💪 _Guess_

__Requirement__: tienen que calcular si el siguiente _assertion_ va a dar `true` o `false`, osea si va a pasar de largo o va a fallar.

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris', 'Moscow', 'Rome'];
    var newCities = ['Buenos Aires', 'Washington', 'Marsella', 'San Petesburgo', 'Milan'];
    if(cities.contains('New York')) {
        cities.add(newCities[cities.indexOf('Moscow')]);
    }
    for(var i = 0; i < newCities.length; i++) {
        if(i == 3) cities.insert(1, newCities[i+1]);
    }
    assert(cities.contains('Milan'));
}
```

__💀 Solución__:

El _assertion_ o afirmación y lo hago medio largo a esto así no pueden ver tan fácilmente la solución y de verdad espero estén haciendo el cálculo (🤣), resulta en...

...

...

😅

... `true`, por lo que no salta ningún error!
