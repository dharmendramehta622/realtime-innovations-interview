part of mainapp;

enum ListStatus {
  initial,
  loading,
  loaded,
  success,
  updated,
  deleted,
  created,
  failure,
  error,
}

  class EmployeeState<T> extends Equatable {
  final Iterable<T> data;
  final ListStatus status;

  const EmployeeState({this.data = const [], this.status = ListStatus.initial});
  
    EmployeeState<T> copyWith({Iterable<T>? data, ListStatus? status}) {
    return EmployeeState<T>(
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }
  
  @override
  List<Object?> get props => [data, status];
}
