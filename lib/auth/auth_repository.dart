class AuthRepository {
  bool _isSignedIn = false;

  bool isSignedIn() => _isSignedIn;

  Future<void> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _isSignedIn = true;
  }

  Future<void> signUp(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    _isSignedIn = true;
  }

  Future<void> signOut() async {
    _isSignedIn = false;
  }
}