# Operadores lógicos, de igualdad y relacionales

Los _equality and relational operators_ u operadores de igualdad y relacionales nos permiten comparar expresiones. Todos tienen en común que el resultado será un `bool`:

|Significado|Operador|💀 Pruébenlo!|
|---------|:-----:|:-----------:|
|Igual|__`==`__|`print(5==2)`|
|No igual|__`!=`__|`print(5!=2)`|
|Mayor que|__`>`__|`print(5>2)`|
|Menor que|__`<`__|`print(5<2)`|
|Mayor o igual|__`>=`__|`print(5>=2)`|
|Menor o igual|__`<=`__|`print(5<=2)`|

En este caso, utilizamos utilizamos `int` _literals_ pero tengan en cuenta que podemos utilizar las expresiones que queramos y mezclar literales con variables, siempre que sean _compatibles_. 🤨 Fíjense qué pasa si tratan de comparar `print(5 < 2.5);`.

Cómo harían sin embargo, si quisieran comparar múltiples expresiones?

## _Logical operators_

Pueden invertir o combinar _boolean expressions_ (expresiones booleanas: dan como resultado `true` o `false`), utilizando los operadores lógicos:

|Significado|Operador|💀 Pruébenlo!|
|---------|:-----:|:-----------:|
|Invierte la expresión|__`!expr`__|`print(!false)`|
|Retorna `true` si un lado o el otro son `true`. Al encontrar `true` retorna, sin evaluar la expresión siguiente|__`||`__|`print(false||true)`|
|Retorna `true` si ambos lados retornan true|__`&&`__|`print(false&&true)`|

Tienen que tener en cuenta que los operadores relacionales tienen precendencia sobre los lógicos, por lo que estos últimos se evalúan al final y ustedes pueden hacer algo como lo siguiente sin la necesidad de usar paréntesis:

```dart
void main() {
    print(5 > 2 || 5 > 7); // true - observen que no evalúa
                           // la segunda expresión ya que la
                           // primera resulta en true
    print(5 < 2 && 5 > 7); // false
}
```

Si tienen operaciones más complejas, pueden utilizar los `()` para ejecutar lo que se encuentra dentro del paréntesis primero:

```dart
void main() {
    print((5 > 2 || 5 > 7) && 5 == 6); // false
}
```

Además de todos los anteriores, podemos utilizar el _NOT operator_ `!expr`, que luego de que la expresión ha sido evaluada, invierte su valor:

```dart
void main() {
    print(!((5 > 2 || 5 > 7) && 5 == 6)); // false
}
```

## 💪 Validación básica de email

__Requirement__: utilizar lo aprendido para hacer una validación de correo electrónico chequeando que:

1. El correo provisto no esté vacío.
2. El correo provisto contenga '@'.

__Extra__: los `String` tienen un método llamado 'isNotEmpty' que arroja `true` si dicho `String` no se encuentra vacío ya que podríamos declarar un `String` vacío (sin caracteres dentro aunque no nulo), de la siguiente manera: `String myEmptyString = '';`.

__💀 Solución__:

```dart
void main() {
  String email = 'test@example.com';
  print(
      'Is email \'$email\' valid?: ${email.isNotEmpty && email.contains('@')}'); //
}
```
