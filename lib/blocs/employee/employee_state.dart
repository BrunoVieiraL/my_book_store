// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_book_store/domain/models/user.dart';

abstract class EmployeeState {}

class EmployeeInitialState extends EmployeeState {}

class EmployeeLoadedState extends EmployeeState {
  List<User> employees = [];
  EmployeeLoadedState(this.employees);
}

class EmployeeLoadingState extends EmployeeState {}

class EmployeePasswordState extends EmployeeState {
  final bool showPassword;

  EmployeePasswordState({required this.showPassword});
}

class EmployeeAddSuccessState extends EmployeeState {}
