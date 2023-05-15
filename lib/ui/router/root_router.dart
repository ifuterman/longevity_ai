import 'package:auto_route/auto_route.dart';

import 'root_router.gr.dart';

@AutoRouterConfig()
class RootRouter extends $RootRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true, children: [
          CustomRoute(
              page: PlaceHolderRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.noTransition),
          CustomRoute(
              page: BloodTestRoute.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              durationInMilliseconds: 100),
        ]),
      ];
}

// ignore: non_constant_identifier_names
final AppRouter = RootRouter();
final appContext = AppRouter.navigatorKey.currentContext!;
