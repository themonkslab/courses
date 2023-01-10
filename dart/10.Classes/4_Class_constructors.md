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

Finalmente, qué les parece a ustedes si hacemos esto? Vayan al 👁️:

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
  mauGreensAccount.accountHolder = 'Martín Smith'; // 👁️
  mauGreensAccount.getBalance();
}
```

_Whaaaat_? Exacto! Estaríamos modelando nuestra cuenta de manera totalmente incorrecta si en cualquier momento, podemos cambiar su titular! 😆 Cómo hacemos para que haya _properties_ dentro de nuestra clase que no puedan mutar y que otros sí?

## _Mutable and Immutable members_

En este caso, queremos que el balance sea algo que pueda cambiar a lo largo de nuestra historia con el comercio en cuestión pero no así el nombre del dueño de la cuenta. Cómo hacemos esto? Simple, agregando `final` a la declaración de nuestra variable. 💀 Prueben y fijen qué sucede cuando intentamos cambiar el `accountHolder`:

```dart
class GreensAccount {
  GreensAccount({
    required this.accountHolder,
    this.balance = 0,
  });

  final String accountHolder; // 👁️
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
  mauGreensAccount.accountHolder = 'Martín Smith'; // 👁️

  mauGreensAccount.getBalance();
}
```

Dart nos dice que no puede ser utilizado como un _setter_ porque es _final_. Y listo!

Siempre tienen que preguntarse al crear o modelar una clase o tipo, si dicha propiedad debe mutar o no con el tiempo y en función de eso, establecer si son `final` o no.

Es muy importante que traten de hacer que cada clase sea comprensible, fácil de utilizar y al mismo tiempo, que sea difícil cometer errores con ella!

## 💪 Modelando el mundo real

__Requirement__: crear una clase que nos permita modelar una computadora y que luego creen una instancia de ella, con las características de su computadora y llamen a todos sus métodos. Debe contener las propiedades listadas debajo, un método que las imprima y un método que nos permita actualizar sistema operativo y ram*.

- Chip.
- Memoria.
- Pantalla.
- Sistema operativo.

*En mi caso particular voy a hacer una pequeña trampa ya que en mi computadora no puede actualizarse el RAM pero vamos a modelarla como si pudiera hacerlo.

---

__💀 Solución__:

```dart
class Computer {
  Computer({
    required this.owner,
    required this.chip,
    required this.screen,
    required this.memory,
    required this.operativeSystem,
  });

  final String owner;
  final String chip;
  final String screen;
  int memory;
  String operativeSystem;

  void printComponents() => print('''
  Owner: $owner
  ---
  Chip: $chip
  Screen: $screen
  Memory: $memory
  OS: $operativeSystem
  ---
  ''');
  
  void updateOS(String operativeSystem) => this.operativeSystem = operativeSystem; 
  void updateMemory(int memory) => this.memory = memory; 

}


