void main() {
  String email = 'test@example.com';
  print(
      'Is email \'$email\' valid?: ${email.isNotEmpty && email.contains('@')}'); //
}
