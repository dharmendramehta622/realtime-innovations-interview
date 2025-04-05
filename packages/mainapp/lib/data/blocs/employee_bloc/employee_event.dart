part of mainapp;

@immutable
sealed class EmployeeEvent {}

class LoadEmployee extends EmployeeEvent {}

class AddEmployee extends EmployeeEvent {}

class EditEmployee extends EmployeeEvent {
  final int index;

  EditEmployee(this.index);

}

class DeleteEmployee extends EmployeeEvent {
  final int index;

  DeleteEmployee(this.index);

}
