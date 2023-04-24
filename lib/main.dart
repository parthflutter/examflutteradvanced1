import 'package:examflutteradvanced/screen/provider/home_provider.dart';
import 'package:examflutteradvanced/screen/view/Api_screen.dart';
import 'package:examflutteradvanced/screen/view/button%20screen/button_screen.dart';
import 'package:examflutteradvanced/screen/view/pattern_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CovidProvider(),),
  ],
    child: MaterialApp(debugShowCheckedModeBanner: false,
      routes: {
      '/':(context) => botton_screen(),
        'pattern':(context) => HomeScreen(),
        'Api_screen':(context) => Api_screen(),
      },
    ),
  ),
  );
}