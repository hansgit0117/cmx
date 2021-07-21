import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class AuthController extends GetxController {
  final hidePassword = true.obs;
  final isLoading = false.obs;
  
  final formKey = GlobalKey<FormState>();

  UserRepository usersRepo = new UserRepository();
  
  Authenticate authenticate = new Authenticate();
  final user = new User().obs;

  void login() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await authenticateUser();

      // await issueToken();
      Get.offAllNamed(Routes.ROOT);
    }
  }

  void authenticateUser() async {
    user.value = await usersRepo.login();
  }

  // void issueToken() async {
  //   await _usersRepo.issueToken(tokenRequest));
  // }
}
