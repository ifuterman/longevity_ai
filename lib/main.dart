import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:longevity_ai/ui/router/root_router.dart';

import 'globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runZonedGuarded(
          () => runApp(
        const ProviderScope(child: MyApp()),
      ),
          (error, stack) {});
}

// Extend ConsumerWidget instead of StatelessWidget,
// which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    appRef = ref;
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      builder: (context, _) {
        return Builder(
          builder: (context) {
            return MaterialApp.router(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routerDelegate: AppRouter.delegate(),
              routeInformationProvider: AppRouter.routeInfoProvider(),
              routeInformationParser: AppRouter.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
