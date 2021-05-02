import 'package:ecoleta/core/app_images.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo1),
              SizedBox(
                height: 40,
              ),
              Text(
                "Carregando...",
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
