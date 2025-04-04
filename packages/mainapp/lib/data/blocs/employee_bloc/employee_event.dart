part of mainapp;


@immutable
sealed class EmployeeEvent {}


class LoadEmployee extends EmployeeEvent{
  
}

class AddEmployee extends EmployeeEvent{

}

class EditEmployee extends EmployeeEvent{

}

class DeleteEmployee extends EmployeeEvent{

}