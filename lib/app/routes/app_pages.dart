import 'package:get/get.dart' show GetPage;

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Routes.ROOT, page: () => RootView(), binding: RootBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginView(), binding: AuthBinding()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordView(), binding: AuthBinding()),
  ];
}
