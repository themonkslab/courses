# Flow analysis

Volvamos al ejemplo anterior y en lugar de inicializar la variable `x` como nula explícitamente, solo declarémosla. Esto hará que Dart por defecto, asigne _null_ a dicho valor:

```dart
void main() {
    int? x;
    int y = 5;
    print(x + y);
}
```

Ahora qué pasaría si nosotros luego le asignamos un valor y tratamos de correr nuestra app?

```dart
void main() {
    int? x;
    int y = 5;
    x = y - 1;
    print(x + y);
}
```

Como pueden ver, ya Dart no nos avisa nada y cuando ejecutamos, no tenemos ningún error. Esto es porque __Dart pudo analizar el código darse cuenta que a `x` ya le asignamos un valor. Esto se llama _Flow Analysis_.__

Pero esto puede hacerlo de forma aun más inteligente y decidir el cambio de tipo de una variable! 🤨 Cómo?

## _Promotion_

Vamos a imprimir la suma solamente si `x` no es nulo; caso contrario avisaremos con un `print` al usuario de que `x` es `null`:

```dart
void main() {
    int? x;
    int y = 5;
    if (x == null) {
        print('x is null');
    } else {
        print(x + y);
    }
}
```

En este caso, Dart es lo suficientemente inteligente para darse cuenta que hemos previsto que `x` puede ser `null` y agregamos un `if` para prevenirlo y por ello no nos avisa nada! Por el otro lado, también tiene en cuenta que __dentro de `else`, no existe posibilidad de que nuestra variable sea nula, por lo que 'promueve' a dicha variable y la convierte en un valor no nulleable__ Qué maravilla! 😍

Y esto sigue!

## _Definite assignment_

Supongamos que estamos en la entrada de una disco virtual (en Argentina se les llama 'boliches') y queremos responder a quien quiere entrar, si puede o no hacerlo en función de si es mayor o no de edad. Cómo lo haríamos? 💀 Qué pasaría con el siguiente ejemplo?

```dart
void main() {
    int age = 19;
    String message;
    if (age >= 18) {
        message = 'You can enter';
    }
    print(message);
}
```

_The non-nullable local variable 'message' must be assigned before it can be used._ Dice que tenemos que asignarle un valor a nuestra variable antes de poder utilizarla! Qué tal entonces haciendo esto:

```dart
void main() {
    int age = 19;
    String message;
    if (age >= 18) {
        message = 'You can enter';
    } else {
        message = 'You cannot enter';
    }
    print(message);
}
```

__Dart__ ya no nos arroja un error ya que __puede, mediante su sistema de análisis, saber que la variable ha sigo asignada de forma definitiva__ en nuestro `if/else` y esto es _definite assignment_

Pero antes de terminar, yo sé que ustedes saben que he escrito el ejemplo de esta forma para explicarles sobre _null safety_ pero cómo podríamos hacerlo más suscinto y bello? 💀 Cómo sería el ejemplo anterior utilizando un _ternary operator_?

```dart
void main() {
    int age = 19;
    String message = age >= 18 ? 'You can enter' :  'You cannot enter';
    print(message);
}
```
