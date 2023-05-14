// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:longevity_ai/ui/screens/main_screen/main_screen.dart' as _i1;

abstract class $RootRouter extends _i2.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MainScreen(key: args.key),
      );
    }
  };
}

/// generated route for
/// [_i1.MainScreen]
class MainRoute extends _i2.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i2.PageInfo<MainRouteArgs> page =
      _i2.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}
