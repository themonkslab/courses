# _Class constructors_

Ya tenemos algo más parecido a una cuenta con un negocio de barrio más cercana a lo real. Sin embargo, sería correcto poder abrir una cuenta con un balance específico, por ejemplo empezando con $1000 y dejar eso a crédito para futuras compras. Cómo haríamos esto? Utilizando constructores de clase.

Lo que tenemos que hacer es crear __una función para que cada vez que instanciemos o _construyamos_ la clase, se haga de la manera en la que nosotros especifiquemos en esta función, osea, en su constructor.__

Lo hacemos con el __nombre de la clase, unos paréntesis__ en donde __especificamos argumentos__ posicionales o nombrados (preferimos utilizar posicionales solo cuando se trata de 1 argumento; más de uno, nombrados) __y abrimos un bloque__ con `{}` en donde instruimos qué hacer.

En nuestro caso lo que queremos hacer es pasarle un balance, por lo que pedimos un argumento del tipo `double` y lo igualamos a nuestro balance. 💀 Pero qué sucede si lo hacen así? Escriban este código y prueben qué sucede!

```dart
class GreensAccount {
  GreensAccount(double balance) { // 👁️ atención
    balance = balance;
  }

  double balance = 0;

  void buyFor(double amount) {
    balance -= amount;
  }

  void payFor(double amount) {
    balance += amount;
  }

  void getBalance() {
    if (balance < 0) {
      print('You are in debt. Your balance is: $balance');
    } else if (balance > 0) {
      print('You are in credit. Your balance is: $balance');
    } else {
      print('Your balance is 0');
    }
  }
}

void main() {
  final mauGreensAccount = GreensAccount(1000); // 👁️ atención!
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  mauGreensAccount.getBalance(); // -300! 😳
}
```

Por qué el balance resulta en `-300`? Porque cuando creamos el constructor, decimos que `balance` es igual a `balance`. Cómo diferenciamos entre el que recibimos y la _member variable_ o _property_ de nuestra clase? Utilizamos la palabra _this_.

## _This_

Significa 'esto' y sirve para referirse a la instancia que se está creando y solamente la utilizamos cuando tenemos un conflicto de _naming_; de otra manera, Dart omite el _this_.

Cómo haríamos entonces con el ejemplo anterior? Utilizando `this` para referirse a la instancia que se está creando y combinado con `balance` mediante un `.`, asignándole el `balance` que recibimos, así:

```dart
class GreensAccount {
  GreensAccount(double balance) {
    this.balance = balance; // 👁️
  }

  double balance = 0;

  void buyFor(double amount) {
    balance -= amount;
  }

  void payFor(double amount) {
    balance += amount;
  }

  void getBalance() {
    if (balance < 0) {
      print('You are in debt. Your balance is: $balance');
    } else if (balance > 0) {
      print('You are in credit. Your balance is: $balance');
    } else {
      print('Your balance is 0');
    }
  }
}

void main() {
  final mauGreensAccount = GreensAccount(1000);
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  mauGreensAccount.getBalance(); // 700!!!
}
```

Ahora podemos ver que nuestro resultado cuando pedimos por el balance, es de `700`. Perfecto! Ahora, ustedes saben que tratamos todo el tiempo de buscar mejores formas de hacer las cosas. Existe una forma más simple? Sí! Con una lista de inicialización o...

## _Initializer list_

Podríamos omitir la función de creación si lo que queremos hacer es inicializar _member variables_. Solamente tenemos que, luego del cierre de `()` en donde pedimos el argumento `balance`, agregar `:` y luego del lado izquierdo, las _member variables_ que queremos inicializar y del derecho el valor que queremos ponerle dentro. Veámoslo que va a ser más claro:

```dart
class GreensAccount {
  GreensAccount(double balance) : balance = balance;
  double balance; // 👁️ Ya no hace falta inicializarla en 0.

  void buyFor(double amount) {
    balance -= amount;
  }

  void payFor(double amount) {
    balance += amount;
  }

  void getBalance() {
    if (balance < 0) {
      print('You are in debt. Your balance is: $balance');
    } else if (balance > 0) {
      print('You are in credit. Your balance is: $balance');
    } else {
      print('Your balance is 0');
    }
  }
}

void main() {
  final mauGreensAccount = GreensAccount(1000);
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  mauGreensAccount.getBalance();
}
```

Ya sé! Dart les marca una sugerencia! Ya vamos a llegar a ella pero mientras les quiero preguntar: cómo sería si tuvieran dos o más _member variables_ para inicializar? Imaginemos que queremos tener cada cuenta con el nombre del dueño de dicha cuenta, por lo que agregaremos una variable llamada `accountHolder` y la inicializaremos mediante nuestra _initializer list_. Noten que podemos listar mediante el uso de comas y que utilizamos _trailing commas_ cuando se trata de más de un argumento o parámetro y formateamos:

```dart
class GreensAccount {
  GreensAccount({
    required String accountHolder,
    double balance = 0,
  })  : accountHolder = accountHolder,
        balance = balance;
  String accountHolder;
  double balance;

  void buyFor(double amount) {
    balance -= amount;
  }

  void payFor(double amount) {
    balance += amount;
  }

  void getBalance() {
    if (balance < 0) {
      print('$accountHolder: You are in debt. Your balance is: $balance');
    } else if (balance > 0) {
      print('$accountHolder: You are in credit. Your balance is: $balance');
    } else {
      print('$accountHolder: Your balance is 0');
    }
  }
}

void main() {
  final mauGreensAccount = GreensAccount(
    accountHolder: 'Mauro',
    balance: 1000,
  );
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  mauGreensAccount.getBalance();
}
```

Y ahora es momento de calmar la ansiedad! 🤣 Qué eran esos avisos que Dart nos daba? Decía _prefer initializing formals_. Y esto? Que tenemos una manera aun más concisa de inicializar nuestras _member variables_ y es con esta syntaxis abreviada o _shorthand syntax_.

En lugar de la _initializer list_, vamos a eliminar eso y simplemente utilizar la palabra `this` dentro de los `()` y Dart que es sumamente inteligente, sabe que el argumento que nombramos `accountHolder` irá a inicializar el _member variable_ que llamamos `accountHolder`, de esta manera:

```dart
class GreensAccount {
  GreensAccount({
    required this.accountHolder,
    this.balance = 0,
  });

  String accountHolder;
  double balance;

  void buyFor(double amount) {
    balance -= amount;
  }

  void payFor(double amount) {
    balance += amount;
  }

  void getBalance() {
    if (balance < 0) {
      print('$accountHolder: You are in debt. Your balance is: $balance');
    } else if (balance > 0) {
      print('$accountHolder: You are in credit. Your balance is: $balance');
    } else {
      print('$accountHolder: Your balance is 0');
    }
  }
}

void main() {
  final mauGreensAccount = GreensAccount(
    accountHolder: 'Mauro Di Bert',
    balance: 1000,
  );
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  mauGreensAccount.getBalance();
}
```

Esto se vuelve cada vez más bello y ustedes dirán: y para qué nos enseñaste todo lo anterior! 😂 Por dos razones:

1. Para que vean el proceso detrás de la simplificación y entiendan sus por qué.
2. Porque ya van a utilizar _initializer lists_ prontito!

Mientras tanto, les quiero hacer notar que __habrán visto que primero declaramos los constructores y luego las _member variables_? Esto es una convención del lenguaje y es recomendado seguirla.__

Y también podrán ver que en la función de construcción no utilizamos ningún `return`. Esto es porque dicho `return` es implícito dentro de las funciones constructoras. 
