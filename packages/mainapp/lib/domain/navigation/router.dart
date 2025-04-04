part of mainapp;


class GoRouterObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // print('MyTest didPop: $route');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // print('MyTest didPush: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // print('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // print('MyTest didReplace: $newRoute');
  }
}


mixin GoRoutes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    redirectLimit: 3,
    routes: routes,
    observers: [
      GoRouterObserver(),
    ],
  );


}