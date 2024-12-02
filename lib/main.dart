import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'App/Internet/no_internet_screen.dart';
import 'App/Route/route.dart';
import 'App/Utils/theme_styles.dart';




Future<void> main() async{




  runApp(  const AddisCollectionsApp());


}

class AddisCollectionsApp extends StatelessWidget  {
  const AddisCollectionsApp({super.key});





  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: ThemeStyles.primary,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    return OverlaySupport.global(
      child: MaterialApp.router(
        routerConfig:routeFunction ,
        builder: (context, child) => StreamBuilder<List<ConnectivityResult>>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              final connectivityResult = snapshot.data?.isNotEmpty == true ? snapshot.data!.first : null;
              if (connectivityResult == ConnectivityResult.none ||
                  connectivityResult == null) return const NoInternetScreen();

              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            }),
        debugShowCheckedModeBanner: false,
        theme: ThemeStyles.lightTheme,
        themeMode: ThemeMode.system,

      ),
    );
  }
}