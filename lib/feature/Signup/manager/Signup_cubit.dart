import 'package:docdoc_app/feature/Signup/domain/Signup_repo_impl.dart';
import 'package:docdoc_app/feature/Signup/manager/Signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepoImpl _signupRepoImpl;

  SignupCubit(this._signupRepoImpl) : super(SignupInitialState());

  Future<void> Signup({
    required String Name,
    required String email,
    required String password,
    required String phone,
     String? gender = '0',
    required String confirmPassword,
  }) async {
    emit(LoadingSignupState());

    try {
       _signupRepoImpl.Signup(
        body: {
          "name": Name,
          "email": email,
          "phone": phone,
          "password": password,
          "password_confirmation": confirmPassword,
          "gender": gender,
        },
      );

      print('Name: $Name');
      print('Email: $email');
      print('Phone: $phone');
      print('Gender: $gender');

      emit(SuccessSignupState());
    } catch (e) {
      print('Signup Error: $e');

      emit(
        FailureSignupState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}