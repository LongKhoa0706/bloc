class AuthProvider {
  Future<void> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1),);
    return email;
  }
}