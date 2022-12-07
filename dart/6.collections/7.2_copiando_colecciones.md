# Copiando colecciones

Supongamos que tenemos una `List<int>` y queremos hacer una copia de ella. La forma que se nos viene primero a la mente, podría ser algo así verdad?

```dart
void main() {
    final firstList = [0,1,2];
    final secondList = firstList;
}
```

Sonaría lógico cierto? 💀 Vayan a probar lo siguiente para luego tratar de explicar cuál es el problema:

```dart
void main() {
    final firstList = [0,1,2];
    final secondList = firstList;
    secondList[0] = 1;
    print('firstList: $firstList');
    print('secondList: $secondList');
}
```

Cuando cambiamos el valor de nuestra segunda lista también cambiamos el de la primera? 😳 Qué sucedió? Son acaso la misma lista? Vamos a probarlo:

```dart
void main() {
    final firstList = [0,1,2];
    final secondList = firstList;
    assert(firstList == secondList);
    secondList[0] = 1;
    print('firstList: $firstList');
    print('secondList: $secondList');
}
```

Como podrán ver, nuestra _assertion_ nos afirma que ambas listas son iguales! Qué pasó? En realidad, copiando la lista como lo hicimos, esto es a través de la variable `firstList`, lo que estamos haciendo en realidad es:

1. Primero creamos una lista llamada `firstList`.
2. Esa lista se guarda en memoria y nuestra variable es una referencia a dicho espacio de memoria.
3. Utilizamos dicha variable para inicializar una segunda lista.
4. Nuevamente esa segunda lista es una referencia pero no a un espacio de memoria nuevo sino al anterior que creamos.

Bien! 💀 Quiero que se pongan a pensar en formas de copiar una lista utilizando todo lo aprendido en el capítulo de 'Nuevos operadores y statements'. También, agreguen un `assert` que solo salte si las listas son iguales. Luego de que vayan e intenten, he aquí la solución:

__Solución 1__:

```dart
void main() {
  final firstList = [0, 1, 2];
  final secondList = [
    for (var index in firstList) index,
  ];
  assert(firstList != secondList, 'Lists should be different');
  secondList[0] = 1;
  print('firstList: $firstList');
  print('secondList: $secondList');
}
```

__Solución 2, más concisa y bella__:

```dart
void main() {
  final firstList = [0, 1, 2];
  final secondList = [...firstList];
  assert(firstList != secondList, 'Lists should be different');
  secondList[0] = 1;
  print('firstList: $firstList');
  print('secondList: $secondList');
}
```
