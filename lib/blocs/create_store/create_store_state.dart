import 'package:my_book_store/domain/domain.dart';

abstract class CreateStoreState {}

class CreateStoreInitialState extends CreateStoreState {}

class CreateStoreLoadingState extends CreateStoreState {}

class CreateStoreSuccesState extends CreateStoreState {
  final AuthResponse authResponse;
  CreateStoreSuccesState(this.authResponse);
}

class CreateStoreFailureState extends CreateStoreState {
  final String errorMessage;
  CreateStoreFailureState(this.errorMessage);
}

class CreateStoreVisibilityState extends CreateStoreState {
  final bool showPassword;
  final bool showRepeatPassword;

  CreateStoreVisibilityState({
    required this.showPassword,
    required this.showRepeatPassword,
  });
}
