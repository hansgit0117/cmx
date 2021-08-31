import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../../common/ui.dart';
import '../../../models/task_model.dart';
import '../../../repositories/tasks_repository.dart';

enum TasksLayout { GRID, LIST }

class TaskController extends GetxController {
  TasksRepository _tasksRepository;
  Authenticate authenticate;

  final tasks = <Task>[].obs;
  final layout = TasksLayout.LIST.obs;

  TaskController() {
    _tasksRepository = new TasksRepository();
  }

  @override
  Future<void> onInit() async {
    authenticate = await Get.find<AuthService>().authenticate.value;
    await refreshTasks();
    super.onInit();
  }

  Future refreshTasks({bool showMessage}) async {
    await getTasks(authenticate);
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of tasks refreshed successfully".tr));
    }
  }

  Future getTasks(Authenticate authenticate) async {
    try {
      tasks.value = await _tasksRepository.getAll(authenticate);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}