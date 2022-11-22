# Afirmaciones o _assertions_

Dijimos que íbamos a aprender desde el principio cómo escribir código desde los tests, desde el final del código al principio, con el objetivo de ahorrarnos muchos problemas a futuro.

A medida que avanzamos en el curso, no solamente tratamos de instalar en nuestras mentes la forma de hacerlo sino que vamos aprendiendo herramientas nuevas que nos permiten hacerlo mejor y este es el caso de las _assertions_.

Las _assertions_, __son un _statement_,__ una pieza de código que va a hacer algo. Lo que hace es __evaluar una condición__ y arrojando si dicha condición es __verdadera o falsa__: __si es falsa, corta la execución del programa__ y lanza una excepción o _exception_ (errores que indican que sucedió algo que no esperábamos sucediera).

Qué creen que sucederá con las siguientes líneas? 💀 Se animan a preveer cuáles van a lanzar excepciones?

1. `assert(1 < 100)`.
2. `assert(101 < 100)`
3. `assert(true)`
4. `assert(false)`
5. `assert(1 == 1)`
6. `assert('Mauro' == 'Mauro')`
7. `assert(null == null)`
8. `assert('Mauro' != 'Mauro')`
9. `assert(1 != 2)`

__💀 Soluciones__:

1. `assert(1 < 100)`.
2. `assert(101 < 100)` // Exception
3. `assert(true)`
4. `assert(false)` // Exception
5. `assert(1 == 1)`
6. `assert('Mauro' == 'Mauro')`
7. `assert(null == null)`
8. `assert('Mauro' != 'Mauro')` // Exception
9. `assert(1 != 2)`

Perfecto! Ahora que ya vamos entendiendo un poquito más, puedo contarles que además podemos especificar qué queremos que diga cuando la evalución resulta en _false_. Sin embargo, vamos a ponerlo en contexto para que veamos su enorme utilidad.

Supongamos que estamos haciendo una aplicación que solamente pueden ver quienes sean mayores de edad. Entonces podríamos hacer un _assertion_ para que lance una _exception_ si el usuario es menor de edad e intenta ingresar a la página:

```dart
void main() {
    int userAge = 15;
    int ageLimit = 18;
    assert(userAge >= ageLimit, 'User must have at least 18 years' ); // El usuario tiene que tener por lo menos 18 años.
}
```

Si ejecutan este código, van a observar que salta la excepción pero con el texto que nosotros introdujimos. Esto es muy útil y cada vez nos vamos acercando más a la creación de tests reales! 😄
