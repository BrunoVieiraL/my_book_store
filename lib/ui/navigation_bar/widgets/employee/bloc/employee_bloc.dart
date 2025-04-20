import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/models/user.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

  final nameEmployeeTextController = TextEditingController();
  final usernameEmployeeTextController = TextEditingController();
  final passwordEmployeeTextController = TextEditingController();

  bool _showPassword = false;

  EmployeeBloc(this._employeeRepository) : super(EmployeeInitialState()) {
    on<EmployeeLoadEvent>(
      (event, emit) async {
        emit(EmployeeLoadingState());
        final response = await _employeeRepository.getEmployess(
          event.storeId,
          event.token,
        );
        emit(EmployeeLoadedState(response));
      },
    );

    on<EmployeeAddEvent>(
      (event, emit) async {
        emit(EmployeeLoadingState());
        await _employeeRepository.addEmployee(
          event.storeId,
          User(
            name: nameEmployeeTextController.text,
            username: usernameEmployeeTextController.text,
            password: passwordEmployeeTextController.text,
          ),
          event.token,
        );
        emit(EmployeeAddSuccessState());
      },
    );

    on<EmployeeTooglePasswordEvent>(
      (event, emit) {
        _showPassword = !_showPassword;
        emit(EmployeePasswordState(showPassword: _showPassword));
      },
    );
    // on<EmployeeEditEvent>();

    // on<EmployeeDeleteEvent>();
  }
}
