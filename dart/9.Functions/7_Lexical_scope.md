# _Lexical Scope_

_Scope_ significa ámbito y _lexical scope_ se refiere al ámbito léxico, a los __diferentes lugares de nuestro código y el acceso que tendremos a ellos.__ Así encontramos dos tipos de _scope_.

## _Inner scope_

Es el ámbito interno. Interno de qué? De aquel que definimos mediante `{ ... inner scope ... }`. Es el bloque de código dentro de un par de llaves. Vamos a verlo con un ejemplo.

Supongamos que declaramos e inicializamos la variable `a` con un valor de `'dentro del scope de main'`. Podemos imprimir esa variable dentro del `main` pero qué sucede si intentamos declarar otra variable por fuera utilizándola?

```dart
void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
}

const b = a; // Undefined name 'a'.
```

Exacto! Nos dice que esa variable no está definida ya que lo hicimos dentro del _scope_ del `main`. Podríamos sin embargo, utilizarla dentro de un _scope_ interno a su vez, del `main`:

```dart
void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
  }
}
```

Sin embargo qué pasaría si intentáramos utilizar `b` fuera del if? 💀 Vayan a probarlo! Ah! Una aclaración: a veces en Monkslab, utilizamos emojis en ciertos `print` ya que nos permite diferenciar rápido entre valores parecidos!

```dart
void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
  }
  print(b); // Undefined name 'b'.
}
```

Nuevamente exacto: `b` no está definido sino dentro del _scope_ del `if` y por lo tanto no podemos utilizarlo! Y qué sucedería si intentáramos, dentro del `if`, __volver a crear otra variable con el mismo nombre que una que tenemos en un _scope_ exterior?__

## _Shadow variables_

Son variables con el __mismo nombre pero distinto ámbito.__ Es como si pisáramos solamente dentro de ese _scope_, el valor inicial, aunque si también imprimimos fuera del `if` ese valor, van a ver que contiene el valor que le asignamos al principio porque en realiadad son variables distintas:

```dart
void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const a = 'new a: Dentro del main y dentro del if. 🚧';
    print(a);
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
  }
  print(a);
}
```

Y podríamos definir una variable fuera del `main`? Así es y se trataría del _global scope_.

## _Global scope_

O ámbito global y está al acceso de cualquier bloque interno de código:

```dart
const c = 'c: ☺️ Scope global. Todos me pueden utilizar!';

void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const a = 'new a: Dentro del main y dentro del if. 🚧';
    print(a);
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
    print(c);
  }
  print(a);
}
```

Y obviamente, también podemos crear una nueva variable con el mismo nombre en un ámbito local y que quede 'opacada' nuestra variable original:

```dart
const c = 'c: ☺️ Scope global. Todos me pueden utilizar!';

void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const a = 'new a: Dentro del main y dentro del if. 🚧';
    print(a);
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
    print(c);
    if(c.contains('c:')) {
      const c = 'new c: c ha sido opacada. 👤';
      print(c);
    }
  }
  print(a);
}
```

Será que también sucede lo mismo con funciones? Yes! Y se llaman _Inner functions_

## _Inner functions_

Hasta ahora siempre declaramos las funciones fuera del `main`, sin embargo, también podríamos hacerlo dentro. Son funciones internas  y tienen los mismos comportamientos que estuvimos aprendiendo en este artículo:

```dart
const c = 'c: ☺️ Scope global. Todos me pueden utilizar!';

void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
  }
  // Function declaration: declarando la función
  void anInnerFunction() {
    print('Esto es una función interna!');
  }

  // Function call: llamando a la función ya declarada
  anInnerFunction();
}
```

Y qué sucede en el caso siguiente:

```dart
const c = 'c: ☺️ Scope global. Todos me pueden utilizar!';

void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
  }
  // Function declaration: declarando la función
  void anInnerFunction() {
    print('Esto es una inner function!');
    print(b); // Undefined name 'b'
  }

  // Function call: llamando a la función ya declarada
  anInnerFunction();
}
```

Como `b` está declarada dentro del `if` entonces, la función que declaramos y a su vez declara otro _scope_, no lo conoce por lo que no lo puede llamar. Sería distinto el caso, si hubiéramos declarado esa función dentro del `if`:

```dart
const c = 'c: ☺️ Scope global. Todos me pueden utilizar!';

void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  if (a.contains('Dentro')) {
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
    // Function declaration: declarando la función
    void anInnerFunction() {
      print('Esto es una inner function!');
    }

    // Function call: llamando a la función ya declarada
    anInnerFunction();
  }
}
```

Y me dieron ganas de complicarla un poco! Qué pasará ahora?

```dart
const c = 'c: ☺️ Scope global. Todos me pueden utilizar!';

void main() {
  const a = 'a: Dentro del scope de main. 💃🏼';
  print(a);
  // Function declaration: declarando la función
  void anInnerFunction(String b) {
    print(b);
  }

  if (a.contains('Dentro')) {
    const b = 'b: $a Dentro del main y dentro del if. 🍉';
    print(b);
    // Function call: llamando a la función ya declarada
    anInnerFunction(b);
  }
}
```

En este caso, declaramos la función por fuera del `if` en donde se define `b` pero a esa función le requerimos un argumento llamado `b`. Luego la llamamos dentro del `if` que declara `b` y puede usarse tranquilamente. Debo aclarar que solamente utilicé `b` como nombre del argumento en la función para confundirlos pero podríamos haberla llamado de cualquier manera! 😂
