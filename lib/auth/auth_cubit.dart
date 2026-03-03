import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_repository.dart';

class AuthCubit extends Cubit<bool> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(repository.isSignedIn());

  Future<void> signIn(String email, String password) async {
    await repository.signIn(email, password);
    emit(true);
  }

  Future<void> signUp(String email, String password) async {
    await repository.signUp(email, password);
    emit(true);
  }

  Future<void> signOut() async {
    await repository.signOut();
    emit(false);
  }
}