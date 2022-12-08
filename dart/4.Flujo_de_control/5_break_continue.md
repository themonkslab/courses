# _Break_ y _continue statements_

_Break_ (parar) y _continue_ (continuar), son dos mecanismos con los que contamos para alterar el flujo dentro de _for_ y _while_ _loops_.

Vamos a utilizar el último ejercicio con algunas alteraciones:

1. Vamos a cambiar la condición para que vaya hasta 16.
2. Vamos a agregar un `print('Done!')` al final, por fuera del loop.

```dart
void main() {
    for(var i = 1; i <= 16; i++ ) {
        if(i % 3 == 0 && i % 5 ==0) {
            print('fizz buzz');
        } else if(i % 3 == 0) {
            print('fizz');
        } else if(i % 5 == 0) {
            print('buzz');
        } else {
            print(i);
        }
    }
    print('Done!');
}
```

## _Break_

Nos permite __parar, salir__ del _loop_. Si agregamos un _break_ apenas comienza el bucle, qué ocurre? Sale e imprime _Done!_ Además, pueden observar que Dartpad entiende que el código dentro del loop no se va a ejecutar y es lo suficientemente amable para decirnos que es código muerto (_death code_), con un subrayado.

```dart
void main() {
    for(var i = 1; i <= 16; i++ ) {
        break;
        if(i % 3 == 0 && i % 5 ==0) {
            print('fizz buzz');
        } else if(i % 3 == 0) {
            print('fizz');
        } else if(i % 5 == 0) {
            print('buzz');
        } else {
            print(i);
        }
    }
    print('Done!');
}
```

Si en cambio ahora movemos el _break_ dentro del primer _if_ y luego del `print`, podemos ver que imprime todo menos el número 16:

```dart
void main() {
    for(var i = 1; i <= 16; i++ ) {
        if(i % 3 == 0 && i % 5 ==0) {
            print('fizz buzz');
            break;
        } else if(i % 3 == 0) {
            print('fizz');
        } else if(i % 5 == 0) {
            print('buzz');
        } else {
            print(i);
        }
    }
    print('Done!');
}
```

## _Continue_

Cuando insertamos esta declaración, obligamos al _loop_ a __saltar a la próxima iteración (`i++`)__. Vamos a insertarlos en nuestro ejercicio:

```dart
void main() {
    for(var i = 1; i <= 16; i++ ) {
        if(i % 3 == 0 && i % 5 ==0) {
            print('fizz buzz');
            break;
        } else if(i % 3 == 0) {
            print('fizz');
            continue;
        } else if(i % 5 == 0) {
            print('buzz');
            continue;
        } else {
            print(i);
        }
    }
    print('Done!');
}
```

En este caso, pueden ver que no cambia nada ya que si bien al llegar a nuestro primer _continue_, avanza a la siguiente iteración, nuestros `else if` hacen más o menos lo mismo porque una vez entrando a uno de ellos, no puedo entrar al resto debido a que no cumplen con la condición. Qué tal si los removemos?

```dart
void main() {
    for(var i = 1; i <= 16; i++ ) {
        if(i % 3 == 0 && i % 5 ==0) {
            print('fizz buzz');
            break;
        }
        if(i % 3 == 0) {
            print('fizz');
            continue;
        }
        if(i % 5 == 0) {
            print('buzz');
            continue;
        }
        print(i);
    }
    print('Done!');
}
```

Ahora obtenemos el mismo resultado que antes lográbamos con los `else if` pero gracias a a la utilización de los `continue`.

__Para comprender este y cualquier tipo de _loop_,__ solamente tienen que relajarse y __avanzar iteración por iteración__ y viendo qué sucede en cada vuelta.

__Tanto _break_ como _continue_ no son siempre necesarios__: en nuestro ejemplo podemos lograr lo mismo de manera más bella y simple con `else if`. __Utilícenlos solo cuando los necesiten.__
