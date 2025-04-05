part of mainapp;

class UserServices {
  static const String _userListKey = 'userList';
  static const String _deletedUserListKey = 'removedUserList';

  // Add a user
  Future<bool> addUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final existingData = prefs.getString(_userListKey);
    List<Map<String, dynamic>> users = [];

    if (existingData != null) {
      users = List<Map<String, dynamic>>.from(jsonDecode(existingData));
    }

    users.add(user.toMap());
    await prefs.setString(_userListKey, jsonEncode(users));
    return true;
  }

  // Edit user by index
  Future<bool> editUser(int index, User updatedUser) async {
    final prefs = await SharedPreferences.getInstance();
    final existingData = prefs.getString(_userListKey);

    if (existingData != null) {
      List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(jsonDecode(existingData));
      if (index >= 0 && index < users.length) {
        users[index] = updatedUser.toMap();
        await prefs.setString(_userListKey, jsonEncode(users));
        return true;
      }
      return false;
    }
    return false;
  }

// Delete user by index and move to removed list
  Future<bool> deleteUser(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final existingData = prefs.getString(_userListKey);
    final removedData = prefs.getString(_deletedUserListKey);

    if (existingData != null) {
      List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(jsonDecode(existingData));
      List<Map<String, dynamic>> removedUsers = [];

      if (removedData != null) {
        removedUsers = List<Map<String, dynamic>>.from(jsonDecode(removedData));
      }

      if (index >= 0 && index < users.length) {
        // Move to removed list
        final removedUser = users.removeAt(index);
        removedUsers.add(removedUser);

        // Save both updated lists
        await prefs.setString(_userListKey, jsonEncode(users));
        await prefs.setString(_deletedUserListKey, jsonEncode(removedUsers));
        return true;
      }
      return false;
    }
    return false;
  }

  // Get all users
  Future<Iterable<User>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final existingData = prefs.getString(_userListKey);

    if (existingData != null) {
      return (List<Map<String, dynamic>>.from(jsonDecode(existingData)) as List)
          .map((e) => User.fromMap(e));
    }
    return [];
  }

  // Get all removed users
  Future<Iterable<User>> getRemovedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final existingData = prefs.getString(_deletedUserListKey);

    if (existingData != null) {
      return (List<Map<String, dynamic>>.from(jsonDecode(existingData)) as List)
          .map((e) => User.fromMap(e));
    }
    return [];
  }
}
