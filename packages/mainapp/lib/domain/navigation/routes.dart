part of mainapp;

class Routes {
  //landing
  static const String landing = '/';
  static const String addEmployee = '/add';
  static const String editEmployee = '/edit';
}

// Define your routes using GoRouter
final List<RouteBase> routes = [
  //!Common Routes
  GoRoute(
    path: Routes.landing,
    builder: (context, state) => const LandingPage(),
  ),
  //!Add employee
  GoRoute(
    path: Routes.addEmployee,
    builder: (context, state) => const AddEmployeePage(),
  ),
  //!Edit employee
  GoRoute(
    path: Routes.editEmployee,
    builder: (context, state) {
      User user = state.extra as User;
      return EditEmployeePage(user);
    },
  ),
];
