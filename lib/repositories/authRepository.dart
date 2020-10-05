import 'package:demo_bloc/provider/authProvider.dart';

class AuthRepository{
  final AuthProvider authProvider = AuthProvider();

  void register(String email,String password) => authProvider.register(email, password);

}