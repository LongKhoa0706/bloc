part of 'form_bloc.dart';

@immutable
abstract class FormStatee {}

class FormInitial extends FormStatee {}

class FormStateLoading extends FormStatee{}

class FormStateError extends FormStatee{
  final String err;

  FormStateError(this.err);
}

class FormStateSuccess extends FormStatee {
  final String email;
  final String password;

  FormStateSuccess(this.email, this.password);

}


