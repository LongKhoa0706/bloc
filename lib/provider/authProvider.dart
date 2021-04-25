import 'package:demo_bloc/provider/product_database.dart';

class AuthProvider {
  ProductDatabase productDatabase = ProductDatabase();


  Future<void> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1),);

    return email;
  }
}
