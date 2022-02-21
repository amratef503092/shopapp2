import 'package:flutter/material.dart';
import 'package:shopapp22/presentation/forget_password/forget_password_screen.dart';
import 'package:shopapp22/presentation/login/login_screen.dart';
import 'package:shopapp22/presentation/main/main_screen.dart';
import 'package:shopapp22/presentation/onboarding_screen/onboaeding_screen.dart';
import 'package:shopapp22/presentation/register/register_screen.dart';
import 'package:shopapp22/presentation/resources/string_manager.dart';
import 'package:shopapp22/presentation/splash_screen/splash_screen.dart';
import 'package:shopapp22/presentation/storeDetai_screen/store_detail_screen.dart';

class Routes{
  static const String splashRoute = "/"; //initial route
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/storeDetail";

}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
   switch(routeSettings.name){
     case Routes.splashRoute:
       return MaterialPageRoute(
         builder: (context) => SplashScreen(),);
     case Routes.onBoardingRoute:
       return MaterialPageRoute(
         builder: (context) => OnBoardingScreen(),);
     case Routes.loginRoute:
       return MaterialPageRoute(
         builder: (context) => LoginScreen(),);
     case Routes.registerRoute:
       return MaterialPageRoute(
         builder: (context) => RegisterScreen(),);
     case Routes.forgetPasswordRoute:
       return MaterialPageRoute(
         builder: (context) => ForgetPassword(),);
     case Routes.mainRoute:
       return MaterialPageRoute(
         builder: (context) => MainScreen(),);
     case Routes.storeDetailRoute:
       return MaterialPageRoute(
         builder: (context) => StoreDetail(),);
       default:
         return unDefinedRoute();

   }
  }

  static Route unDefinedRoute() =>MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text(AppString.undefinedRoute),
      ),
      body: Center(
        child:Text(AppString.undefinedRoute),
      ),
    )) ;
}
