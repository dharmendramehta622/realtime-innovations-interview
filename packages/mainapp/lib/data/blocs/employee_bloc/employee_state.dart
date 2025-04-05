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
  final Iterable<T> removedUsers;
  final ListStatus status;

  const EmployeeState({
    this.data = const [],
    this.removedUsers = const [],
    this.status = ListStatus.initial,
  });

  EmployeeState<T> copyWith({
    Iterable<T>? data,
    Iterable<T>? removedUsers,
    ListStatus? status,
  }) {
    return EmployeeState<T>(
      data: data ?? this.data,
      removedUsers: removedUsers ?? this.removedUsers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        data,
        removedUsers,
        status,
      ];
}
