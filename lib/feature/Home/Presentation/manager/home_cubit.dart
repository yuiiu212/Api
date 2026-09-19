import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc_app/feature/Home/domain/Home_repo_impl.dart';
import 'package:docdoc_app/feature/Home/Presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepoImpl;

  HomeCubit(this.homeRepoImpl) : super(HomeInitialState());

  Future<void> getHome() async {
    emit(LoadingHomeState());

    try {
      final data = await homeRepoImpl.Homeview();

      emit(
        SuccessHomeState(
          data: data,
        ),
      );
    } catch (e) {
      emit(
        FailureHomeState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}