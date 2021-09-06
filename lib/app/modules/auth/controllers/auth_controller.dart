import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../../common/ui.dart';
import '../../../routes/app_pages.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class AuthController extends GetxController {
  final hidePassword = true.obs;
  final isLoading = false.obs;
  final enabled = true.obs;
  String authType;
  
  final formKey = GlobalKey<FormState>();
  UserRepository usersRepo = new UserRepository();
  Authenticate authenticate = new Authenticate();
  final user = new User().obs;

  // Azure OAuth
  static final Config config = Config(
    tenant: 'YOUR_TENANT_ID',
    clientId: 'YOUR_CLIENT_ID',
    scope: 'openid profile offline_access',
    redirectUri: 'https://login.live.com/oauth20_desktop.srf',
  );
  final AadOAuth oauth = AadOAuth(config);

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  /*
   * Login
   */
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
      authType = "normal";
      print(authType);
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
    // try {
    //   await oauth.login();
    //   var accessToken = await oauth.getAccessToken();
    //   authType = "azure";
    //   print('Logged in successfully, your access token: $accessToken');
    // } catch (e) {
    //   print(e);
    //   Get.showSnackbar(Ui.ErrorSnackBar(message: "Incorrect credentials. Please try again.".tr));
    // }
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void loginWithOnelogin() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  void loginWithOkta() async {
    await Future.delayed(Duration(milliseconds: 2000));
  }

  /*
   * Logout
   */
  void logout(context) async {
    // Reusable alert style
    var alertStyle = AlertStyle(
        overlayColor: Color(0x55000000),
        alertAlignment: Alignment.center
      );

    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      desc: "Are you sure you want to logout?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Get.theme.primaryColor, fontSize: 18),
          ),
          onPressed: () => tryLogout(),
          color: Get.theme.accentColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Get.theme.primaryColor, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(116, 116, 191, 1.0),
        )
      ],
      style: alertStyle,
    ).show();
  }

  void tryLogout() async {
    try {
      print(authType);
      switch (authType) {
        case "normal": print("########### Normal"); break;
        case "azure": oauth.logout(); break;

        default: break;
      }
              
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
      Get.showSnackbar(Ui.ErrorSnackBar(message: "Could not logout. Please try again".tr));
    }
  }

  /*
   * Useful functions
   */
  void authenticateUser(Authenticate authenticate) async {
    user.value = await usersRepo.login(authenticate);
    Get.log(user.value.authorizationCode);
    authenticate.authorizationCode = user.value.authorizationCode;
  }

  void issueToken(Authenticate authenticate) async {
    User user = await usersRepo.issueToken(authenticate);
    authenticate.xAuthToken = user.xAuthToken;
    Get.find<AuthService>().authenticate.value = authenticate;
  }
}
