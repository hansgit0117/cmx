import 'package:get/get.dart' show GetPage;

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/forgot_password_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/contracts/bindings/contracts_binding.dart';
import '../modules/contracts/views/expiring_contracts_view.dart';
import '../modules/task/bindings/task_binding.dart';
import '../modules/task/views/task_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(name: Routes.ROOT, page: () => RootView(), binding: RootBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginView(), binding: AuthBinding()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordView(), binding: AuthBinding()),
    GetPage(name: Routes.EXPIRING_CONTRACTS, page: () => ExpiringContractsView(), binding: ContractsBinding()),
    GetPage(name: Routes.TASKS, page: () => TaskView(), binding: TaskBinding()),
    GetPage(name: Routes.NOTIFICATIONS, page: () => NotificationsView(), binding: NotificationsBinding()),
  ];
}
