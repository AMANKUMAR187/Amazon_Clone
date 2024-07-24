
import 'package:flutter/material.dart';

import 'feature/Home/screen/home.dart';
import 'feature/auth/auth_screen/authscreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){

  switch (routeSettings.name){
    case AuthScreen.routename :
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthScreen());

    case HomeScreen.routename:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );


   default :
       return MaterialPageRoute(builder: (_) => Text('screen not exist'));
  }
}