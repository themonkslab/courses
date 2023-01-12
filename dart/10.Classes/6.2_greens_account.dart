class GreensAccount {
  GreensAccount(
    this._balance, {
    required this.accountHolder,
  });

  final String accountHolder;
  double _balance;

  double get balance => _balance; //👁️

  void buyFor(double amount) {
    _balance -= amount;
  }

  void payFor(double amount) {
    _balance += amount;
  }

  void getBalance() {
    if (_balance < 0) {
      print('$accountHolder: You are in debt. Your balance is: $_balance');
    } else if (_balance > 0) {
      print('$accountHolder: You are in credit. Your balance is: $_balance');
    } else {
      print('$accountHolder: Your balance is 0');
    }
  }
}
