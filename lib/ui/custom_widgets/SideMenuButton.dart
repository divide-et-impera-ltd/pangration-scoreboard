
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pangration_score/app/Firebase/UserInstanceController.dart';

import '../../main.dart';

class SideMenuButton extends StatelessWidget {
  const SideMenuButton(
      this.menuButtonText,
      this.menuButtonIcon,
      this.menuButtonRoute
      );

  final String menuButtonText;
  final Icon menuButtonIcon;
  final Widget menuButtonRoute;
  @override
  Widget build(BuildContext context) {
    UserInstanceController userInstanceController = UserInstanceController();
    return ListTile(
        title: Text(menuButtonText),
        trailing: menuButtonIcon,
        onTap: () {
          if(menuButtonText == "Log out") {
            userInstanceController.signOutUser();
          }
          Navigator.of(context).pop();
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => menuButtonRoute)
          );
        }
    );
  }

}