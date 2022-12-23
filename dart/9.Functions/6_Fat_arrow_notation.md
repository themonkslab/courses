# _Fat arrow notation_

Supongamos que tenemos una función bien simple que lo único que hace es calcular la suma de dos valores, algo así:

```dart
void main() {
  final result = sum(4, 9);
  print(result);
}

int sum(int a, int b) {
  return a + b;
}
```

Podríamos hacer __mucho más concisa la función utilizando _fat arrow notation_ o algo así como una anotación de flecha gorda__: esta forma nos retorna automáticamente sin tener que explicitar el `return` y reemplaza los `{ }` y el `return` por `=>`, de allí su nombre:

```dart
void main() {
  final result = sum(4, 9);
  print(result);
}

int sum(int a, int b) => a + b;
```

Esto sirve para funciones que tengan un solo _statement_ y también puede utilizarse sin tener que retornar nada:

```dart
void main() {
  sum(4, 9);
}

void sum(int a, int b) => print(a + b);
```
