import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pricelocq/features/login/models/session.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {

  factory LoginState({  
    Session? session,
  }) = _LoginState;
}