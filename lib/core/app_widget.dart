import 'package:ecoleta/detail/detail_page.dart';
import 'package:ecoleta/home/home_page.dart';
import 'package:ecoleta/map_view/map_view_page.dart';
import 'package:ecoleta/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecoleta",
      home: Container(
        child: SplashPage(),
      ),
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        '/map-view': (context) => MapViewPage(),
        '/point': (context) => DetailPage()
      },
    );
  }
}
