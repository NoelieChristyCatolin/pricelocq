import 'package:pricelocq/features/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pricelocq/features/login/login_repository.dart';
import 'package:pricelocq/features/login/models/session.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginState());

  final LoginRepository loginRepository;

  Future<Session> login({required String mobile, required String password}) async {
    Session session = await loginRepository.login(mobile: mobile, password: password);
    return session;
  }
}