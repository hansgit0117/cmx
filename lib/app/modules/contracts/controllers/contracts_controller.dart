import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../models/oauth20models/authenticate_model.dart';
import '../../../../common/ui.dart';
import '../../../models/expiring_contract_model.dart';
import '../../../repositories/expiring_contract_repository.dart';

enum ContractsLayout { GRID, LIST }

class ContractsController extends GetxController {
  ExpiringContractRepository _expiringContractRepository;
  Authenticate authenticate;

  final expiringContracts = <ExpiringContract>[].obs;
  final layout = ContractsLayout.LIST.obs;

  ContractsController() {
    _expiringContractRepository = new ExpiringContractRepository();
  }

  @override
  Future<void> onInit() async {
    authenticate = Get.find<AuthService>().authenticate.value;
    await refreshContracts();
    super.onInit();
  }

  Future refreshContracts({bool showMessage}) async {
    await getExpiringContracts(authenticate);
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(message: "List of expiring contracts refreshed successfully".tr));
    }
  }

  Future getExpiringContracts(Authenticate authenticate) async {
    try {
      expiringContracts.value = await _expiringContractRepository.getAll(authenticate);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }
}