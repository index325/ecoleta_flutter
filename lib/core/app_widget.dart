import 'package:ecoleta/detail/detail_page.dart';
import 'package:ecoleta/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ecoleta",
        home: Container(
          child: SplashPage(),
        ));
  }
}
