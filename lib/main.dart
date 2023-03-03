import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laravel_api_provider/Utils/Routes/routes.dart';
import 'package:laravel_api_provider/View-Models/auth_view_model.dart';
import 'package:laravel_api_provider/View-Models/user_view_model.dart';
import 'package:provider/provider.dart';
import 'Utils/Routes/route_names.dart';
import 'Utils/utils.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(206, 21, 103, .1),
  100: const Color.fromRGBO(206, 21, 103, .2),
  200: const Color.fromRGBO(206, 21, 103, .3),
  300: const Color.fromRGBO(206, 21, 103, .4),
  400: const Color.fromRGBO(206, 21, 103, .5),
  500: const Color.fromRGBO(206, 21, 103, .6),
  600: const Color.fromRGBO(206, 21, 103, .7),
  700: const Color.fromRGBO(206, 21, 103, .8),
  800: const Color.fromRGBO(206, 21, 103, .9),
  900: const Color.fromRGBO(206, 21, 103, 1),
};

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> AuthViewModel()),
    ChangeNotifierProvider(create: (_)=> UserViewModel()),
  ],
  child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: const Color(0XFF8DC73F).withOpacity(0.5),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.grey,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laravel Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffCE1567),
        useMaterial3: true,
        buttonTheme: ButtonThemeData(
          buttonColor: Utils.brandColor1,
        ),
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: MaterialColor(0xffCE1567, color)).copyWith(background: Colors.white),
      ),
      initialRoute: RoutesNames.splashScreen,
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
