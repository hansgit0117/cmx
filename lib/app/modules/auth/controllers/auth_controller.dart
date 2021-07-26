import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/ui.dart';
import '../../../routes/app_pages.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class AuthController extends GetxController {
  final hidePassword = true.obs;
  final isLoading = false.obs;
  final enabled = false.obs;
  
  final formKey = GlobalKey<FormState>();
  UserRepository usersRepo = new UserRepository();
  Authenticate authenticate = new Authenticate();
  final user = new User().obs;

  void login() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        await authenticateUser(authenticate);
      } on Exception catch(error) {
        print('error caught: $error');
        Get.showSnackbar(Ui.ErrorSnackBar(message: "Incorrect credentials. Please try again.".tr));
        return;
      }

      try {
        await issueToken(authenticate);
      } on Exception catch(error) {
        print('error caught: $error');
        Get.showSnackbar(Ui.ErrorSnackBar(message: "Incorrect credentials. Please try again.".tr));
        return;
      }
      Get.offAllNamed(Routes.ROOT);
    }
  }

  void loginWithGoogle() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void loginWithSalesforce() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void loginWithAzure() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void loginWithOnelogin() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void loginWithOkta() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void authenticateUser(Authenticate authenticate) async {
    user.value = await usersRepo.login(authenticate);
    authenticate.authorizationCode = user.value.authorizationCode;
    authenticate.xAuthToken = user.value.xAuthToken;
  }

  void issueToken(Authenticate authenticate) async {
    user.value = await usersRepo.issueToken(authenticate);
  }
}
