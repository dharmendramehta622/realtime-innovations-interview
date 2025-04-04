part of mainapp;

class Routes {
  //landing
  static const String landing = '/';
  static const String addEmployee = '/add';
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
];
