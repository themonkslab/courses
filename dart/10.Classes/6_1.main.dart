import '6_2.greens_account.dart';

void main() {
  final mauGreensAccount = GreensAccount(
    1000,
    accountHolder: 'Mauro Di Bert',
  );

  mauGreensAccount._balance = 10000000;
  mauGreensAccount.getBalance();
}
