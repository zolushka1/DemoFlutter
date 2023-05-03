import 'package:demo/Screens/list_screen.dart';
import 'package:demo/Utilities/Common.dart';
import 'package:demo/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final _navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ListScreen.routeName: (context) => ListScreen()
      },
      navigatorKey: Common.navigatorKey,
      initialRoute: HomeScreen.routeName,
    );
  }
}
