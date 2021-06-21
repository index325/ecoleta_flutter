import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_images.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/home/home_controller.dart';
import 'package:ecoleta/home/service/location_service.dart';
import 'package:ecoleta/map_view/models/arguments_model.dart';
import 'package:ecoleta/shared/button/button_widget.dart';
import 'package:ecoleta/shared/textfield/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = LocationService();
  final controller = HomeController(service: LocationService());

  @override
  void initState() {
    getStates();
    super.initState();
    autorun((_) {
      if (controller.selectedState.isNotEmpty) {
        controller.selectedCity = "";
        controller.cities = [];
        getCities();
      }
    });
  }

  void getStates() async {
    controller.states = await service.fetchStates();
  }

  void getCities() async {
    controller.cities = await service.fetchCities(controller.selectedState);
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
                  Observer(builder: (context) {
                    return DropdownButtonWidget(
                      label: "Estado",
                      controller: controller,
                      options: controller.states,
                      value: controller.selectedState,
                      onChange: (String? newValue) {
                        controller.selectedState = newValue!;
                      },
                    );
                  }),
                  SizedBox(
                    height: 8,
                  ),
                  Observer(builder: (context) {
                    return DropdownButtonWidget(
                      label: "Cidade",
                      controller: controller,
                      options: controller.cities,
                      value: controller.selectedCity,
                      onChange: (String? newValue) {
                        controller.selectedCity = newValue!;
                      },
                    );
                  }),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(child: Observer(builder: (context) {
                        return ButtonWidget.green(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.white,
                          ),
                          label: "Entrar",
                          enabled: controller.enableNext,
                          onTap: () {
                            if (controller.enableNext) {
                              Navigator.pushReplacementNamed(
                                  context, "/map-view",
                                  arguments: ArgumentsModel(
                                    city: controller.selectedCity,
                                    uf: controller.selectedState,
                                  ));
                            }
                          },
                        );
                      })),
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
