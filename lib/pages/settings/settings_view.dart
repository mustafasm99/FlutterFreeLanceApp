import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/util/icons.dart';
import 'package:finailtask/widgets/page_title_widget.dart';
import 'package:finailtask/widgets/settings_selection.dart';
import 'package:finailtask/widgets/template.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Template(
      freeSpace:const PageTitle(title: "Settings"),
      child:Container(
        margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        width: double.infinity,
        constraints:const BoxConstraints(
          minHeight: 0,
          maxHeight: 320,
        ),
        decoration: BoxDecoration(
          color: context.hoverColor,
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Column(
          children: [
            SettingsSelection(
              title: "account settings",
              deepLink: "/account_settings",
              icon: ProjectIcons.userCircle(
                color: context.primaryColor,
                size: 25,
              ),
            ),
            SettingsSelection(
              title: "privacy&security",
              deepLink: "/privacy_security",
              icon: ProjectIcons.securityLock(
                color: context.primaryColor,
                size: 25,
              ),
            ),
            SettingsSelection(
              title: "language",
              deepLink: "/language",
              icon: ProjectIcons.languageCircle(
                color: context.primaryColor,
                size: 25,
              ),
            ),
            SettingsSelection(
              title: "appearance",
              deepLink: "/appearance",
              icon: ProjectIcons.paintBoard(
                color: context.primaryColor,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
