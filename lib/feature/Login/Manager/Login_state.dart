abstract class LoginState {}

class LoginInitialState extends LoginState {}

class InitialLoginState extends LoginState {}

class LoadinLogingState extends LoginState {}

class SuccessLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String errorMessage;

  FailureLoginState({
    required this.errorMessage,
  });
}