import 'package:flutter/material.dart';
import 'package:product_get_post_api/screens/home/provider/home_provider.dart';
import 'package:product_get_post_api/screens/home/view/home_Screen.dart';
import 'package:product_get_post_api/screens/home/view/second_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SecondScreen(),
          'home': (context) => HomeScreen(),
        },
      ),
    ),
  );
}
