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
  final int deleteIndex;

  const EmployeeState({
    this.data = const [],
    this.removedUsers = const [],
    this.status = ListStatus.initial,
    this.deleteIndex=0,
  });

  EmployeeState<T> copyWith({
    Iterable<T>? data,
    Iterable<T>? removedUsers,
    ListStatus? status,
    int? deleteIndex,
  }) {
    return EmployeeState<T>(
      data: data ?? this.data,
      removedUsers: removedUsers ?? this.removedUsers,
      status: status ?? this.status,
      deleteIndex: deleteIndex ?? this.deleteIndex,
    );
  }

  @override
  List<Object?> get props => [
        data,
        removedUsers,
        status,
        deleteIndex,
      ];
}
