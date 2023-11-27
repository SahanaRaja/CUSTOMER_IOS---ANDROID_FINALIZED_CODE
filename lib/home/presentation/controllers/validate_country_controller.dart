import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ValidateCountryController extends GetxController {
  var isActive = false.obs;

  activeMenu() {
    isActive.value = true;
  }

  deActiveMenu() {
    isActive.value = false;
  }
}
