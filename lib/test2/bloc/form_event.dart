part of 'form_bloc.dart';

@immutable
abstract class FormEvent {
  @override
  String toString() => runtimeType.toString();
}

class FormEventAuth extends FormEvent{
  final String email;
  final String password;


  FormEventAuth(this.email, this.password);
  @override
  String toString() => 'LoginButtonPressed { username: $email, password: $password }';
}



