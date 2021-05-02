import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_images.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/map_view/map_view_page.dart';
import 'package:ecoleta/shared/button/button_widget.dart';
import 'package:ecoleta/shared/textfield/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<StatesModel> futureStates;

  @override
  void initState() {
    super.initState();
    // futureStates = fetchStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          image: DecorationImage(
            image: AssetImage(AppImages.logo2),
            alignment: Alignment.topLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    child: Image.asset(AppImages.logo1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Text(
                      "Ecoleta",
                      style: AppTextStyles.title20bold,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Seu marketplace de coleta de resíduos.",
                        style: AppTextStyles.title,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Ajudamos pessoas a encontrarem pontos de coleta de forma eficiente.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  DropdownButtonWidget(),
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget.green(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.white,
                          ),
                          label: "Entrar",
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => MapViewPage(),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
