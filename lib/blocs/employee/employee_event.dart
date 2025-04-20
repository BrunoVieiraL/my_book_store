abstract class EmployeeEvent {}

class EmployeeLoadEvent extends EmployeeEvent {
  int storeId;
  String token;
  EmployeeLoadEvent(this.storeId, this.token);
}

class EmployeeAddEvent extends EmployeeEvent {
  int storeId;
  String token;
  EmployeeAddEvent(this.storeId, this.token);
}

class EmployeeEditEvent extends EmployeeEvent {}

class EmployeeDeleteEvent extends EmployeeEvent {}

class EmployeeTooglePasswordEvent extends EmployeeEvent {}
