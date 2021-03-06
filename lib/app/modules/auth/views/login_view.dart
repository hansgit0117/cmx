import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
      body: LoaderOverlay(
        overlayColor: Colors.blue,
        overlayOpacity: 0.2,
        child: ListView(
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
                      onTap: () async {
                        context.loaderOverlay.show();
                        controller.isLoading.value = !controller.isLoading.value;
                        await controller.loginWithGoogle();
                        if (controller.isLoading.value) {
                          context.loaderOverlay.hide();
                        }
                        controller.isLoading.value = context.loaderOverlay.visible;
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
                      onTap: () async {
                        context.loaderOverlay.show();
                        controller.isLoading.value = !controller.isLoading.value;
                        await controller.loginWithSalesforce();
                        if (controller.isLoading.value) {
                          context.loaderOverlay.hide();
                        }
                        controller.isLoading.value = context.loaderOverlay.visible;
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
                      onTap: () async {
                        context.loaderOverlay.show();
                        controller.isLoading.value = !controller.isLoading.value;
                        await controller.loginWithAzure();
                        if (controller.isLoading.value) {
                          context.loaderOverlay.hide();
                        }
                        controller.isLoading.value = context.loaderOverlay.visible;
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
                      onTap: () async {
                        context.loaderOverlay.show();
                        controller.isLoading.value = !controller.isLoading.value;
                        await controller.loginWithOnelogin();
                        if (controller.isLoading.value) {
                          context.loaderOverlay.hide();
                        }
                        controller.isLoading.value = context.loaderOverlay.visible;
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
                      onTap: () async {
                        context.loaderOverlay.show();
                        controller.isLoading.value = !controller.isLoading.value;
                        await controller.loginWithOkta();
                        if (controller.isLoading.value) {
                          context.loaderOverlay.hide();
                        }
                        controller.isLoading.value = context.loaderOverlay.visible;
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
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return TextFieldWidget(
                      enabled: controller.enabled.value,
                      labelText: "Domain Name".tr,
                      hintText: "live".tr,
                      onSaved: (input) => controller.authenticate.domainName = input.trim(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter domain name";
                        }
                        return null;
                      },
                      iconData: Icons.domain,
                    );
                  }),
                  Obx(() {
                    return TextFieldWidget(
                      enabled: controller.enabled.value,
                      labelText: "Email Address".tr,
                      hintText: "johndoe@gmail.com".tr,
                      onSaved: (input) => controller.authenticate.email = input.trim(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email";
                        } else {
                          if (!value.contains('@')) {
                            return "Please enter valid email";
                          }
                        }
                        return null;
                      },                    
                      iconData: Icons.alternate_email,              
                    );
                  }),
                  Obx(() {
                    return TextFieldWidget(
                      enabled: controller.enabled.value,
                      labelText: "Password".tr,
                      hintText: "????????????????????????????????????".tr,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        } else {
                          if (value.length < 5)
                            return "Password should be more than 5 letters";
                        }
                        return null;
                      },
                      onSaved: (input) =>  controller.authenticate.password = input.trim(),
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
                ],
              )
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     TextButton(
            //       onPressed: () {
            //         Get.offAndToNamed(Routes.FORGOT_PASSWORD);
            //       },
            //       child: Text(
            //         "Forgot Password?".tr,
            //       style: Get.textTheme.caption.merge(TextStyle(color: Get.theme.accentColor, fontWeight: FontWeight.bold)),
            //       ),
            //     ),
            //   ],
            // ).paddingSymmetric(horizontal: 20),
            SizedBox(
              height: 30,
            ),
            BlockButtonWidget(
              onPressed: () async { 
                context.loaderOverlay.show();
                controller.isLoading.value = !controller.isLoading.value;
                controller.enabled.value = !controller.enabled.value;
                await controller.login();
                if (controller.isLoading.value) {
                  context.loaderOverlay.hide();
                }
                controller.enabled.value = !controller.enabled.value;
                controller.isLoading.value = context.loaderOverlay.visible;
              },
              color: Get.theme.accentColor,
              text: Text(
                "Login".tr,
                style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.primaryColor)),
              ),
            ).paddingSymmetric(horizontal: 20),
            SizedBox(height: 10),            
          ],
        )
      ),
    );
  }
}
