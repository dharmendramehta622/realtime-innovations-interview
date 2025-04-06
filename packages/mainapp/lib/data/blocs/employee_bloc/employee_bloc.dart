part of mainapp;

Iterable<String> roles = [
  'Product Designer',
  'Flutter Developer',
  'QA Tester',
  'Product Owner',
];

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final UserServices _services = UserServices();

  //text-controllers
  final nameEC = TextEditingController();
  String? role;
  final roleEC = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  int currentIndex = 0;

  void clear() {
    nameEC.clear();
    roleEC.clear();
    role = null;
    startDate = null;
    endDate = null;
  }

  void setData(User user) {
    nameEC.text = user.name;
    role = user.role;
    startDate = user.startDate;
    endDate = user.endDate;
  }

  EmployeeBloc() : super(EmployeeState()) {
    on<LoadEmployee>((event, emit) async {
      final users = await _services.getAllUsers();
      final removedUsers = await _services.getRemovedUsers();
      emit(state.copyWith(
          status: ListStatus.loaded, data: users, removedUsers: removedUsers));
    });

    on<AddEmployee>((event, emit) async {
      User model = User(
          name: nameEC.text,
          role: role ?? roles.first,
          startDate: startDate ?? DateTime.now(),
          endDate: endDate);
      final res = await _services.addUser(model);
      if (res) {
        emit(state.copyWith(status: ListStatus.success));
        clear();
        add(LoadEmployee());
      }
    });

    on<EditEmployee>((event, emit) async {
      User model = User(
          name: nameEC.text,
          role: role ?? roles.first,
          startDate: startDate!,
          endDate: endDate);
      final res = await _services.editUser(currentIndex, model);
      if (res) {
        emit(state.copyWith(status: ListStatus.success));
        add(LoadEmployee());
      }
    });

    on<DeleteEmployee>((event, emit) async {
      final res = await _services.deleteUser(event.index);
      if (res) {
        emit(state.copyWith(status: ListStatus.success));
        add(LoadEmployee());
      }
    });
  }
}
