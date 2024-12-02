
import 'package:addiscollections/App/Presentations/Splash/splash_screen.dart';
import 'package:addiscollections/App/Route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../Presentations/Home/home_screen.dart';








final GoRouter routeFunction =GoRouter (

    initialLocation: '/',
    navigatorKey: GlobalKey<NavigatorState>(),

    routes: [
      GoRoute(name : RouteName.splashScreen,            path: "/", builder: (context, state) => const SplashScreen(),),
      GoRoute(name : RouteName.homeScreen,            path: "/homeScreen", builder: (context, state) => const HomeScreen(),),


    ]

);