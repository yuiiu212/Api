import 'package:docdoc_app/feature/Login/Manager/Login_state.dart';
import 'package:docdoc_app/feature/Login/domain/Login_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepoImpl _LoginRepoImpl;

  LoginCubit(this._LoginRepoImpl) : super(LoadinLogingState());

  void Login({required String email, required String password}) {
    emit(LoginInitialState());
    try {
      emit(LoadinLogingState());
      _LoginRepoImpl.Login(body: {'email': email, 'password': password});
      emit(SuccessLoginState());
    } catch (e) {
      emit(FailureLoginState(errorMessage: e.toString()));
    }
  }
}
