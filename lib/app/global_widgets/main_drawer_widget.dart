/*
 * Written By Honesty (c) 2021 .
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/auth/controllers/auth_controller.dart';
import '../modules/root/controllers/root_controller.dart' show RootController;
import '../routes/app_pages.dart';
import '../services/settings_service.dart';
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              //currentUser.value.apiToken != null ? Navigator.of(context).pushNamed('/Profile') : Navigator.of(context).pushNamed('/Login');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).hintColor.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome".tr, style: Get.textTheme.headline5.merge(TextStyle(color: Theme.of(context).accentColor))),
                  SizedBox(height: 5),
                  Text("Implement Optimal Contract Management System Efficiency In Your Business".tr, style: Get.textTheme.bodyText1),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          DrawerLinkWidget(
            icon: Icons.home_outlined,
            text: "Home",
            onTap: (e) {
              Get.back();
              Get.find<RootController>().changePage(0);
            },
          ),
          // DrawerLinkWidget(
          //   icon: Icons.calendar_today_outlined,
          //   text: "Calendar",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(0);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.request_page_outlined,
          //   text: "Requests",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(0);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.edit_outlined,
          //   text: "Signature",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(0);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.source_outlined,
          //   text: "Sourcing",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(0);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.import_contacts_rounded,
            text: "Contracts",
            onTap: (e) {
              Get.back();
              Get.find<RootController>().changePage(1);
            },
          ),
          // DrawerLinkWidget(
          //   icon: Icons.analytics_outlined,
          //   text: "Analytics & Reports",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(0);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.task,
            text: "Tasks",
            onTap: (e) {
              Get.back();
              Get.find<RootController>().changePage(2);
            },
          ),
          // DrawerLinkWidget(
          //   icon: Icons.search,
          //   text: "Search",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(5);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.notifications_none_outlined,
            text: "Notifications",
            onTap: (e) {
              Get.back();
              Get.find<RootController>().changePage(3);
            },
          ),                    
          // ListTile(
          //   dense: true,
          //   title: Text(
          //     "Application preferences".tr,
          //     style: Get.textTheme.caption,
          //   ),
          //   trailing: Icon(
          //     Icons.remove,
          //     color: Get.theme.focusColor.withOpacity(0.3),
          //   ),
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.person_outline,
          //   text: "Account",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(3);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.settings_outlined,
          //   text: "Settings",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(3);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.translate_outlined,
          //   text: "Languages",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(3);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.brightness_6_outlined,
          //   text: Get.isDarkMode ? "Light Theme" : "Dark Theme",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(3);
          //   },
          // ),
          // ListTile(
          //   dense: true,
          //   title: Text(
          //     "Help & Privacy",
          //     style: Get.textTheme.caption,
          //   ),
          //   trailing: Icon(
          //     Icons.remove,
          //     color: Get.theme.focusColor.withOpacity(0.3),
          //   ),
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.help_outline,
          //   text: "Help & FAQ",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(3);
          //   },
          // ),
          // DrawerLinkWidget(
          //   icon: Icons.privacy_tip_outlined,
          //   text: "Privacy Policy",
          //   onTap: (e) {
          //     Get.back();
          //     Get.find<RootController>().changePage(3);
          //   },
          // ),
          DrawerLinkWidget(
            icon: Icons.logout,
            text: "Logout",
            onTap: (e) {
              authController.logout(context);
            },
          ),
          if (Get.find<SettingsService>().setting.value.enableVersion)
            ListTile(
              dense: true,
              title: Text(
                "Version".tr + " " + Get.find<SettingsService>().setting.value.appVersion,
                style: Get.textTheme.caption,
              ),
              trailing: Icon(
                Icons.remove,
                color: Get.theme.focusColor.withOpacity(0.3),
              ),
            )
        ],
      ),
    );
  }
}
