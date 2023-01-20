import 'package:first_dart_project/first_dart_project.dart'
    as first_dart_project;

String getUserName() => 'Mau';

void main(List<String> arguments) {
  print('Hello world: ${first_dart_project.calculate()}!');

  final userName = getUserName();

  print(userName);

  for (var argument in arguments) {
    print(argument);
  }
}
