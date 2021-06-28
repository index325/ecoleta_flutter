import 'package:ecoleta/core/app_colors.dart';
import 'package:ecoleta/shared/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailBottomNavigationBar extends StatelessWidget {
  const DetailBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
