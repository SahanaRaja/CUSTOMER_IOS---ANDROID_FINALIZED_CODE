import 'package:get/get.dart';

class LoadingController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  setLoading(bool status) {
    _isLoading.value = status;
  }
}
