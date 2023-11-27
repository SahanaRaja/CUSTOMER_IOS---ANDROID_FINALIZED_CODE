import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import '../../../core/app_constants.dart';
import 'header_controller.dart';

class ViewController extends GetxController {
  HeaderController headerController = Get.put(HeaderController());
  var viewKey = ''.obs;
   var useroption = ''.obs;
  var userSuboption = ''.obs;
  var errorMess = ''.obs;
  var infoMess = ''.obs;
  var index = 0;
  var previousViewKey = '';
  var previousheader = '';
  var merchantLogin = false.obs;
  var managerLogin = false.obs;
  var setflag = ''.obs;
  var permissionGranted = false;
  var successMess = ''.obs;
  var searchoption = ''.obs;
  var listindex = 0;
  var qrvalue = "";
  bool isdelivaryaddress = false;
  int addressbookselectedindex = 0;
  int productview = 0;
  var addressbookselectedbuildingtype = '';
  var balancecheck = '';
  var shoppingtype = '';
  var deliverytype = '';
  var onselection = '';
  var customerAddrId = 0.obs;

  List<String> previousKey = [];
  List<String> previousOption = [];
  List<String> previousSubHeader = [];
  List<String> previousThirdHeader =[];
  //var lastindex = 

  @override
  void onInit() {
    setView(LOADING);
    super.onInit();
  }

  setPreviousView({String? view}) {
    if (view == null) {
      viewKey.value = previousViewKey;
      headerController.subHeaderLabel.value = previousheader;
    } else {
      viewKey.value = view;
    }
  }

  setArrowView(optioncontroller,headerController) {
    print(previousKey);
    print(previousOption);

     //previousViewKey = viewKey.value;

    viewKey.value = previousKey[previousKey.length - 1];

    optioncontroller.optionsKey.value =
        previousOption[previousOption.length - 1];
    headerController.subHeaderLabel.value = previousSubHeader[previousSubHeader.length - 1];
     headerController.subThirdHeaderLabel.value = previousThirdHeader[previousThirdHeader.length - 1];

    previousKey.removeLast();
    previousOption.removeLast();
    previousSubHeader.removeLast();
    previousThirdHeader.removeLast();
     //previousKey.add(viewKey.value);
  }

  setView(String key) {
    if (key != '' && key != INFO && key != LOADING && key != SPLASH ) {
      
      if(viewKey.value.isNotEmpty && viewKey.value != INFO && viewKey.value != SUCCESS && viewKey.value != ERROR && viewKey.value != SPLASH && viewKey.value != CLIENTLOGIN){
         previousKey.add(viewKey.value.toString());
         previousOption.add(optionsController.optionsKey.value);
         previousSubHeader.add(headerController.subHeaderLabel.value);
         previousThirdHeader.add(headerController.subThirdHeaderLabel.value);

        
         print(">>>>>>>>>>>>$previousKey");
         print(">>>>>>>>>>>>$previousOption");
         print(">>>>>>>>>>>>$previousSubHeader");
         print(">>>>>>>>>>>>$previousThirdHeader");
         
      }
     
    }
    previousViewKey = viewKey.value;
    viewKey.value = key;
  }

  setPermissionRequest() {
    permissionGranted = true;
    update();
  }

  setFlagView(String key) {
    // previousViewKey = viewKey.value;
    setflag.value = key;
    update();
  }

  setIndexValue(int index) {
    this.index = index;
  }

  setLogFirstTime(bool managerLogin) {
    this.managerLogin.value = managerLogin;
  }

  setMerchantLogin(bool merchantLogin) {
    this.merchantLogin.value = merchantLogin;
  }

  setUserOption(String useroption) {
    this.useroption.value = useroption;
    // headerController.setHeaderLabel(useroption);
  }

  setSubUserOption(String userSuboption) {
    this.userSuboption.value = userSuboption;
    // headerController.setHeaderLabel(useroption);
  }

  setErrorMessage(String errorMess) {
    this.errorMess.value = errorMess;
  }

  setInfoMessage(String infoMess) {
    this.infoMess.value = infoMess;
  }

  setSuccessMessage(String successMess) {
    this.successMess.value = successMess;
  }

  setsearchoption(String usersearchoption) {
    searchoption.value = usersearchoption;
  }

  setlistindex(int index) {
    listindex = index;
  }
}
