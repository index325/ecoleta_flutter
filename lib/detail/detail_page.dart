import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/core/app_images.dart';
import 'package:ecoleta/core/app_text_styles.dart';
import 'package:ecoleta/shared/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
              Text(
                "Colectora",
                style: AppTextStyles.title,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Resíduos Eletrônicos, Lâmpadas, Pilhas e Baterias",
                style: AppTextStyles.detailTags,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Endereço",
                style: AppTextStyles.detailTitleAddress,
              ),
              Text(
                "Rio do Sul, Santa Catarina Guilherme Gemballa, Jardim América Nº 260",
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
