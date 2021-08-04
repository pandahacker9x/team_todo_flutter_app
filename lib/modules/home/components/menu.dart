import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:team_todo_app/base/base_get_widget.dart';
import 'package:team_todo_app/constants/sizes.dart';
import 'package:team_todo_app/widgets/badge_widget.dart';
import 'package:team_todo_app/widgets/menu_item.dart';

import '../controller.dart';

class Menu extends BaseGetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem("Teams", Icons.group_outlined, () {
                Get.toNamed('/teams');
              }),
              _buildMenuItem("Tasks", Icons.event_note_outlined, () {}),
              Obx(() {
                return _buildMenuItem(
                  "Notifications",
                  Icons.notifications_outlined,
                  () {
                    Get.toNamed('/notifications');
                  },
                  controller.newNotiNum.value,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData iconData, Function onTap,
      [int badgeNum = 0]) {
    return MenuItem(
      title: title,
      child: BadgeWidget(
        badgeNumber: badgeNum,
        child: Icon(iconData, size: Sizes.s44),
        hidebadgeIfZeroNumber: true,
      ),
      onTap: onTap,
      size: Sizes.s96,
    );
  }
}
