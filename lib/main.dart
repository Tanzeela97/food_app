import 'package:flutter/material.dart';
import 'package:food_delivery_provider/provider/myprovider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create:(_)=>MyProvider(),
    child: MyApp(),),

  );
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/': (context) => HomePage(),
      },

      debugShowCheckedModeBanner: false,
      builder: (context, widget) =>
          ResponsiveWrapper.builder( BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints:const[
                ResponsiveBreakpoint.resize(480, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                 ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
              background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: "/",

    );
  }
}