void main() {
  final mauComputer = Computer(
      owner: 'Mau Di Bert',
      chip: 'M1',
      screen: '13.3',
      memory: 8,
      operativeSystem: 'Ventura 13.0.1');
  
  mauComputer.printComponents();
  mauComputer.updateMemory(16);
  mauComputer.updateOS('Ventura 13.1.0');
  mauComputer.printComponents();
}
```

__🤓 Notas__:

Algunos podrían preguntarse el porqué crean una clase cuando podemos utilizar un mapa para representar algo. Déjenme responderle con un ejemplo, representando la computadora de recién pero con un mapa. 💀 Cópienlo (primera vez que creo les digo copien un código y será una de las pocas 🤣), córranlo y traten de entender y explicar por qué sucede lo que sucede:

```dart
void main() {
  final mauComputerMap = <String, dynamic>{
    'owner': 'Mau Di Bert',
    'chip': 'M1',
    'screen': '13.3',
    'memory': 8,
    'operativSystem': 'Ventura 13.0.1'
  };

  print(mauComputerMap['owner']);
  print(mauComputerMap['chip']);
  print(mauComputerMap['screen']);
  print(mauComputerMap['memory']);
  print(mauComputerMap['operativeSystem']);
}
```

__Es muy fácil cometer un _typo_ o error mientras tipeamos tanta cantidad de caracteres por día__. En el caso anterior, no escribí correctamente el _key_ del mapa `operativeSystem` sino que omití la letra 'e' de _operative_ por lo que cuando luego queremos acceder a ella mediante `[]`, no podemos hacerlo y nos retorna el _value_ `null`. __Es muy útil el tener una clase que establece qué valores vamos a guardar en ella como también es muy útil establecer de qué tipos serán esos valores.__ Y para explicar lo último, vamos a la solución.

Qué pasaría si ustedes intentaran ingresar `13.3` como valor del _member variable_ `screen`? Nuestra clase se encargaría de decirnos que el tipo que espera para dicho valor no es del tipo `double` sino del tipo `String` y esto es extremadamente útil para no cometer errores.

__Prioricen el crear una clase siempre__, por más de que lleve un poco de tiempo pensar cómo representar aquello que queremos de la forma más correcta.

## _Const constructors_

Ya hemos visto a través de distintos ejemplos, que __hay valores que no van a cambiar a lo largo de toda una aplicación__ y que si los establecemos como valores constantes mediante la utilización de __`const`__, no solo vamos a estar __evitando que ese valor sea cambiando sin darnos cuenta__ y eso provoque errores en nuestra aplicación, sino que también va a permitirle a Dart __optimizar la performance__ de nuestro desarrollo. __Lo mismo sucede con las clases.__

Pensemos en una aplicación para un Teatro de Ópera. En ese tipo de lugares, se suelen tener reglas muy específicas sobre la forma de vestir de la persona que entra, en qué momento entrar o salir de la función, la edad mínima recomendada para ingresar al recinto, etc. Esa serie de reglas no van a cambiar jamás para la institución (o en muy raras ocasiones) y van a determinar una cantidad importante de cosas a la hora de crear una aplicación para dicho lugar.

Vamos a crear una clase para representar entonces esas reglas:

```dart
class OperaTheaterRules {
  OperaTheaterRules(
    this.recommendedMinimumAge,
    this.recommendedMinimumAgeRule,
    this.dressingCodeRule,
  );
  final String? recommendedMinimumAgeRule;
  final int? recommendedMinimumAge;
  final String? dressingCodeRule;
}
```

Bien! Ya tenemos nuestra clase y sabemos que el contenido de las _member variables_ de dicha clase, no van a cambiar. Bien podríamos cuando la instanciamos, crearla como constante de esta manera:

```dart
class OperaTheaterRules {
  OperaTheaterRules(
    this.recommendedMinimumAge,
    this.recommendedMinimumAgeRule,
    this.dressingCodeRule,

  );
  final String? recommendedMinimumAgeRule;
  final int? recommendedMinimumAge;
  final String? dressingCodeRule;
}

void main() {
  const myOperaTheaterRules = OperaTheaterRules(
    5,
    'Never under five should enter',
    'The public is kindly requested to dress in keeping with the decorum of the Theatre, out of respect for the Theatre and for other viewers. People wearing shorts or sleeveless T-shirts will not be allowed inside the auditorium; in this case, tickets will not be reimbursed',
  );
}
```

Qué pasó? _The constructor being called isn't a const constructor._ Nos dice que llamamos a un constructor que no es constante por lo que no podemos crear un valor constante. Cómo lo logramos? fácil! Definiendo un constructor constante agregando dicha palabra antes del _constructor_! 😂

```dart
class OperaTheaterRules {
  const OperaTheaterRules(
    this.recommendedMinimumAge,
    this.recommendedMinimumAgeRule,
    this.dressingCodeRule,

  );
  final String? recommendedMinimumAgeRule;
  final int? recommendedMinimumAge;
  final String? dressingCodeRule;
}

