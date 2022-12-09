# _For loop_

Este tipo de bucle sirve para lograr lo mismo que el _while loop_ pero de forma más concisa.

Veamos cómo sería la solución del ejercicio anterior pero implementado con un _for loop_:

```dart
void main() {
    const block = 'x';
    for(var i = 1; i < 10; i++) {
        print(block*i);
    }
    print('Done');
}
```

Fíjense que de esta forma, nos lleva un par de líneas menos aun! Pero cómo funciona?

1. Declaramos e inicializamos la variable: `var i = 1;`.
2. Establecemos la condición que se tiene que cumplir para salir del bucle: `i < 10;`.
3. Definimos cuál será el incrementador: `i++`.

Así, lo que está dentro del bucle (dentro de las `{...aquí...}`) se ejecutará hasta que la condición que hayamos establecido, resulte en `true`.

Tendríamos de esta manera un diagrama parecido al anterior solo que en este caso nuestro _for loop_ pide de forma explicita la actualización (incrementación en este caso) de la variable inicializada:

![Diagrama for loop](https://raw.githubusercontent.com/themonkslab/courses/main/dart/4.Flujo_de_control/4.1_for_loop_diagrama.png)

## 💪 Fizz buzz

Este es un tipo de ejercicio muy común en entrevistas de trabajo. Incluye no solo lo que ya conocen sino también un poco de aritmética. Que se diviertan

__Requirement__: Escribir un programa que implemente el algoritmo 'fizz buzz':

Para un contador (`i`) que vaya desde 1 a 15
    si `i` es divisible por 3 y 5
        `print` 'fizz buzz'
    si `i` es divisible por 3
        `print` 'fizz'
    si `i` es divisible por 5
        `print` 'buzz'
    sino
        `print i`

__Clue__ (pista): van a tener que utilizar el _modulus operator_ (%) y el _logical AND operator_ (&&).

---

__💀 Solución__:

```dart
void main() {
    for(var i = 1; i <= 15; i++ ) {
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
}
```
