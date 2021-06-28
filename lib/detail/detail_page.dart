import 'package:ecoleta/detail/detail_controller.dart';
import 'package:ecoleta/detail/models/detail_arguments.dart';
import 'package:ecoleta/detail/models/detail_items_model.dart';
import 'package:ecoleta/map_view/models/item_model.dart';
import 'package:ecoleta/map_view/models/point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_images.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/detail/service/detail_service.dart';
import 'package:ecoleta/shared/button/button_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final service = DetailService();
  final controller = DetailController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as DetailArguments;
      getDetail(arguments);
    });
    super.initState();
  }

  getDetail(DetailArguments args) async {
    final model = await service.fetchDetail(id: args.id);

    controller.items = model.items;
    controller.point = model.point;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(68),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(AppImages.coletoraPlaceholder),
              ),
              SizedBox(
                height: 8,
              ),
              Observer(builder: (_) {
                return Text(
                  "${controller.point.name}",
                  style: AppTextStyles.title,
                );
              }),
              SizedBox(
                height: 16,
              ),
              Observer(builder: (_) {
                return Column(
                  children: [
                    Wrap(
                      children: controller.items
                          .map((e) => Text(
                                "${e.title}, ",
                                style: AppTextStyles.detailTags,
                              ))
                          .toList(),
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 40,
              ),
              Text(
                "Endereço",
                style: AppTextStyles.detailTitleAddress,
              ),
              Text(
                controller.point.address,
                style: AppTextStyles.detailBodyAddress,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.lightGrey,
              width: 2,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: ButtonWidget.green(
                    enabled: true,
                    icon: FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: AppColors.white,
                    ),
                    label: "Whatsapp",
                    onTap: () {
                      print("teste");
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, left: 4),
                  child: ButtonWidget.green(
                    enabled: true,
                    icon: Icon(
                      Icons.mail_outline,
                      color: AppColors.white,
                    ),
                    label: "E-mail",
                    onTap: () {
                      print("teste");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