void main() {
  const myOperaTheaterRules = OperaTheaterRules(
    5,
    'Never under five should enter',
    'The public is kindly requested to dress in keeping with the decorum of the Theatre, out of respect for the Theatre and for other viewers. People wearing shorts or sleeveless T-shirts will not be allowed inside the auditorium; in this case, tickets will not be reimbursed',
  );
}
```

Esta es también una buena práctica para que piensen a la hora de crear cualquier clase: tengo elementos que no van a mutar y se mantendrán constantes a lo largo de toda mi aplicación en esta clase? Creen un constructor constante en dicho caso!

## _Named constructors_

En el ejemplo del teatro, creamos un __constructor que debería ser útil para las reglas en una gran parte de casos__ y por eso es un constructor por defecto o _default constructor_ pero qué sucede en los casos en donde mi teatro de ópera se utiliza para un recorrido turístico? O cuando se abre por la noche como un museo con disfraces? Son casos muy particulares en donde posiblemente las reglas cambien! En ese caso me gustaría poder crearlo específicamente con reglas constante pero diferentes! Cómo podríamos hacerlo? Utilizando constructores con nombre!

Lo que tenemos que hacer es utilizar nuestro nombre de clase como ya lo hicimos con nuestro _default constructor_, para después un `.` y el nombre específico para emplear finalmente una _initializer list_ con los valores que queremos para éste.

```dart
class OperaTheaterRules {
  const OperaTheaterRules(
    this.recommendedMinimumAge,
    this.recommendedMinimumAgeRule,
    this.dressingCodeRule,
  );
  final String? recommendedMinimumAgeRule;
  final int? recommendedMinimumAge;
  final String? dressingCodeRule;

  OperaTheaterRules.visitMode()
      : recommendedMinimumAge = 0,
        recommendedMinimumAgeRule = null,
        dressingCodeRule = null;

  OperaTheaterRules.nightMode(this.dressingCodeRule)
      : recommendedMinimumAge = 18,
        recommendedMinimumAgeRule = 'Underage are not allowed in night tours.';
}

void main() {
  const myOperaTheaterRules = OperaTheaterRules(
    5,
    'Never under five should enter',
    'The public is kindly requested to dress in keeping with the decorum of the Theatre, out of respect for the Theatre and for other viewers. People wearing shorts or sleeveless T-shirts will not be allowed inside the auditorium; in this case, tickets will not be reimbursed',
  );
}
```

De esta manera, si tenemos que definir comportamientos o estados específicos, podemos instanciar de forma diferente nuestra clase utilizando los constructores nombrados:

```dart
class OperaTheaterRules {
  const OperaTheaterRules(
    this.recommendedMinimumAge,
    this.recommendedMinimumAgeRule,
    this.dressingCodeRule,
  );
  final String? recommendedMinimumAgeRule;
  final int? recommendedMinimumAge;
  final String? dressingCodeRule;

  OperaTheaterRules.visitMode()
      : recommendedMinimumAge = 0,
        recommendedMinimumAgeRule = null,
        dressingCodeRule = null;

  OperaTheaterRules.nightMode(this.dressingCodeRule)
      : recommendedMinimumAge = 18,
        recommendedMinimumAgeRule = 'Underage are not allowed in night tours.';
}

void main() {
  const myOperaTheaterRules = OperaTheaterRules(
    5,
    'Never under five should enter',
    'The public is kindly requested to dress in keeping with the decorum of the Theatre, out of respect for the Theatre and for other viewers. People wearing shorts or sleeveless T-shirts will not be allowed inside the auditorium; in this case, tickets will not be reimbursed',
  );
  
  final myOperaTheaterNightRules = OperaTheaterRules.nightMode('Animals Dressing');
}
```
