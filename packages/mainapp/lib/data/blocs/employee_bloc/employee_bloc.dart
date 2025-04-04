part of mainapp;

Iterable<String> roles = [
  'Product Designer',
  'Flutter Developer',
  'QA Tester',
  'Product Owner',
];

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  String? role = null;
  String? startDate = null;
  String? endDate = null;
  EmployeeBloc() : super(EmployeeState()) {
    on<LoadEmployee>((event, emit) {
      emit(state.copyWith(status: ListStatus.loaded));
    });
  }
}
