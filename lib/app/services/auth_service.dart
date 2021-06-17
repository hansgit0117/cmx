import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/ui.dart';
import '../models/address_model.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class AuthService extends GetxService {
  final user = User().obs;
  final address = Address().obs;
  GetStorage _box;

  UserRepository _usersRepo;

  AuthService() {
    _usersRepo = new UserRepository();
    _box = new GetStorage();
  }

  Future<AuthService> init() async {
    // TODO Complete version
    // if (user.value.auth == null && _box.hasData('current_user')) {
    //   user.value = User.fromJson(json.decode(await _box.read('current_user')));
    //   user.value.auth = true;
    // } else {
    //   user.value.auth = false;
    // }

    user.value = await _usersRepo.login();
    user.value.auth = true;

    address.listen((Address _address) {
      _box.write('current_address', _address);
    });

    await getAddress();

    return this;
  }

  Future getAddress() async {
    try {
      if (_box.hasData('current_address')) {
        address.value = Address.fromJson(await _box.read('current_address'));
      } else {
        List<Address> _addresses = await _usersRepo.getAddresses();
        if (_addresses.isNotEmpty) {
          address.value = _addresses.firstWhere((_address) => _address.isDefault, orElse: () {
            return _addresses.first;
          });
        } else {
          address.value = new Address(address: "Please choose your address".tr);
        }
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  bool get isAuth => user.value.auth ?? false;
}
