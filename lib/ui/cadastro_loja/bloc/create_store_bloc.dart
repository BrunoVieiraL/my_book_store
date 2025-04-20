import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/models/store.dart';
import 'package:my_book_store/domain/models/user.dart';

class CreateStoreBloc extends Bloc<CreateStoreEvent, CreateStoreState> {
  final CreateStoreRepository _createStoreRepository;

  final nameStoreTextController = TextEditingController();
  final sloganStoreTextController = TextEditingController();
  final bannerStoreTextController = TextEditingController();
  final adminTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordRepeatTextController = TextEditingController();

  bool _showPassword = false;
  bool _showRepeatPassword = false;

  CreateStoreBloc(this._createStoreRepository)
      : super(CreateStoreInitialState()) {
    on<CreateStorePressedEvent>(
      (event, emit) async {
        emit(CreateStoreLoadingState());
        try {
          final authResponse = await _createStoreRepository.createStore(
            Store(
              name: nameStoreTextController.text,
              slogan: sloganStoreTextController.text,
              banner: bannerStoreTextController.text,
            ),
            User(
              name: adminTextController.text,
              username: adminTextController.text,
              password: passwordTextController.text,
              photo: '',
            ),
          );

          emit(CreateStoreSuccesState(authResponse));
        } catch (e) {
          emit(CreateStoreFailureState(e.toString()));
        }
      },
    );
    on<CreateStoreTooglePasswordEvent>((event, emit) {
      _showPassword = !_showPassword;
      emit(CreateStoreVisibilityState(
        showPassword: _showPassword,
        showRepeatPassword: _showRepeatPassword,
      ));
    });

    on<CreateStoreToogleRepeatPasswordEvent>((event, emit) {
      _showRepeatPassword = !_showRepeatPassword;
      emit(CreateStoreVisibilityState(
        showPassword: _showPassword,
        showRepeatPassword: _showRepeatPassword,
      ));
    });
  }
}
