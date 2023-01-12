import '6.2_greens_account.dart';

void main() {
  final mauGreensAccount = GreensAccount(
    1000,
    accountHolder: 'Mauro Di Bert',
  );

  // mauGreensAccount._balance = 10000000; // ☝🏼
  mauGreensAccount.payFor(1000);
  mauGreensAccount.getBalance();
  mauGreensAccount.balance;
}
