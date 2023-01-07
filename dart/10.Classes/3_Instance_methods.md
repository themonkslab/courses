# _Instance methods_

En el ejemplo anterior, habíamos empezado a modelar la cuenta de un comercio de nuestro barrio, una verdulería. Le habíamos creado una _property_ llamada `balance` pero luego poníamos dinero como queríamos! 😂

Un comercio real no haría esto sino que tendría compras y pagos de dichas compras y quizás, un saldo negativo si el cliente queda debiendo. Cómo modelamos esto? Con métodos de instancia o _instance methods_.

Ellos son básicamente __funciones que pertenecen a la instancia que creamos__ y podríamos utilizarlos definiendo dentro de nuestra clase una función llamada `buyFor` que represente por cuánto dinero hemos comprado y otra `payFor` que modele cuánto hemos pagado de nuestra cuenta. Luego, podemos utilizar ambos métodos:

```dart
class GreensAccount {
  double balance = 0;

  void buyFor(double amount) {
    balance -= amount;
  }

  void payFor(double amount) {
    balance += amount;
  }
}

void main() {
  final mauGreensAccount = GreensAccount();
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  print(mauGreensAccount.balance); // -300
}
```

Maravilloso! Aunque sería correcto que cuando exista una función que pida el balance y nos informe si debemos o tenemos crédito a favor:

```dart
class GreensAccount {
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
  final mauGreensAccount = GreensAccount();
  mauGreensAccount.buyFor(1500);
  mauGreensAccount.payFor(1200);
  mauGreensAccount.getBalance();
}
```
