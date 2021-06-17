import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../global_widgets/block_button_widget.dart';
import '../../../global_widgets/text_field_widget.dart';
import '../../../models/setting_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/settings_service.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final Setting _settings = Get.find<SettingsService>().setting.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login".tr,
            style: Get.textTheme.headline6.merge(TextStyle(color: context.theme.primaryColor)),
          ),
          centerTitle: true,
          backgroundColor: Get.theme.accentColor, 
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: ListView(
          primary: true,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 180,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Get.theme.accentColor,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(color: Get.theme.focusColor.withOpacity(0.2), blurRadius: 10, offset: Offset(0, 5)),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 50),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          _settings.appName,
                          style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.primaryColor, fontSize: 24)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Manage contracts and business relationships smartly".tr,
                          style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.primaryColor)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: Ui.getBoxDecoration(
                    radius: 14,
                    border: Border.all(width: 5, color: Get.theme.primaryColor),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/icon/icon.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [          
                  Expanded(      
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        Get.offAllNamed(Routes.ROOT);
                      },
                      child: Image.asset(
                        'assets/icon/gsuite.png',
                        fit: BoxFit.contain,
                      ).marginSymmetric(vertical: 15, horizontal: 15),
                    )
                  ),
                  Expanded(      
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        Get.offAllNamed(Routes.ROOT);
                      },
                      child: Image.asset(
                        'assets/icon/salesforce.png',
                        fit: BoxFit.contain,
                      ).marginSymmetric(vertical: 15, horizontal: 15),
                    )
                  ),
                  Expanded(      
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        Get.offAllNamed(Routes.ROOT);
                      },
                      child: Image.asset(
                        'assets/icon/azure.png',
                        fit: BoxFit.contain,
                      ).marginSymmetric(vertical: 15, horizontal: 15),
                    )
                  ),
                  Expanded(      
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        Get.offAllNamed(Routes.ROOT);
                      },
                      child: Image.asset(
                        'assets/icon/onelogin.png',
                        fit: BoxFit.contain,
                      ).marginSymmetric(vertical: 15, horizontal: 15),
                    )
                  ),
                  Expanded(      
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      onTap: () {
                        Get.offAllNamed(Routes.ROOT);
                      },
                      child: Image.asset(
                        'assets/icon/okta.png',
                        fit: BoxFit.contain,
                      ).marginSymmetric(vertical: 15, horizontal: 15),
                    )
                  ),
                ],
              ).marginSymmetric(vertical: 3, horizontal: 20),
            ),
            TextFieldWidget(
              labelText: "Domain Name".tr,
              hintText: "www.contractexperience.com".tr,
              iconData: Icons.domain,
            ),
            TextFieldWidget(
              labelText: "Email Address".tr,
              hintText: "johndoe@gmail.com".tr,
              iconData: Icons.alternate_email,              
            ),
            Obx(() {
              return TextFieldWidget(
                labelText: "Password".tr,
                hintText: "••••••••••••".tr,
                obscureText: controller.hidePassword.value,
                iconData: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.hidePassword.value = !controller.hidePassword.value;
                  },
                  color: Theme.of(context).focusColor,
                  icon: Icon(controller.hidePassword.value ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Get.offAndToNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: Text(
                    "Forgot Password?".tr,
                  style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.accentColor, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
            BlockButtonWidget(
              onPressed: () {
                Get.offAllNamed(Routes.ROOT);
              },
              color: Get.theme.accentColor,
              text: Text(
                "Login".tr,
                style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.primaryColor)),
              ),
            ).paddingSymmetric(horizontal: 20),
            SizedBox(height: 10),            
          ],
        ));
  }
}
