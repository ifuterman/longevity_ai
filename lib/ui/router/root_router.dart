import 'package:auto_route/auto_route.dart';
import 'package:longevity_ai/ui/screens/main_screen/pages/place_holder_page.dart';

import 'root_router.gr.dart';

@AutoRouterConfig()
class RootRouter extends $RootRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            CustomRoute(
              page: PlaceHolderRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.noTransition
            ),
            CustomRoute(
                page: BloodTestRoute.page,
                transitionsBuilder: TransitionsBuilders.noTransition,
                durationInMilliseconds: 100
            ),
          ]
        ),
      ];
}

// @MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
//   AutoRoute(page: LoginScreen, initial: true),
//   AutoRoute(page: MainScreen, initial: false),
//   AutoRoute(page: ProfileSettingsScreen, initial: false),
// ]
//     // replaceInRouteName: 'Screen|Dialog,Route',
//     // routes: <AutoRoute>[
//     //   RedirectRoute(path: '*', redirectTo: '/'),
//     //   CustomRoute(page: TabletsScreen, initial: true),
//     //   CustomRoute(
//     //     page: SplashScreen,
//     //     transitionsBuilder: TransitionsBuilders.fadeIn,
//     //     durationInMilliseconds: 500,
//     //   ),
//     // ]
//     )
// class $RootRouter {}

// ignore: non_constant_identifier_names
final AppRouter = RootRouter();
final appContext = AppRouter.navigatorKey.currentContext!;
