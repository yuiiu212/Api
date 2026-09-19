abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final Map<String, dynamic> data;

  SuccessHomeState({
    required this.data,
  });
}

class FailureHomeState extends HomeState {
  final String errorMessage;

  FailureHomeState({
    required this.errorMessage,
  });
}