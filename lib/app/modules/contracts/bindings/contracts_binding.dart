import 'package:get/get.dart';
import '../controllers/contracts_controller.dart';

class ContractsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContractsController>(
      () => ContractsController(),
    );
  }
}
