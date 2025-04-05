part of mainapp;

class User {
  final String name;
  final String role;
  final DateTime startDate;
  final bool isDeleted;
  final DateTime? endDate;

 User({
    required this.name,
    required this.role,
    required this.startDate,
      this.isDeleted = false,
    this.endDate,
  });
  
  // copyWith
  User copyWith({
    String? name,
    String? role,
    DateTime? startDate,
    bool? isDeleted,
    DateTime? endDate,
  }) {
    return User(
      name: name ?? this.name,
      role: role ?? this.role,
      startDate: startDate ?? this.startDate,
      isDeleted: isDeleted ?? this.isDeleted,
      endDate: endDate ?? this.endDate,
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'startDate': startDate.toIso8601String(),
      'isDeleted': isDeleted,
      'endDate': endDate?.toIso8601String(),
    };
  }

  // fromMap
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      role: map['role'],
      startDate: DateTime.parse(map['startDate']),
      isDeleted: map['isDeleted'],
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
    );
  }

  // toJson
  String toJson() => jsonEncode(toMap());

  // fromJson
  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));
}
