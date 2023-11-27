// ignore_for_file: avoid_print, invalid_use_of_protected_member, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace, unused_import, unused_field

import 'dart:convert';
import 'dart:io';

import 'package:customer_assist/core/app_urls.dart';
import 'package:customer_assist/home/data/configure/datasources/configure_data_remote_data_source.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/sub_category_items.dart';
import 'package:customer_assist/home/presentation/controllers/chatty_controller.dart';
import 'package:customer_assist/home/presentation/controllers/city_controller.dart';
import 'package:customer_assist/home/presentation/controllers/configure_controller.dart';
import 'package:customer_assist/home/presentation/controllers/done_controller.dart';
import 'package:customer_assist/home/presentation/controllers/guest_fetchCountry_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/order_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pay_by_card_controller.dart';
import 'package:customer_assist/home/presentation/controllers/payment_review_controller.dart';
import 'package:customer_assist/home/presentation/controllers/pos_master_selection_controller.dart';
import 'package:customer_assist/home/presentation/controllers/shop_controller.dart';
import 'package:customer_assist/home/presentation/pages/Access_Add_ons.dart';
import 'package:customer_assist/home/presentation/pages/Access_Support.dart';
import 'package:customer_assist/home/presentation/pages/Access_client.dart';
import 'package:customer_assist/home/presentation/pages/Access_logout_client.dart';
import 'package:customer_assist/home/presentation/pages/Access_main.dart';
import 'package:customer_assist/home/presentation/pages/Access_shop.dart';
import 'package:customer_assist/home/presentation/pages/empty.dart';
import 'package:customer_assist/home/presentation/pages/welcome%20screen.dart';
import 'package:customer_assist/home/presentation/widgets/keyboard/alpha_small_letters.dart';
import 'package:customer_assist/home/presentation/widgets/market_place.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/Chatty.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/LanguageSelectionTab.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/User_delete.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/add_ons.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/calculator/calculator.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/calculator/currency_calc.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/change_delivery_address.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/change_password.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/country.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/delivery_mode.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/delivery_time_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/device_feedback_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/future_Coupons.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/jewellary_screen.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/message.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/mobile_widget.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/pay/Review_Order.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/pay/my_order_status.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/pay/old_order_review_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/pay/order_confirmation_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/pay/pay_mode.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/picker.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/product_item.dart';
//import 'package:customer_assist/home/presentation/widgets/stackwidgets/product_item_grocery.dart';
//import 'package:customer_assist/home/presentation/widgets/stackwidgets/product_item_.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/product_new_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/product_sub_categories.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/res_product_item.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/search_item.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/shopping_mode.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/shoppinglist.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/catelogue_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/free_flow_shopping.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/item_view.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/product_purchase_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/coupon.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/product_view_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/promotion_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/promotion_scratch_coupon.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/qr_code.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/shop_at_store_weigh.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/shop_outlet_page.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/shopselectioncondpage.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/sub_category_filter.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/timezone.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/tooltip/mobile_otp.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/vertical_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_constants.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';

import '../../../core/utils/udid_getter.dart';
import '../../../database/database.dart';
import '../../../features/data_download/download_assets/presentation/controllers/assets_download_controller.dart';
import '../controllers/add_cart_review_controller.dart';
import '../controllers/fetch_country_controller.dart';
import '../controllers/first_time_user_controller.dart';
import '../controllers/icon_controller.dart';
import '../controllers/keyboard_controller.dart';
import '../controllers/loading_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/owner_data_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/reset_controller.dart';
import '../controllers/splash_controller.dart';
import '../controllers/view_controller.dart';
import '../widgets/keyboard/numeral_special_char.dart';
import '../widgets/stackwidgets/add_tips_page.dart';
import '../widgets/stackwidgets/caution_page.dart';
import '../widgets/stackwidgets/edited_wishlist.dart';
import '../widgets/stackwidgets/expert_view.dart';
import '../widgets/stackwidgets/family_members.dart';
import '../widgets/stackwidgets/faq_view.dart';
import '../widgets/stackwidgets/information_widget.dart';
import '../widgets/stackwidgets/login_tab.dart';
import '../widgets/stackwidgets/mail_tab.dart';
import '../widgets/stackwidgets/old_order.dart';
import '../widgets/stackwidgets/owner_details.dart';
import '../widgets/stackwidgets/pay/by_cash_page.dart';
import '../widgets/stackwidgets/pay/loyalty_details.dart';
import '../widgets/stackwidgets/pay/review_page.dart';
import '../widgets/stackwidgets/pay/review_payment.dart';
import '../widgets/stackwidgets/pay/store_credits_page.dart';
import '../widgets/stackwidgets/pending_edit.dart';
import '../widgets/stackwidgets/pending_orders.dart';
import '../widgets/stackwidgets/profile_tab.dart';
import '../widgets/stackwidgets/reset_password.dart';
import '../widgets/stackwidgets/resources_view.dart';
import '../widgets/stackwidgets/review_rating_page.dart';
import '../widgets/stackwidgets/service_charge.dart';
import '../widgets/stackwidgets/set_password_tab.dart';
import '../widgets/stackwidgets/share_page.dart';
import '../widgets/stackwidgets/store/select_catagory_page.dart';
import '../widgets/stackwidgets/store/select_store_page.dart';
import '../widgets/stackwidgets/store/select_sub_catagory_page.dart';
import '../widgets/stackwidgets/store/shop_by_list.dart';
import '../widgets/stackwidgets/store/shop_details_page.dart';
import '../widgets/stackwidgets/store/shop_edit.dart';
import '../widgets/stackwidgets/store/shop_filter.dart';
import '../widgets/stackwidgets/store/shop_view_page.dart';
import '../widgets/stackwidgets/store/shopping_list_page.dart';
import '../widgets/stackwidgets/store/shopping_review_page.dart';
import '../widgets/stackwidgets/store/whishlist_page.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../controllers/header_controller.dart';
import '../controllers/menu_controller.dart';
import '../controllers/options_controller.dart';
import '../widgets/keyboard/alpha_capital_letters.dart';
import '../widgets/stackwidgets/otp_screen.dart';
import '../widgets/stackwidgets/sub_header.dart';
import '../widgets/stackwidgets/terms&condition_page.dart';
import '../widgets/stackwidgets/time_stamp.dart';

import 'Direct_Access_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    print("DRAWER OPENED...!");
    scaffoldKey.currentState?.openDrawer();
  }

  final PageController _controller = PageController(
    initialPage: 0,
  );
  final TextEditingController mailId = TextEditingController();
  final TextEditingController usermailID = TextEditingController();
  final TextEditingController firstmailId = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController salutaion = TextEditingController();

  final TextEditingController addressbookmobile1 = TextEditingController();
  final TextEditingController addressbookmobile2 = TextEditingController();
  final TextEditingController addressbookmobile3 = TextEditingController();
  final TextEditingController cashpaid = TextEditingController();
  final TextEditingController netweight = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastNAme = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController postalCode = TextEditingController();
  final TextEditingController province = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController add1 = TextEditingController();
  final TextEditingController add2 = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController locality = TextEditingController();
  final TextEditingController resetPass = TextEditingController();
  final TextEditingController oldpass = TextEditingController();
  final TextEditingController merchantID = TextEditingController();
  final TextEditingController storeID = TextEditingController();
  final TextEditingController zipcode = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController friendmobileController = TextEditingController();
  final TextEditingController friendnameController = TextEditingController();

  //final File? imageFile = File('');
  File? imageFile;
  bool permissionGranted = false;
  late Position position;
  List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());

  List<FocusNode> focusnode = List.generate(6, (index) => FocusNode());

  double actualHeight = 0;
  // var countryList = [];
  var name = 0;
  var pay = 0;
  var outlet = 0;
  var browseMethod = 0;
  var category = 0;
  var subcategory = 0;
  int amount = 0;
  String? mobileNum;

  var udid;
  var countryFlag;
  var reviewController = Get.put(PaymentReviewController());

  var assetsDownloadController = Get.put(AssetsDownloadController());
  var menuController = Get.put(MenuOptionController());
  var headerController = Get.put(HeaderController());
  var posMasterSelectionController = Get.put(PosMasterSelectionController());
  var viewController = Get.put(ViewController());
  var optionsController = Get.put(OptionsController());
  var eyeController = Get.put(EyeController());
  var keyboardController = Get.put(KeyboardController());
  var addressController = Get.put(AddressController());
  var loginController = Get.put(LoginController());
  var forggetController = Get.put(ResetController());
  var newUserController = Get.put(FirstTimeUserController());
  var doneController = Get.put(DoneController());
  var profileController = Get.put(ProfileController());
  var fetchCountryController = Get.put(FetchCountryController());
  var splashController = Get.put(SplashController());
  var configureController = Get.put(ConfigureController());
  var shopController = Get.put(ShopController());
  var addCartReviewController = Get.put(AddCartReviewController());
  var paymentReviewController = Get.put(PaymentReviewController());
  var payCardController = Get.put(PayByCardController());
  var orderController = Get.put(OrderController());
  var languageController = Get.put(LanguageController());
  var GuestCountryController = Get.put(GuestFetchCountryController());
  var CityController = Get.put(FetchCityController());
  final TextEditingController messageController = TextEditingController();
  var chattyController = Get.put(ChattyController());

  var guestCountry = 0;
  var guestCity = 0;
  var guestArea = 0;
  var zipCode = 0;
  var timezone = 0;

  var shopID = '';
  bool? validateCountry;

  final _isMain1AtLast = false;
  final _isMain2AtLast = false;
  final _isMain3AtLast = false;
  final _isGuestAtLast = false;
  final _isBrowseAtLast = false;
  final _isManagerAtLast = false;
  final _isSettingsAtLast = false;
  final _isShopAtStoreAtLast = false;
  final _isReviewListAtLast = false;
  final _isWishListAtLast = false;

  final _mainController1 = ScrollController();
  final _mainController2 = ScrollController();
  final _mainController3 = ScrollController();
  final _guestController = ScrollController();
  final _browseController = ScrollController();
  final _managerController = ScrollController();
  final _settingsController = ScrollController();
  final _shopAtStoreController = ScrollController();
  final _reviewController = ScrollController();
  final _wishController = ScrollController();

  Widget getImagenBase64(
      String imageBase64, double height, double width, BoxFit fit) {
    const Base64Codec base64 = Base64Codec();
    if (imageBase64 == "") return Container();
    Uint8List bytes = base64.decode(imageBase64);
    return Image.memory(
      bytes,
      height: height,
      width: width,
      fit: fit,
    );
  }

  @override
  void initState() {
    languageController.languageResponse.value;
    posMasterSelectionController.posMasterSelection();
    //print('fetch zipcode values...............');
    GuestCountryController.fetchzipcode('');
    //fetchData();

    print('flag------>');
    print('homeinitstate--->${posMasterSelectionController.countryCode.value}');
    //GuestCountryController.guestFetchCountryLogin();
    viewController.setView(COUNTRY);
    optionsController.setOptionList('');
    optionsController.getBottomsIcons();
    optionsController.getBottomsIcons2();
    optionsController.setSetState();
    optionsController.showImages();
    optionsController.showShadow();
    optionsController.setState();
    headerController.setSubHeaderLabel('Select Your Country');
    // viewController.setView(WELCOMEE);
    // headerController.setSubHeaderLabel('Retail Resonance');

    // optionsController.getBottomsIcons();
    // optionsController.setOptionList('');
    // optionsController.changeVerticalIcons(
    //     addressController
    //         .retailResponse[optionsController.vertical].base64Imageid
    //         .toString(),
    //     2);

    Prefs.superUserLoggedIn.then((value) {
      if (value) {
        shopController.downloadRestaurantProduct(
            languageController.languagenum.toString());
        // configureController.fetchCustomerDeliveryAddress(
        //     languageController.languagenum.toString());
      } else {}
    });

    GuestCountryController.fetchzipcode('600020');

    optionsController.optionIndexSetter(0);
    optionsController.getMainOptions();
    optionsController.setState();
    optionsController.showImages();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    actualHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    super.didChangeDependencies();
  }

  Future getLocation() async {
    position = await _getGeoLocationPosition();
    getAddressFromLatLong(position);
  }

//GET CURRENT LOCATION//

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    print(serviceEnabled);
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(languageController
              .languageResponse.value.locationServicesAreDisable ??
          '');
    } else {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openAppSettings();
        // added by bhava
        getLocation();
        // return Future.error(languageController
        //         .languageResponse.value.LocationPermissionsAreDenied ??
        //     '');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // added by bhava
      getLocation();
      viewController.setView(ERROR);
      viewController.setErrorMessage(languageController
              .languageResponse.value.theLocationServicesAreUsed ??
          '');
      //languageController.languageResponse.value.locationPermissionError ??
      // 'The location services are used in this application to detect your country details and display the sponsors in your country, show the stores nearby to you to choose the products you want to buy. This provides you important information and rich experience. We therefore strongly recommend you providing location permission to proceed with the application.');

      return Future.error(
          languageController.languageResponse.value.locationDeniedError ?? '');
    }

    if (await Prefs.mobile != '') {}

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

// GETCURRENT ADDRESS

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Prefs.setLatitude(13.001177);
    // Prefs.setLongitude(80.256493);
    Prefs.setLatitude(position.latitude);
    Prefs.setLongitude(position.longitude);
    print("***************************************${position.latitude}");
    print("***************************************${position.longitude}");
    print(placemarks);
    Placemark place = placemarks[0];
    Prefs.setCountry(place.country!);
    Prefs.setTempCountry(place.country!);
    Prefs.setPostalCode(place.postalCode!);
    print(place.postalCode);
    fetchCountryController.fetchCountryLogin(
        place.country!, languageController.languagenum.toString());
    udid = await getUDIDofDevice();

    splashController.fetchSplashData(place.country!, DateTime.now().toString(),
        udid, languageController.languagenum.toString());
  }

  getUDIDofDevice() async {
    String udid = "";
    try {
      udid = await FlutterUdid.udid;
      Prefs.setUdid(udid);
      return udid;
    } on PlatformException {
      udid = 'Failed to get UDID.';
      print(udid);
      return UDIDError(udid);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget getHeaderLogo(String iconName) => FutureBuilder<String>(
        future: getSingleImage(iconName),
        builder: (builder, imageSnapShot) {
          if (imageSnapShot.hasData) {
            return Image.memory(
              base64Decode(imageSnapShot.data!),
              fit: BoxFit.fill,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return layoutWithoutHomeButton(context);
  }

  Scaffold layoutWithoutHomeButton(BuildContext context) {
    // addressController.fetchVertical();

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: GetPlatform.isAndroid
                    ? (actualHeight - 40)
                    : actualHeight - MediaQuery.of(context).padding.bottom,
                child: Column(
                  children: [
                    /*  Column(
                      children: [
                        viewController.viewKey.value == WELCOMEE
                            ? Container(
                                height: 1,
                                width: double.infinity,
                                color: Colors.black,
                              )
                            : Container(
                                height: 50,
                                width: 480,
                                // margin: const EdgeInsets.only(right: 2),
                                // height: MediaQuery.of(context).size.height *
                                //     0.043,
                                // width: MediaQuery.of(context).size.width *
                                //     0.99,
                                color: const Color.fromARGB(255, 210, 207, 207),
                                child: const Center(child: SubHeader()
                                ),
                              ),
                      ],
                    ),
                    */
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    // SizedBox(
                    //   height: GetPlatform.isAndroid
                    //       ? (actualHeight / 16.5) * 1 - 13
                    //       : (actualHeight / 16.5) * 1 - 14,
                    //   width: double.infinity,
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //         children: [
                    //           // (viewController.viewKey.value == STATICPAGE ||
                    //           //         viewController.viewKey.value == SPLASH ||
                    //           //         viewController.viewKey.value ==
                    //           //             MOBILENUMBER ||
                    //           //         viewController.viewKey.value == MOBILEOTP ||
                    //           //         viewController.viewKey.value == OWNERDETAILS)
                    //           //     ? const SizedBox(
                    //           //         width: 70,
                    //           //         height: 45,
                    //           //       )
                    //           //     :
                    //           GetX<MenuOptionController>(
                    //             init: MenuOptionController(),
                    //             initState: (_) {},
                    //             builder: (controller) {
                    //               print(viewController.viewKey.value);
                    //               print('Arrow back header');
                    //               return InkWell(
                    //                   onTap: () {
                    //                     print('arrow back');

                    //                     viewController.setArrowView(
                    //                         optionsController,
                    //                         headerController);
                    //                   },
                    //                   child: (viewController.viewKey.value ==
                    //                               STATICPAGE ||
                    //                           keyboardController
                    //                                   .pickerValue.value ==
                    //                               'Country' ||
                    //                           viewController.viewKey.value ==
                    //                               DIRECTICONACCESS)
                    //                       ? Container(
                    //                           //added by saha
                    //                           margin: const EdgeInsets.only(
                    //                               left: 1),
                    //                           height: GetPlatform.isAndroid
                    //                               ? MediaQuery.of(context)
                    //                                       .size
                    //                                       .height *
                    //                                   0.043
                    //                               : MediaQuery.of(context)
                    //                                       .size
                    //                                       .height *
                    //                                   0.043,
                    //                           width: GetPlatform.isAndroid
                    //                               ? MediaQuery.of(context)
                    //                                       .size
                    //                                       .width *
                    //                                   0.13
                    //                               : MediaQuery.of(context)
                    //                                       .size
                    //                                       .width *
                    //                                   0.16,
                    //                           // width: 45,
                    //                           // height: 45,
                    //                         )
                    //                       : Container(
                    //                           //color: Colors.red,
                    //                           //added by saha
                    //                           margin: const EdgeInsets.only(
                    //                               left: 1),
                    //                           height: GetPlatform.isAndroid
                    //                               ? MediaQuery.of(context)
                    //                                       .size
                    //                                       .height *
                    //                                   0.043
                    //                               : MediaQuery.of(context)
                    //                                       .size
                    //                                       .height *
                    //                                   0.043,
                    //                           width:
                    //                               GetPlatform.isAndroid
                    //                                   ? MediaQuery.of(context)
                    //                                           .size
                    //                                           .width *
                    //                                       0.13
                    //                                   : MediaQuery.of(context)
                    //                                           .size
                    //                                           .width *
                    //                                       0.16,
                    //                           child: optionsController.backnew)
                    //                   //   (controller.isActive.value
                    //                   // ? SizedBox(
                    //                   //     width: 70,
                    //                   //      height: 50,
                    //                   //     child: optionsController
                    //                   //         .menuBack)
                    //                   // :
                    //                   );
                    //             },
                    //           ),
                    //           //added by saha
                    //           SizedBox(
                    //               width: GetPlatform.isAndroid
                    //                   ? 20
                    //                   : MediaQuery.of(context).size.width *
                    //                       0.01),

                    //           Container(
                    //               margin: const EdgeInsets.only(right: 2),
                    //               height: GetPlatform.isAndroid
                    //                   ? MediaQuery.of(context).size.height *
                    //                       0.043
                    //                   : MediaQuery.of(context).size.height *
                    //                       0.043,
                    //               width: GetPlatform.isAndroid
                    //                   ? MediaQuery.of(context).size.width *
                    //                       0.5925
                    //                   : MediaQuery.of(context).size.width *
                    //                       0.5925,
                    //               color: AppColors.subHeaderContainer,
                    //               child: const Center(child: SubHeader())),

                    //           GetX<HeaderController>(
                    //               init: HeaderController(),
                    //               initState: (_) {},
                    //               builder: (control) {
                    //                 if (viewController.viewKey.value ==
                    //                             CLIENTPROFILE ||
                    //                         viewController.viewKey.value ==
                    //                             ADDADDRESS ||
                    //                         viewController.viewKey.value ==
                    //                             EDITADDRESS

                    //                     //     ||
                    //                     // viewController.viewKey.value ==
                    //                     //     CHANGEDELIVERYADDRESS
                    //                     // viewController.viewKey.value == WHISHLIST ||
                    //                     // viewController.viewKey.value ==
                    //                     //     PROMOTIONS
                    //                     ) {
                    //                   if (keyboardController
                    //                           .editProfile.value ==
                    //                       true) {
                    //                     return InkWell(
                    //                       onTap: () async {
                    //                         //optionsController.optionIndexSetter(2);
                    //                         if (viewController.viewKey.value ==
                    //                             CLIENTPROFILE) {
                    //                           profileController.profileUpdate(
                    //                               salutaion.text,
                    //                               country.text,
                    //                               dob.text,
                    //                               city.text,
                    //                               lastNAme.text,
                    //                               mailId.text,
                    //                               firstName.text,
                    //                               province.text,
                    //                               mobile.text,
                    //                               add1.text,
                    //                               add2.text,
                    //                               postalCode.text,
                    //                               mailId.text,
                    //                               languageController.languagenum
                    //                                   .toString());
                    //                         } else if (viewController
                    //                                 .viewKey.value ==
                    //                             ADDADDRESS) {
                    //                           if (firstName.text.isEmpty ||
                    //                                   lastNAme.text.isEmpty ||
                    //                                   add1.text.isEmpty
                    //                               // ||
                    //                               // province.text.isEmpty ||
                    //                               // city.text.isEmpty
                    //                               // ||
                    //                               // mobile.text.isEmpty
                    //                               ) {
                    //                             viewController.setView(INFO);
                    //                             viewController.setInfoMessage(
                    //                                 'Enter the furthur details');
                    //                           } else {
                    //                             configureController
                    //                                 .updateCustomerDeliveryAddress(
                    //                                     salutaion.text,
                    //                                     '0',
                    //                                     'A',
                    //                                     firstName.text,
                    //                                     lastNAme.text,
                    //                                     add1.text,
                    //                                     add2.text,
                    //                                     country.text,
                    //                                     GuestCountryController
                    //                                         .zipcodeResponse
                    //                                         .value
                    //                                         .status!
                    //                                         .aRea
                    //                                         .toString(),
                    //                                     GuestCountryController
                    //                                         .zipcodeResponse
                    //                                         .value
                    //                                         .status!
                    //                                         .pROVIENCE
                    //                                         .toString(),
                    //                                     GuestCountryController
                    //                                         .zipcodeResponse
                    //                                         .value
                    //                                         .status!
                    //                                         .cITY
                    //                                         .toString(),
                    //                                     '1',
                    //                                     mobile.text,
                    //                                     addressbookmobile2.text,
                    //                                     addressbookmobile3.text,
                    //                                     viewController
                    //                                         .addressbookselectedbuildingtype,
                    //                                     postalCode.text,
                    //                                     languageController
                    //                                         .languagenum
                    //                                         .toString());
                    //                             viewController
                    //                                 .isdelivaryaddress = true;
                    //                             viewController.setView(SUCCESS);
                    //                             viewController
                    //                                 .setSuccessMessage(
                    //                                     'Successfully Updated');
                    //                           }
                    //                         } else if (viewController
                    //                                 .viewKey.value ==
                    //                             EDITADDRESS) {
                    //                           configureController.updateCustomerDeliveryAddress(
                    //                               salutaion.text,
                    //                               configureController
                    //                                   .deliveryAddress[
                    //                                       viewController
                    //                                           .addressbookselectedindex]
                    //                                   .customerAddressId!,
                    //                               'E',
                    //                               firstName.text,
                    //                               lastNAme.text,
                    //                               add1.text,
                    //                               add2.text,
                    //                               country.text,
                    //                               GuestCountryController
                    //                                   .zipcodeResponse
                    //                                   .value
                    //                                   .status!
                    //                                   .aRea
                    //                                   .toString(),
                    //                               GuestCountryController
                    //                                   .zipcodeResponse
                    //                                   .value
                    //                                   .status!
                    //                                   .pROVIENCE
                    //                                   .toString(),
                    //                               GuestCountryController
                    //                                   .zipcodeResponse
                    //                                   .value
                    //                                   .status!
                    //                                   .cITY
                    //                                   .toString(),
                    //                               '1',
                    //                               mobile.text,
                    //                               addressbookmobile2.text,
                    //                               addressbookmobile3.text,
                    //                               viewController
                    //                                   .addressbookselectedbuildingtype,
                    //                               postalCode.text,
                    //                               languageController.languagenum
                    //                                   .toString());
                    //                           configureController
                    //                               .fetchCustomerDeliveryAddress(
                    //                                   languageController
                    //                                       .languagenum
                    //                                       .toString());
                    //                         }
                    //                         // else if (viewController
                    //                         //         .viewKey.value ==
                    //                         //     PROMOTIONS) {
                    //                         //   shopController
                    //                         //       .fetchCompanyCustomerOffer(
                    //                         //           shopController.promoList,
                    //                         //           languageController.languagenum
                    //                         //               .toString());
                    //                         // }
                    //                         else if (viewController
                    //                                 .viewKey.value ==
                    //                             WHISHLIST)

                    //                         //       &&viewController
                    //                         //         .userSuboption.value ==
                    //                         //     SHOPPINGLIST
                    //                         {
                    //                           shopController
                    //                               .fetchShoppingOutlets(
                    //                                   shopController
                    //                                       .shoppingOutlets,
                    //                                   languageController
                    //                                       .languagenum
                    //                                       .toString());
                    //                         } else if (viewController
                    //                                 .viewKey.value ==
                    //                             SHOPOUTLETPAGE) {
                    //                         } else if (viewController
                    //                                 .viewKey.value ==
                    //                             SHOPATSTOREWEIGH) {
                    //                           viewController
                    //                               .setView(FREEFLOWSHOPPING);
                    //                           // headerController
                    //                           //     .setSubHeaderLabel(
                    //                           //       'Weigh Product'
                    //                           //         //SHOPATSTOREWEIGH
                    //                           //         );
                    //                           optionsController
                    //                               .optionIndexSetter(2);
                    //                           optionsController.setSetState();
                    //                         }
                    //                       },
                    //                       child: Container(
                    //                         margin:
                    //                             const EdgeInsets.only(left: 5),
                    //                         height: MediaQuery.of(context)
                    //                                 .size
                    //                                 .height *
                    //                             0.043,
                    //                         width: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             0.16,
                    //                         child: optionsController.save,
                    //                       ),
                    //                     );
                    //                   }
                    //                   // else if (keyboardController
                    //                   //         .addProfile.value ==
                    //                   //     true) {
                    //                   //   return InkWell(
                    //                   //     onTap: () {
                    //                   //       print("ADDADDRESS Increase");
                    //                   //       viewController.setView(ADDADDRESS);
                    //                   //       headerController.setSubHeaderLabel(
                    //                   //           languageController
                    //                   //                   .languageResponse
                    //                   //                   .value
                    //                   //                   .addDeliveryAddress ??
                    //                   //               '');
                    //                   //       keyboardController.setEdit(true);
                    //                   //     },
                    //                   //     child: Container(
                    //                   //       margin:
                    //                   //           const EdgeInsets.only(left: 5),
                    //                   //       height: MediaQuery.of(context)
                    //                   //               .size
                    //                   //               .height *
                    //                   //           0.043,
                    //                   //       width: MediaQuery.of(context)
                    //                   //               .size
                    //                   //               .width *
                    //                   //           0.16,
                    //                   //       child: optionsController.increase,
                    //                   //     ),
                    //                   //   );
                    //                   // }
                    //                   else {
                    //                     return InkWell(
                    //                       onLongPress: () {
                    //                         if (viewController.viewKey.value ==
                    //                             CHANGEDELIVERYADDRESS) {
                    //                           print('Long Press!!!');
                    //                           keyboardController.setAdd(true);
                    //                         }
                    //                       },
                    //                       onTap: () {
                    //                         if (viewController.viewKey.value ==
                    //                             CHANGEDELIVERYADDRESS) {
                    //                           viewController
                    //                               .setView(EDITADDRESS);
                    //                         }
                    //                         keyboardController.setEdit(true);
                    //                       },
                    //                       child: Container(
                    //                         margin:
                    //                             const EdgeInsets.only(left: 5),
                    //                         height: MediaQuery.of(context)
                    //                                 .size
                    //                                 .height *
                    //                             0.043,
                    //                         width: MediaQuery.of(context)
                    //                                 .size
                    //                                 .width *
                    //                             0.16,
                    //                         child: optionsController.edit,
                    //                       ),
                    //                     );
                    //                   }
                    //                 } else if (viewController.viewKey.value ==
                    //                             SHOPOUTLETPAGE ||
                    //                         viewController.viewKey.value ==
                    //                             SHOPBYLIST ||
                    //                         viewController.viewKey.value ==
                    //                             SHOPATSTORE
                    //                     //     ||
                    //                     // viewController.viewKey.value ==
                    //                     //     SHOPATSTOREWEIGH
                    //                     ) {
                    //                   return InkWell(
                    //                     onTap: (() {
                    //                       print('onTap');
                    //                       // setState(() {
                    //                       if (viewController.viewKey.value ==
                    //                           SHOPOUTLETPAGE) {
                    //                         for (var element in shopController
                    //                             .shoppingOutletResponse
                    //                             .value[0]
                    //                             .items!) {
                    //                           var itemValues = SubCategoryItems(
                    //                               productCode:
                    //                                   element.productCode,
                    //                               productMrp:
                    //                                   element.productMrp,
                    //                               productName:
                    //                                   element.productName,
                    //                               productRate:
                    //                                   element.productRate,
                    //                               tax1: element.tax1,
                    //                               tax2: element.tax2,
                    //                               tax3: element.tax3,
                    //                               tax4: element.tax4,
                    //                               tax5: element.tax5,
                    //                               tax6: element.tax6,
                    //                               imageUrl: element.imageUrl,
                    //                               discountValue:
                    //                                   element.discountValue);
                    //                           addCartReviewController
                    //                               .addToCartReview(itemValues);
                    //                         }
                    //                       }

                    //                       shopController.setReviewPage(true);
                    //                       // reviewPage = true;
                    //                       // });
                    //                       if (shopController.reviewPage.value) {
                    //                         viewController.setView(REVIEWPAGE);
                    //                       }
                    //                     }),
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.only(
                    //                           top: 5.0, bottom: 5.0, left: 1),
                    //                       child: Stack(
                    //                         children: [
                    //                           Container(
                    //                             width: 80,
                    //                             decoration:
                    //                                 BoxDecoration(boxShadow: [
                    //                               BoxShadow(
                    //                                   color: shopController
                    //                                           .reviewPage.value
                    //                                       ? Colors.grey
                    //                                       : Colors.white,
                    //                                   spreadRadius: 1,
                    //                                   blurRadius: 1,
                    //                                   offset:
                    //                                       const Offset(4, 4))
                    //                             ]),
                    //                             height: GetPlatform.isAndroid
                    //                                 ? (actualHeight - 40) / 18.1
                    //                                 : (actualHeight -
                    //                                         MediaQuery.of(
                    //                                                 context)
                    //                                             .padding
                    //                                             .bottom) /
                    //                                     17.9,
                    //                             child: optionsController.cart,
                    //                           ),
                    //                           Positioned(
                    //                             top: 10,
                    //                             left: 42,
                    //                             child: Text(
                    //                               addCartReviewController
                    //                                   .tableValue.value
                    //                                   .toString()
                    //                                   .padLeft(3,
                    //                                       '0'), //added by saha
                    //                               style: const TextStyle(
                    //                                   fontSize: 16,
                    //                                   color: Colors.black,
                    //                                   fontWeight:
                    //                                       FontWeight.normal),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   );
                    //                 } else if (viewController.viewKey.value ==
                    //                     PROMOTIONS) {
                    //                   return InkWell(
                    //                     onTap: () {
                    //                       shopController
                    //                           .fetchCompanyCustomerOffer(
                    //                               shopController.promoList,
                    //                               languageController.languagenum
                    //                                   .toString());

                    //                       print('onTap');
                    //                     },
                    //                     child: Container(
                    //                       margin:
                    //                           const EdgeInsets.only(left: 5),
                    //                       height: MediaQuery.of(context)
                    //                               .size
                    //                               .height *
                    //                           0.043,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.16,
                    //                       child: optionsController.save,
                    //                     ),
                    //                   );
                    //                 } else if (viewController.viewKey.value ==
                    //                     OWNERDETAILS) {
                    //                   return InkWell(
                    //                     onTap: () async {
                    //                       Prefs.setUserCity(
                    //                         GuestCountryController
                    //                             .zipcodeResponse
                    //                             .value
                    //                             .status!
                    //                             .cITY
                    //                             .toString(),
                    //                       );

                    //                       Prefs.setUserState(
                    //                         GuestCountryController
                    //                             .zipcodeResponse
                    //                             .value
                    //                             .status!
                    //                             .pROVIENCE
                    //                             .toString(),
                    //                       );
                    //                       addressController.updateAddress(
                    //                           await Prefs.mobile,
                    //                           firstName.text,
                    //                           lastNAme.text,
                    //                           area.text,
                    //                           mobile.text,
                    //                           add1.text,
                    //                           add2.text,
                    //                           '1',
                    //                           'y',
                    //                           GuestCountryController
                    //                               .zipcodeResponse
                    //                               .value
                    //                               .status!
                    //                               .aRea
                    //                               .toString(),
                    //                           // locality.text,
                    //                           // await Prefs.postalCode,
                    //                           postalCode.text,
                    //                           GuestCountryController
                    //                               .zipcodeResponse
                    //                               .value
                    //                               .status!
                    //                               .pROVIENCE
                    //                               .toString(),
                    //                           GuestCountryController
                    //                               .zipcodeResponse
                    //                               .value
                    //                               .status!
                    //                               .cITY
                    //                               .toString(),
                    //                           // await Prefs.userState,
                    //                           // await Prefs.superUserCity,
                    //                           country.text,
                    //                           languageController.languagenum
                    //                               .toString());

                    //                       print(locality.text);
                    //                       viewController.setView(FIRSTTIME);
                    //                       headerController.setSubHeaderLabel(
                    //                           //languageController.languageResponse.value.provideMailId ??
                    //                           'Set Up Mail Id');
                    //                       optionsController
                    //                           .optionIndexSetter(3);
                    //                       optionsController.setSetState();
                    //                       print('onTap');
                    //                     },
                    //                     child: Container(
                    //                       margin:
                    //                           const EdgeInsets.only(left: 5),
                    //                       height: MediaQuery.of(context)
                    //                               .size
                    //                               .height *
                    //                           0.043,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.16,
                    //                       child: optionsController.save,
                    //                     ),
                    //                   );
                    //                 } else if (
                    //                     // viewController.viewKey.value ==
                    //                     //       ADDADDRESS ||
                    //                     viewController.viewKey.value == MODE ||
                    //                         viewController.viewKey.value ==
                    //                             DELMODE) {
                    //                   return InkWell(
                    //                     onTap: () {
                    //                       if (viewController.viewKey.value ==
                    //                               MODE ||
                    //                           viewController.viewKey.value ==
                    //                               DELMODE) {
                    //                         configureController.fetchDetails(
                    //                             languageController.languagenum
                    //                                 .toString());
                    //                         checkCountry();

                    //                         optionsController.setSetState();

                    //                         optionsController
                    //                             .setOptionList(CONFIGURE);
                    //                       }
                    //                     },
                    //                     child: Container(
                    //                       margin:
                    //                           const EdgeInsets.only(left: 5),
                    //                       height: MediaQuery.of(context)
                    //                               .size
                    //                               .height *
                    //                           0.043,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.16,
                    //                       child: optionsController.save,
                    //                     ),
                    //                   );
                    //                 } else if (viewController.viewKey.value ==
                    //                     CATALOG) {
                    //                   return InkWell(
                    //                     onTap: () {
                    //                       viewController.setView(ITEMVIEWPAGE);
                    //                       optionsController
                    //                           .optionIndexSetter(3);

                    //                       // print('onTap');
                    //                     },
                    //                     child: Container(
                    //                       margin:
                    //                           const EdgeInsets.only(left: 5),
                    //                       height: MediaQuery.of(context)
                    //                               .size
                    //                               .height *
                    //                           0.043,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.16,
                    //                       child: optionsController.send,
                    //                     ),
                    //                   );
                    //                 }
                    //                 // else{
                    //                 //   return Container();
                    //                 // }

                    //                 else {
                    //                   if (optionsController.optionsKey.value ==
                    //                       BROWSE) {
                    //                     return GestureDetector(
                    //                         onTap: () {
                    //                           viewController.setPreviousView();
                    //                           print('arrow back');
                    //                         },
                    //                         child: (viewController
                    //                                         .viewKey.value ==
                    //                                     STATICPAGE ||
                    //                                 viewController
                    //                                         .viewKey.value ==
                    //                                     SPLASH ||
                    //                                 viewController
                    //                                         .viewKey.value ==
                    //                                     MOBILENUMBER ||
                    //                                 viewController
                    //                                         .viewKey.value ==
                    //                                     MOBILEOTP ||
                    //                                 viewController
                    //                                         .viewKey.value ==
                    //                                     OWNERDETAILS)
                    //                             ? Container(
                    //                                 margin:
                    //                                     const EdgeInsets.only(
                    //                                         left: 5),
                    //                                 height:
                    //                                     MediaQuery.of(context)
                    //                                             .size
                    //                                             .height *
                    //                                         0.043,
                    //                                 width:
                    //                                     MediaQuery.of(context)
                    //                                             .size
                    //                                             .width *
                    //                                         0.16,
                    //                               )
                    //                             : (menuController.isActive.value
                    //                                 ? SizedBox(
                    //                                     width: 70,
                    //                                      height: 50,
                    //                                     child: optionsController
                    //                                         .menuBack)
                    //                                 : Container(
                    //                                     margin: const EdgeInsets
                    //                                         .only(left: 5),
                    //                                     height: MediaQuery.of(
                    //                                                 context)
                    //                                             .size
                    //                                             .height *
                    //                                         0.043,
                    //                                     width: MediaQuery.of(
                    //                                                 context)
                    //                                             .size
                    //                                             .width *
                    //                                         0.16,
                    //                                     // child: optionsController
                    //                                     //     .filterIcon
                    //                                   )));
                    //                   } else {
                    //                     return Container(
                    //                       margin:
                    //                           const EdgeInsets.only(left: 5),
                    //                       height: MediaQuery.of(context)
                    //                               .size
                    //                               .height *
                    //                           0.043,
                    //                       width: MediaQuery.of(context)
                    //                               .size
                    //                               .width *
                    //                           0.16,
                    //                     );
                    //                   }
                    //                 }
                    //               }),
                    //           // InkWell(
                    //           //   onTap: (() {}),
                    //           //   child: SizedBox(
                    //           //     width: 15,
                    //           //     height: 15,
                    //           //     child: getImagenBase64(
                    //           //         'Filter', 15, 15, BoxFit.fill),
                    //           //   ),
                    //           // )
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //  (viewController.viewKey.value == SEARCHITEM ||
                    //         viewController.viewKey.value == ITEMVIEWPAGE ||
                    //         viewController.viewKey.value == PRODUCTNEWPAGE ||
                    //         viewController.viewKey.value ==
                    //             PRODUCTSUBCATEGORY ||
                    //         viewController.viewKey.value ==
                    //             SELECTCATAGORYPAGE ||
                    //         viewController.viewKey.value == CATALOG ||
                    //         viewController.viewKey.value == PRODUCT ||
                    //         viewController.viewKey.value == REVIEWPAGE ||
                    //         viewController.viewKey.value == ADDTIP ||
                    //         viewController.viewKey.value == REVIEWPAYMENT ||
                    //         viewController.viewKey.value == OLDORDERS ||
                    //         viewController.viewKey.value == MYORDERSTATUS ||
                    //         viewController.viewKey.value == MYORDERITEMS ||
                    //         viewController.viewKey.value == LISTSHOPPING ||
                    //         viewController.viewKey.value == SHOPEDIT ||
                    //         viewController.viewKey.value == WISHITEMS ||
                    //         viewController.viewKey.value == WISHLISTEDIT ||
                    //         viewController.viewKey.value == SHOPLIST ||
                    //         viewController.viewKey.value == DIRECTICONACCESS)
                    //     ? SizedBox(
                    //         height: MediaQuery.of(context).size.height * 0.005)
                    //     : SizedBox(
                    //         height: MediaQuery.of(context).size.height * 0.005),
                    // (viewController.viewKey.value == SEARCHITEM ||
                    //         viewController.viewKey.value == ITEMVIEWPAGE ||
                    //         viewController.viewKey.value == PRODUCTNEWPAGE ||
                    //         viewController.viewKey.value ==
                    //             PRODUCTSUBCATEGORY ||
                    //         viewController.viewKey.value ==
                    //             SELECTCATAGORYPAGE ||
                    //         viewController.viewKey.value == CATALOG ||
                    //         viewController.viewKey.value == PRODUCT ||
                    //         viewController.viewKey.value == REVIEWPAGE ||
                    //         viewController.viewKey.value == ADDTIP ||
                    //         viewController.viewKey.value == REVIEWPAYMENT ||
                    //         viewController.viewKey.value == OLDORDERS ||
                    //         viewController.viewKey.value == MYORDERSTATUS ||
                    //         viewController.viewKey.value == MYORDERITEMS ||
                    //         viewController.viewKey.value == LISTSHOPPING ||
                    //         viewController.viewKey.value == SHOPEDIT ||
                    //         viewController.viewKey.value == WISHITEMS ||
                    //         viewController.viewKey.value == WISHLISTEDIT ||
                    //         viewController.viewKey.value == SHOPLIST ||
                    //         viewController.viewKey.value == DIRECTICONACCESS)
                    //     ? Container(
                    //         //height: 1,
                    //         width: double.infinity,
                    //         color: const Color.fromARGB(255, 251, 250, 250))
                    //     : Container(
                    //         height: 1,
                    //         width: double.infinity,
                    //         color: const Color.fromARGB(255, 221, 216, 216),
                    //       ),
                    Expanded(
                      child: Stack(
                        children: [
                          GetX<ViewController>(
                            init: ViewController(),
                            initState: (_) {},
                            builder: (controller) {
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  GetX<LoadingController>(
                                    init: LoadingController(),
                                    initState: (_) {},
                                    builder: (loadingController) {
                                      if (loadingController.isLoading) {
                                        return const SizedBox(
                                          height: 700,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.headerContainer,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),

                                  // viewController.viewKey.value ==
                                  //             OWNERDETAILS ||
                                  // controller.viewKey.value == CLIENTPROFILE ||
                                  // controller.viewKey.value ==
                                  //     ADDADDRESS ||
                                  // controller.viewKey.value ==
                                  //     EDITADDRESS ||

                                  // controller.viewKey.value ==
                                  //     PROMOTIONS ||
                                  // controller.viewKey.value ==
                                  //     CHANGEDELIVERYADDRESS ||
                                  //controller.viewKey.value == ADDTIP ||
                                  controller.viewKey.value == REVIEWPAYMENT

                                  
                                      ? Column(
                                          children: List.generate(
                                            10,
                                            (index) => Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.grey[800]!,
                                                    width: 0.3,
                                                  ),
                                                ),
                                              ),
                                              height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
                                            ),
                                          ),
                                        )
                                      : controller.viewKey.value =='Shopselectioncond'
                                      ? Column(
                                          children: List.generate(
                                            15,
                                            (index) => Container(
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Colors.grey[800]!,
                                                    width: 0.3,
                                                  ),
                                                ),
                                              ),
                                              height: GetPlatform.isAndroid
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.050
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.055,
                                            ),
                                          ),
                                        )
                                     : Container(),
                                  GetX<KeyboardController>(
                                    init: KeyboardController(),
                                    initState: (_) {},
                                    builder: (controller) {
                                      return Positioned(
                                          bottom: 0,
                                          child: Container(
                                            height: 310,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/keypad_patchs/keypad_base.png'),
                                                  fit: BoxFit.fill),
                                            ),
                                            child: keyboardWidget(
                                                context, controller),
                                          ));
                                    },
                                  ),
                                  GetX<KeyboardController>(
                                    init: KeyboardController(),
                                    initState: (_) {},
                                    builder: (controller) {
                                      if (viewController.viewKey.value ==
                                          CLIENTPROFILE) {
                                        return Container();
                                      } else if (controller.pickerValue.value !=
                                              '' &&
                                          controller.pickerValue.value !=
                                              'FIRSTLOAD') {
                                        return Positioned(
                                          //top:450,
                                          bottom: 0,
                                          child: Container(
                                            height: 352,
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 0.5),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/keypad_patchs/keypad_base.png'),
                                                  fit: BoxFit.fill),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 3.0),
                                                  child: Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: AssetImage(
                                                                'assets/images/keypad_patchs/keypad_header.png'))),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            keyboardController
                                                                .setKeypad('');
                                                            keyboardController
                                                                .setPicker('');
                                                          },
                                                          child: Text(
                                                            'CANCEL',
                                                            style: GoogleFonts
                                                                .openSans(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Country") {
                                                              //headerController.setHeaderLabel('');
                                                              // print(
                                                              //   '>>--->${GuestCountryController.guestfetchcountryResponse[guestCountry].countryName!}',
                                                              // );

                                                              fetchCountryController.fetchCountryLogin(
                                                                  GuestCountryController
                                                                      .guestfetchcountryResponse[
                                                                          guestCountry]
                                                                      .COUNTRY_NAME!,
                                                                  languageController
                                                                      .languagenum
                                                                      .toString());
                                                              //Prefs.setGuestCountry(root!.status!.country[guestCountry].cOUNTRY_NAME!,);
                                                              Prefs.setGuestCountry(GuestCountryController
                                                                  .guestfetchcountryResponse[
                                                                      guestCountry]
                                                                  .COUNTRY_NAME
                                                                  .toString());

                                                              if (GuestCountryController
                                                                      .guestfetchcountryResponse[
                                                                          guestCountry]
                                                                      .COUNTRY_CODE! ==
                                                                  '02') {
                                                                optionsController
                                                                    .changeVerticalRestaurent1(
                                                                        '401',
                                                                        0);
                                                              }

                                                              print(
                                                                  'Countrypicker${await Prefs.guestcountry}');
                                                              optionsController
                                                                  .setSetState();

                                                              keyboardController
                                                                  .setPicker(
                                                                      'TimeZone');
                                                              headerController
                                                                  .setSubHeaderLabel(
                                                                      'Select Time Zone');
                                                              viewController
                                                                  .setView(
                                                                      INFO);
                                                              viewController
                                                                  .setInfoMessage(
                                                                      'You have selected ${await Prefs.guestcountry} as the country, You may now select the time zone appropriate to the country selected. When the required time zone comes into view window tap DONE to select the required time zone');
                                                              //  viewController.setInfoMessage('You have selected India as the country, You may now select the time zone appropriate to the country selected. When the required time zone comes into view window tap DONE to select the required time zone');
                                                              optionsController
                                                                  .optionIndexSetter(
                                                                      1);
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "TimeZone") {
                                                              optionsController
                                                                  .setSetState();
                                                              storeValue();
                                                              getValue();

                                                              headerController
                                                                  .setTimeChange();
                                                              keyboardController
                                                                  .setPicker(
                                                                      'RetailVertical');
                                                              headerController
                                                                  .setSubHeaderLabel(
                                                                      'Pick Retail Vertical');
                                                              optionsController
                                                                  .optionIndexSetter(
                                                                      2);
                                                              viewController
                                                                  .setView(
                                                                      INFO);
                                                              viewController
                                                                  .setInfoMessage(
                                                                      //'The current Retail Vertical is “GROCERY”. If you want to change it you may do so through the Retail Vertical Picker. If you do not wish to change you may skip it by tapping DONE');
                                                                      languageController
                                                                              .languageResponse
                                                                              .value
                                                                              .theCurrentRetailVertical ??
                                                                          '');
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                'RetailVertical') {
                                                              print(addressController
                                                                  .retailResponse[
                                                                      optionsController
                                                                          .vertical]
                                                                  .id);
                                                              // change the vertical icons
                                                              if (optionsController
                                                                      .optionsKey
                                                                      .value !=
                                                                  GUEST) {
                                                                if (addressController
                                                                        .retailResponse[optionsController
                                                                            .vertical]
                                                                        .base64Imageid ==
                                                                    83) {
                                                                  optionsController
                                                                      .changeVerticalRestaurentClient(
                                                                          '322',
                                                                          2);
                                                                } else if (addressController
                                                                        .retailResponse[optionsController
                                                                            .vertical]
                                                                        .base64Imageid ==
                                                                    27) {
                                                                  optionsController
                                                                      .changeVerticalRestaurentClient(
                                                                          '41',
                                                                          2);
                                                                } else if (addressController
                                                                        .retailResponse[
                                                                            optionsController.vertical]
                                                                        .base64Imageid ==
                                                                    29) {
                                                                  optionsController
                                                                      .changeVerticalRestaurentClient(
                                                                          '41',
                                                                          2);
                                                                }
                                                              } else {
                                                                // optionsController
                                                                //     .optionIndexSetter(
                                                                //         2);
                                                                if (addressController
                                                                        .retailResponse[optionsController
                                                                            .vertical]
                                                                        .base64Imageid ==
                                                                    83) {
                                                                  optionsController
                                                                      .changeVerticalRestaurent(
                                                                          '322',
                                                                          4);
                                                                  optionsController
                                                                      .changeVerticalRestaurent(
                                                                          '321',
                                                                          6);
                                                                } else if (addressController
                                                                            .retailResponse[optionsController
                                                                                .vertical]
                                                                            .base64Imageid ==
                                                                        27 &&
                                                                    // added by sahana
                                                                    addressController
                                                                            .retailResponse[optionsController.vertical]
                                                                            .val ==
                                                                        'Grocery') {
                                                                  optionsController
                                                                      .changeVerticalRestaurent(
                                                                          '27',
                                                                          1);
                                                                  optionsController
                                                                      .changeVerticalRestaurent(
                                                                          '41',
                                                                          4);
                                                                  optionsController
                                                                      .changeVerticalRestaurent(
                                                                          '202',
                                                                          6);
                                                                }
                                                              }
                                                              // if (optionsController
                                                              //         .optionsKey
                                                              //         .value ==
                                                              //     '') {
                                                              //   if (addressController
                                                              //               .retailResponse[optionsController
                                                              //                   .vertical]
                                                              //               .base64Imageid ==
                                                              //           27 &&
                                                              //       //added by sahana
                                                              //       addressController
                                                              //               .retailResponse[optionsController.vertical]
                                                              //               .val ==
                                                              //           'Grocery') {
                                                              //     optionsController
                                                              //         .changeVerticalRestaurent1(
                                                              //             '27',
                                                              //             2);
                                                              //         //      optionsController
                                                              //         // .changeVerticalRestaurent(
                                                              //         //     '202',
                                                              //         //     4);

                                                              //   }
                                                              // } else
                                                              if (optionsController
                                                                      .optionsKey
                                                                      .value ==
                                                                  GUEST) {
                                                                if (addressController
                                                                            .retailResponse[optionsController
                                                                                .vertical]
                                                                            .base64Imageid ==
                                                                        27 &&
                                                                    //added by sahana
                                                                    addressController
                                                                            .retailResponse[optionsController.vertical]
                                                                            .val ==
                                                                        'Grocery') {
                                                                  optionsController
                                                                      .changeVerticalRestaurent1(
                                                                          '27',
                                                                          1);
                                                                  optionsController
                                                                      .changeVerticalRestaurent(
                                                                          '202',
                                                                          4);
                                                                }
                                                              }

                                                              if (optionsController
                                                                      .optionsKey
                                                                      .toString() ==
                                                                  '') {
                                                                print(
                                                                    'guestvertical');

                                                                Prefs
                                                                    .setverticalId(
                                                                  addressController
                                                                      .retailResponse[
                                                                          optionsController
                                                                              .vertical]
                                                                      .id!
                                                                      .toString(),
                                                                );
                                                                if (addressController
                                                                            .retailResponse[optionsController
                                                                                .vertical]
                                                                            .base64Imageid ==
                                                                        27 &&
                                                                    //added by sahana
                                                                    addressController
                                                                            .retailResponse[optionsController.vertical]
                                                                            .val ==
                                                                        'Grocery') {
                                                                  optionsController
                                                                      .changeVerticalRestaurent1(
                                                                          '27',
                                                                          2);
                                                                }
                                                                addressController
                                                                    .updateVertical(
                                                                        //addedbysofiya mar 16
                                                                        addressController
                                                                            .retailResponse[optionsController
                                                                                .vertical]
                                                                            .base64Imageid!,
                                                                        languageController
                                                                            .languagenum
                                                                            .toString());
                                                                viewController
                                                                    .setView(
                                                                        INFO);
                                                                viewController
                                                                    .setInfoMessage(
                                                                        'Vertical Updated Successfully');
                                                              } else {
                                                                print(
                                                                    'clientvertical');
                                                                addressController.updateVertical(
                                                                    addressController
                                                                        .retailResponse[optionsController
                                                                            .vertical]
                                                                        .base64Imageid!,
                                                                    languageController
                                                                        .languagenum
                                                                        .toString());
                                                              }

                                                              print('&&&&&^');
                                                              print(optionsController
                                                                  .optionsKey
                                                                  .toString());

                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                              keyboardController
                                                                  .setKeypad(
                                                                      '');
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                PAY) {
                                                              print(posMasterSelectionController
                                                                  .payModeResponse
                                                                  .value[pay]
                                                                  .payDescription);
                                                              if (posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[
                                                                          pay]
                                                                      .payDescription ==
                                                                  'CARDS') {
                                                                headerController
                                                                    .subHeaderLabel(
                                                                        //'Pay - By Card'
                                                                        languageController.languageResponse.value.payByCard ??
                                                                            '');
                                                                print(posMasterSelectionController
                                                                    .payModeResponse
                                                                    .value[pay]
                                                                    .payCode);
                                                                // viewController.setView(PAYBYCARD);
                                                                //paymentpage
                                                                payCardController
                                                                    .startPayment();
                                                              } else if (posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[
                                                                          pay]
                                                                      .payDescription ==
                                                                  'CASH') {
                                                                print(posMasterSelectionController
                                                                    .payModeResponse
                                                                    .value[pay]
                                                                    .payCode);
                                                                orderController.orderInsertNew(
                                                                    await Prefs
                                                                        .orderId,
                                                                    '34',
                                                                    reviewController
                                                                        .discount
                                                                        .toString(),
                                                                    reviewController
                                                                        .convenienceFee
                                                                        .toString(),
                                                                    reviewController
                                                                        .totalPrice
                                                                        .toString(),
                                                                    reviewController
                                                                        .addTips
                                                                        .toString());
                                                              } else if (posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[
                                                                          pay]
                                                                      .payDescription ==
                                                                  'e-WALLET') {
                                                                headerController
                                                                    .subHeaderLabel(
                                                                        'Pay - By e-Wallet');
                                                              } else if (posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[
                                                                          pay]
                                                                      .payDescription ==
                                                                  'GIFT CARDS') {
                                                                headerController
                                                                    .subHeaderLabel(
                                                                        'Pay - By Gift Card');
                                                              } else if (posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[
                                                                          pay]
                                                                      .payDescription ==
                                                                  'LOYALTY POINTS') {
                                                                headerController
                                                                    .subHeaderLabel(
                                                                        'Loyalty Redemption');
                                                                paymentReviewController.fetchLoyaltyPoints(
                                                                    paymentReviewController
                                                                        .totalPrice
                                                                        .toString(),
                                                                    languageController
                                                                        .languagenum
                                                                        .toString());
                                                              } else if (posMasterSelectionController
                                                                      .payModeResponse
                                                                      .value[
                                                                          pay]
                                                                      .payDescription ==
                                                                  'STORE CREDIT') {
                                                                headerController
                                                                    .subHeaderLabel(
                                                                        'Pay - By Store Credit');
                                                                viewController
                                                                    .setView(
                                                                        STORECREDIT);
                                                              }

                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                              keyboardController
                                                                  .setKeypad(
                                                                      '');
                                                            }
                                                            // else if(keyboardController
                                                            //         .pickerValue
                                                            //         .value ==
                                                            //     'MODEOFPAYMENT'){
                                                            //       if (posMasterSelectionController
                                                            //           .payModeResponse
                                                            //           .value[pay]
                                                            //           .payDescription ==
                                                            //       'CASH') {
                                                            //         headerController
                                                            //         .subHeaderLabel(
                                                            //             //'Pay - By Cash'
                                                            //             languageController
                                                            //                     .languageResponse
                                                            //                     .value
                                                            //                     .payByCash ??''
                                                            //             );
                                                            //             keyboardController.setPicker('');
                                                            //         viewController.setView(PAYBYCASH);
                                                            //       }

                                                            //}
                                                            else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "guestCountry") {
                                                              print(
                                                                  'Sofiya--->${posMasterSelectionController.countryCode.value}');

                                                              // fetchCountryController.fetchCountryLogin(
                                                              //     GuestCountryController
                                                              //         .guestfetchcountryResponse[
                                                              //             guestCountry]
                                                              //         .countryName
                                                              //  .toString(),
                                                              // languageController
                                                              //     .languagenum
                                                              //     .toString()); //Addedbysofiya mar 17
                                                              // Prefs.setGuestCountry(
                                                              //     GuestCountryController
                                                              //         .guestfetchcountryResponse[
                                                              //             guestCountry]
                                                              //         .countryName
                                                              //         .toString());
                                                              viewController
                                                                  .setView(
                                                                      INFO);
                                                              viewController
                                                                  .setInfoMessage(
                                                                      'You have selected India. The registered shops in a geographical area will be displayed. Pick up a geographical area in India by tapping on the Select City ICON');
                                                              //${await Prefs.guestcountry}
                                                              print(
                                                                  'Countrypicker${await Prefs.guestcountry}');
                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "guestCity") {
                                                              Prefs.setGuestCity(
                                                                  CityController
                                                                      .fetchcityResponse[
                                                                          guestCity]
                                                                      .CITY_NAME
                                                                      .toString());
                                                              print(
                                                                  'city${await Prefs.guestcity}');
                                                              CityController
                                                                  .fetchAreaLogin();
                                                              //added by saha
                                                              headerController.setSubHeaderLabel(
                                                                  'Select Area'
                                                                  //  languageController
                                                                  //           .languageResponse
                                                                  //           .value
                                                                  //           .selectArea ??''
                                                                  );

                                                              optionsController
                                                                  .hideShadow();

                                                              keyboardController
                                                                  .setKeypad(
                                                                      "");
                                                              keyboardController
                                                                  .setPicker(
                                                                      'fetchArea');
                                                              //added by kavery
                                                              viewController
                                                                  .setView('');
                                                              configureController
                                                                  .fetchShopType(
                                                                      languageController
                                                                          .languagenum
                                                                          .toString());
                                                              optionsController
                                                                  .setSetState();
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "fetchArea") {
                                                              Prefs.setGuestArea(
                                                                  CityController
                                                                      .fetchAreaResponse[
                                                                          guestArea]
                                                                      .PIN_CODE
                                                                      .toString());
                                                              optionsController
                                                                  .setSetState();
                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                              keyboardController
                                                                  .setKeypad(
                                                                      '');
                                                              print(
                                                                  'area${await Prefs.areaCode}');
                                                              if (optionsController
                                                                      .optionsKey
                                                                      .value ==
                                                                  GUEST) {
                                                                if (addressController
                                                                            .retailResponse[optionsController
                                                                                .vertical]
                                                                            .base64Imageid ==
                                                                        83 &&
                                                                    addressController
                                                                            .retailResponse[optionsController.vertical]
                                                                            .val ==
                                                                        'Restaurant') {
                                                                  shopController
                                                                      .getData();
                                                                  keyboardController
                                                                      .setPicker(
                                                                          "Restaurant");
                                                                  headerController
                                                                      .setSubHeaderLabel(
                                                                          'Select Store');

                                                                  optionsController
                                                                      .optionIndexSetter(
                                                                          4);
                                                                } else {
                                                                  configureController.fetchShopType(
                                                                      languageController
                                                                          .languagenum
                                                                          .toString());

                                                                  viewController
                                                                      .setView(
                                                                          CHOOSESTOREPAGE);
                                                                  configureController.fetchDetailsGuest(
                                                                      languageController
                                                                          .languagenum
                                                                          .toString());
                                                                  optionsController
                                                                      .optionIndexSetter(
                                                                          4);
                                                                }
                                                              } else {
                                                                if (addressController
                                                                            .retailResponse[optionsController
                                                                                .vertical]
                                                                            .base64Imageid ==
                                                                        83 &&
                                                                    addressController
                                                                            .retailResponse[optionsController.vertical]
                                                                            .val ==
                                                                        'Restaurant') {
                                                                  shopController
                                                                      .getData();
                                                                  keyboardController
                                                                      .setPicker(
                                                                          "Restaurant");
                                                                  headerController
                                                                      .setSubHeaderLabel(
                                                                          'Select Store');

                                                                  optionsController
                                                                      .optionIndexSetter(
                                                                          2);
                                                                } else {
                                                                  configureController.fetchShopType(
                                                                      languageController
                                                                          .languagenum
                                                                          .toString());

                                                                  viewController
                                                                      .setView(
                                                                          CHOOSESTOREPAGE);
                                                                  configureController.fetchDetailsGuest(
                                                                      languageController
                                                                          .languagenum
                                                                          .toString());
                                                                  optionsController
                                                                      .optionIndexSetter(
                                                                          2);
                                                                }
                                                              }
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Restaurant") {
                                                              if (optionsController
                                                                      .optionsKey
                                                                      .value !=
                                                                  GUEST) {
                                                                headerController
                                                                    .setSubHeaderLabel(
                                                                        // 'Neighbourhood Cafe'
                                                                        languageController.languageResponse.value.neighbourhoodCafe ??
                                                                            '');
                                                                print(
                                                                    'Home page client');
                                                                configureController.letMeShop(
                                                                    shopController
                                                                        .outletpicker[
                                                                            outlet]
                                                                        .id!,
                                                                    languageController
                                                                        .languagenum
                                                                        .toString());
                                                                optionsController
                                                                    .setSetState();
                                                                keyboardController
                                                                    .setPicker(
                                                                        '');
                                                                keyboardController
                                                                    .setKeypad(
                                                                        '');
                                                              } else {
                                                                headerController.setSubHeaderLabel(
                                                                    languageController
                                                                            .languageResponse
                                                                            .value
                                                                            .neighbourhoodCafe ??
                                                                        ''
                                                                    //'Neighbourhood Cafe'
                                                                    );
                                                                print(
                                                                    'Home page Guest');
                                                                Prefs.setRestaurant(
                                                                    shopController
                                                                        .outletpicker[
                                                                            outlet]
                                                                        .val
                                                                        .toString());
                                                                configureController.letMeShopGuest(
                                                                    shopController
                                                                        .outletpicker[
                                                                            outlet]
                                                                        .id!
                                                                        .toString(),
                                                                    languageController
                                                                        .languagenum
                                                                        .toString());
                                                                optionsController
                                                                    .setSetState();
                                                                keyboardController
                                                                    .setPicker(
                                                                        '');
                                                                keyboardController
                                                                    .setKeypad(
                                                                        '');
                                                              }
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "BrowseMethod") {
                                                              Prefs.setBrowseMethod(
                                                                  configureController
                                                                      .browsePicker[
                                                                          browseMethod]
                                                                      .id
                                                                      .toString());
                                                              //added by sahana
                                                              print(
                                                                  "--------->${configureController.browsePicker[browseMethod].id}");
                                                              if (configureController
                                                                      .browsePicker[
                                                                          browseMethod]
                                                                      .id ==
                                                                  '1') {
                                                                viewController
                                                                    .setView(
                                                                        PRODUCTNEWPAGE);

                                                                if (optionsController
                                                                            .outlet ==
                                                                        '202' ||
                                                                    optionsController
                                                                            .outlet ==
                                                                        '41') {
                                                                  headerController
                                                                      .setSubHeaderLabel(
                                                                          'Categories');
                                                                } else {
                                                                  headerController
                                                                      .setSubHeaderLabel(
                                                                          'product super Categories');
                                                                }

                                                                optionsController
                                                                    .setOptionList(
                                                                        BROWSE);
                                                                optionsController
                                                                    .getBrowseList();
                                                                optionsController
                                                                    .optionIndexSetter(
                                                                        1);
                                                              } else {
                                                                viewController
                                                                    .setView(
                                                                        SELECTCATAGORYPAGE);
                                                                headerController.setSubHeaderLabel(
                                                                    configureController
                                                                        .subheaderResponse
                                                                        .value);
                                                                optionsController
                                                                    .setOptionList(
                                                                        BROWSE);
                                                                optionsController
                                                                    .getBrowseList();
                                                                optionsController
                                                                    .optionIndexSetter(
                                                                        2);
                                                              }
                                                              optionsController
                                                                  .setSetState();
                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                              keyboardController
                                                                  .setKeypad(
                                                                      '');
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Jewellary") {
                                                              keyboardController
                                                                  .setPicker(
                                                                      'Jewellarysubcategory');
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Jewellarysubcategory") {
                                                              keyboardController
                                                                  .setPicker(
                                                                      'Jewellaryitem');
                                                            } else if (keyboardController
                                                                    .pickerValue
                                                                    .value ==
                                                                "Jewellaryitem") {
                                                              keyboardController
                                                                  .setPicker(
                                                                      '');
                                                              viewController
                                                                  .setView(
                                                                      JEWELLARY);
                                                            }
                                                          },
                                                          child: Text(
                                                            'DONE',
                                                            style: GoogleFonts
                                                                .openSans(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        25,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                StatefulBuilder(builder:
                                                    (context, setState) {
                                                  return pickerMethod(
                                                      setState, controller);
                                                })
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),

                                  // Page View

                                  GetX<ViewController>(
                                      init: ViewController(),
                                      initState: (_) {},
                                      builder: (controller) {
                                        try {
                                          if (controller.previousKey[controller
                                                          .previousKey.length -
                                                      1] !=
                                                  '' &&
                                              controller.previousKey[controller
                                                          .previousKey.length -
                                                      1] !=
                                                  'INFO' &&
                                              controller.previousKey[controller
                                                          .previousKey.length -
                                                      1] !=
                                                  'SPLASH') {
                                            //     if(controller.viewKey.isNotEmpty){
                                            //         controller.previousKey.add(
                                            // controller.viewKey.toString());
                                            //  print(">>>>>>>>>>>>"+controller.previousKey.toString());
                                            //     }
                                          }
                                        } catch (e) {
                                          print(
                                              "range error view key initialstage");
                                        }

                                        print(
                                            "--------------->${controller.viewKey}");
                                        if (controller.viewKey.value ==
                                            CLIENTLOGIN) {
                                          return LoginTab(
                                            mainController: usermailID,
                                            passController: password,
                                            actualHeight: actualHeight,
                                            keyboardController:
                                                keyboardController,
                                            viewcontroller: viewController,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PICKER) {
                                          return PickerMethod(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            ITEMVIEWPAGE) {
                                          return ItemView(
                                            actualHeight: actualHeight,
                                          );
                                        }
                                        // else if (controller.viewKey.value ==
                                        //     PAYBYCARD) {
                                        //   return PaymentScreen(
                                        //     //actualHeight: actualHeight,
                                        //   );
                                        // }
                                        else if (controller.viewKey.value ==
                                            PAYBYCASH) {
                                          return ByCashPage(
                                            actualHeight: actualHeight,
                                            firstController: cashpaid,
                                          );
                                        } else if (controller.viewKey.value ==
                                            CATALOG) {
                                          return CateloguePage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            DELMODE) {
                                          return DeliveryMode(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PRODUCTPURCHASEPAGE) {
                                          return ProductPurchasePage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PRODUCTNEWPAGE) {
                                          return ProductNew(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PRODUCTSUBCATEGORY) {
                                          return ProductSubCategory(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SEARCHITEM) {
                                          return SearchItem(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SUBCATAGORYFILTER) {
                                          return SubCatagoryFilter(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SELECTCATAGORYPAGE) {
                                          return SelectCatagoryList(
                                              actualHeight: actualHeight,
                                              keyboardController:
                                                  keyboardController,
                                              viewcontroller: viewController,
                                              qtycontroller:
                                                  quantityController);
                                        } else if (controller.viewKey.value ==
                                            SELECTSUBCATAGORYPAGE) {
                                          return SelectSubCatagoryList(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            TERMSANDCONDITION) {
                                          return TandC(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            EXPERTVIEWS) {
                                          return ExptView(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            FAQ) {
                                          return faqview(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            RESOURCES) {
                                          return rsrcsview(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            REVIEWPAGE) {
                                          return ViewOrderWidget(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            LOYALTYPOINTS) {
                                          return LoyaltyDetails(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            STORECREDIT) {
                                          return StoreCreditsPage(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            CHOOSESTOREPAGE) {
                                          return SelectStoreWidget(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            MYORDERSTATUS) {
                                          return MyOrderStatus(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            MYORDERITEMS) {
                                          return MyOrderReviewPage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            LISTSHOPPING) {
                                          return CatalogueListWidget(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SHOPLIST) {
                                          return ShoppingList(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            DIRECTICONACCESS) {
                                          return DirectIconAccess(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SHOPFILTER) {
                                          return filtershop(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SHOPEDIT) {
                                          return editedshop(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PRODUCT) {
                                          return ProductView(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            WISHITEMS) {
                                          return WishItems(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            ADDONS) {
                                          return AddOns(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PENDINGORDERS) {
                                          return OrdersPending(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            OLDORDERS) {
                                          return MyOrderWidget(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PENDINGEDIT) {
                                          return pendingEdit(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            WISHLISTEDIT) {
                                          return WishListEdit(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            REVIEWPAYMENT) {
                                          return ReviewPayment(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            CHANGEDELIVERYADDRESS) {
                                          return ChangeDEliveryAddress(
                                            actualHeight: actualHeight,
                                            keyboardController:
                                                keyboardController,
                                          );
                                        }
                                        // else if (controller.viewKey.value ==
                                        //     REVIEWRATINGPAGE) {
                                        //   return ReviewRatingPage(
                                        //       actualHeight: actualHeight);
                                        // }
                                        else if (controller.viewKey.value ==
                                            DELIVERYTIMEPAGE) {
                                          return DeliveryTimePage(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            DEVICEFEEDBACK) {
                                          return DeviceFeedBack(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            CLIENTLOGOUT) {
                                          return ClientLogoutAccess(
                                              actualHeight: actualHeight);
                                        } else if (viewController.viewKey.value ==
                                            SHOPOUTLETPAGE) {
                                          return ShopOutletPage(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            CLIENTPROFILE) {
                                          Prefs.superUserLoggedIn.then((value) {
                                            if (value) {
                                              profileController.profilefetch(
                                                  languageController.languagenum
                                                      .toString());
                                              salutaion.text = profileController
                                                  .profileResponse
                                                  .value
                                                  .salutations
                                                  .toString();

                                              firstName.text = profileController
                                                  .profileResponse
                                                  .value
                                                  .firstName
                                                  .toString();
                                              lastNAme.text = profileController
                                                  .profileResponse
                                                  .value
                                                  .lastName
                                                  .toString();
                                              dob.text = profileController
                                                  .profileResponse.value.dob
                                                  .toString();
                                              add1.text = profileController
                                                  .profileResponse.value.addr1
                                                  .toString();
                                              print('profiletab home');

                                              add2.text = profileController
                                                  .profileResponse.value.addr2
                                                  .toString();
                                              city.text = profileController
                                                  .profileResponse.value.city
                                                  .toString();
                                              province.text = profileController
                                                  .profileResponse.value.state
                                                  .toString();
                                              country.text = profileController
                                                  .profileResponse.value.country
                                                  .toString();
                                              postalCode.text =
                                                  profileController
                                                      .profileResponse
                                                      .value
                                                      .zipCode
                                                      .toString();
                                              mobile.text = profileController
                                                  .profileResponse.value.mob3
                                                  .toString();
                                              mailId.text = profileController
                                                  .profileResponse.value.email
                                                  .toString();
                                              Image.network(profileController
                                                  .profileResponse
                                                  .value
                                                  .profilePicture
                                                  .toString());

                                              //Image.file(File.fromUri(imageFile.));
                                            }
                                          });
                                          return ProfileTab(
                                            actualHeight: actualHeight,
                                            FirstName: firstName,
                                            LastName: lastNAme,
                                            Salutaion: salutaion,
                                            MailID: mailId,
                                            Add1: add1,
                                            Add2: add2,
                                            City: city,
                                            Country: country,
                                            DOB: dob,
                                            imageFile: imageFile,
                                            Mobile: mobile,
                                            Postal: postalCode,
                                            Province: province,
                                            areaCode: postalCode,
                                            Mail: mailId,
                                            userName: usermailID,
                                          );

                                          //}
                                        } else if (controller.viewKey.value ==
                                                FORGETPASSWORD ||
                                            controller.viewKey.value ==
                                                NEWUSEROTPSENT ||
                                            controller.viewKey.value ==
                                                ClIENTCHANGEPASSWORD) {
                                          keyboardController.i = -1;

                                          otpControllers.clear();
                                          otpControllers = List.generate(
                                              6,
                                              (index) =>
                                                  TextEditingController());

                                          return OtpScreen(
                                            actualHeight: actualHeight,
                                            focusNode: focusnode,
                                            otpController: otpControllers,
                                          );
                                        } else if (controller.viewKey.value ==
                                            MOBILEOTP) {
                                          keyboardController.i = -1;

                                          otpControllers.clear();
                                          otpControllers = List.generate(
                                              6,
                                              (index) =>
                                                  TextEditingController());

                                          return MobileOtpScreen(
                                            actualHeight: actualHeight,
                                            focusNode: focusnode,
                                            otpController: otpControllers,
                                          );
                                        } else if (controller.viewKey.value ==
                                            FIRSTTIME) {
                                          return MailTab(
                                              mainController: firstmailId);
                                        } else if (controller.viewKey.value ==
                                            FAMILYMEMBERS) {
                                          return FamilyMembers(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (viewController.viewKey.value ==
                                            ADDTIP) {
                                          return AddTipPage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SHOPBYLIST) {
                                          return ShopByList(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (viewController.viewKey.value ==
                                            FREEFLOWSHOPPING) {
                                          return FreeFlowShopping(
                                              actualHeight: actualHeight);
                                        } else if (viewController.viewKey.value ==
                                            SHOPATSTOREWEIGH) {
                                          return ShopAtStoreWeigh(
                                            actualHeight: actualHeight,
                                            firstController: netweight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            CONFIGURE) {
                                          return ShoppingReview(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            MODE) {
                                          return ShoppingMode(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            ORDERCONFIRMATION) {
                                          return OrderConfirmation(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PROMOTIONSSCRATCHPAGE) {
                                          return PromotionScratchCoupon(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            MAINACCESS) {
                                          return MainAccess(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            CLIENTACCESS) {
                                          return ClientAccess(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            ADDONSACCESS) {
                                          return AddonsAccess(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            SHOPACCESS) {
                                          return ShopAccess(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            SUPPORTACCESS) {
                                          return SupportAccess(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            RETAILVERTICAL) {
                                          return RetailVertical(
                                              //actualHeight: actualHeight
                                              );
                                        } else if (viewController.viewKey.value ==
                                        EMPTYPAGE) {
                                      return empty(
                                        actualHeight: actualHeight,
                                      );
                                    } else if (viewController.viewKey.value ==
                                        PRODUCTRESITEM) {
                                      return ProductItemRespage(
                                        actualHeight: actualHeight,
                                      );
                                    } 
                                        else if (controller.viewKey.value ==
                                            SUPERLOGINSUCCESS) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: '',
                                                  // content: loginController
                                                  //     .loginResponse
                                                  //     .value
                                                  //     .message!,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .welcome ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            FIRSTUSERLOGINSUCESS) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: newUserController
                                                      .otpsentResponse
                                                      .value
                                                      .message!,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .welcome ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            CHECKPASSWORD) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: languageController
                                                          .languageResponse
                                                          .value
                                                          .ChnagePwdInfo ??
                                                      '',
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .info ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            ERROR) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: viewController
                                                      .errorMess.value,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .error ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            INFO) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: viewController
                                                      .infoMess.value,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .info ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            SUCCESS) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: viewController
                                                      .successMess.value,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .success ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            WELCOME) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: viewController
                                                      .successMess.value,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .welcome ??
                                                      ''),
                                            ],
                                          );
                                        } 
                                        else if (controller.viewKey.value ==
                                            SUCCESSMERCHANT) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: Platform.isAndroid
                                                    ? (actualHeight - 60) / 17.9
                                                    : actualHeight / 19,
                                              ),
                                              DisplayArea(
                                                  content: viewController
                                                      .successMess.value,
                                                  heading: languageController
                                                          .languageResponse
                                                          .value
                                                          .success ??
                                                      ''),
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            CAUTION) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: CautionPage(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .logOutConformation ??
                                                  '',
                                              heading: languageController
                                                      .languageResponse
                                                      .value
                                                      .caution ??
                                                  '',
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            USERDELETE) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: Userdelete(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .areYouSureWantToDeleteThisUser ??
                                                  '',
                                              //'are you sure want to delete this user?',
                                              heading: USERDELETE,
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            CAUTIONDELETE) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: CautionPage(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .deleteAddress ??
                                                  '',
                                              heading: languageController
                                                      .languageResponse
                                                      .value
                                                      .caution ??
                                                  '',
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            CAUTIONSHOPLIST) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: CautionPage(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .doYouReallyWantToDeleteThisItem ??
                                                  '',
                                              //'Do you really want to delete this item ?',
                                              heading: languageController
                                                      .languageResponse
                                                      .value
                                                      .caution ??
                                                  '',
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            CAUTIONWISHLIST) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: CautionPage(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .doYouReallyWantToDeleteThisItem ??
                                                  '',
                                              // 'Do you really want to delete this item ?',
                                              heading: languageController
                                                      .languageResponse
                                                      .value
                                                      .caution ??
                                                  '',
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            CAUTIONPENDING) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: CautionPage(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .doYouReallyWantToDeleteThisItem ??
                                                  '',
                                              //'Do you really want to delete this item ?',
                                              heading: languageController
                                                      .languageResponse
                                                      .value
                                                      .caution ??
                                                  '',
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            CAUTIONREVIEWPAGE) {
                                          return Padding(
                                            padding: Platform.isAndroid
                                                ? const EdgeInsets.only(
                                                    left: 40.0)
                                                : const EdgeInsets.only(
                                                    top: 50.0),
                                            child: CautionPage(
                                              content: languageController
                                                      .languageResponse
                                                      .value
                                                      .doYouReallyWantToDeleteThisItem ??
                                                  '',
                                              //'Do you really want to delete this item ?',
                                              heading: languageController
                                                      .languageResponse
                                                      .value
                                                      .caution ??
                                                  '',
                                            ),
                                          );
                                        } else if (controller.viewKey.value ==
                                            CLIENTOTPVERIFIED) {
                                          return ChangePasswordTab(
                                            actualHeight: actualHeight,
                                            oldpass: oldpass,
                                            newPass: newPass,
                                            resetPass: resetPass,
                                          );
                                        } else if (controller.viewKey.value ==
                                            NEWUSEROTPVERIFIED) {
                                          return SetPasswordTab(
                                            actualHeight: actualHeight,
                                            newPass: newPass,
                                            resetPass: resetPass,
                                          );
                                        } else if (controller.viewKey.value ==
                                            CLIENTFPOTPVERIFIED) {
                                          return ResetPasswordTab(
                                            actualHeight: actualHeight,
                                            newPass: newPass,
                                            resetPass: resetPass,
                                          );
                                        } else if (controller.viewKey.value ==
                                            MOBILENUMBER) {
                                          return MobileTab(
                                            mainController: mailId,
                                            mobileController: mobile,
                                          );
                                        } else if (controller.viewKey.value ==
                                            COUPONPAGE) {
                                          return CouponPage(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            JEWELLARY) {
                                          return JewellaryScreen(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            PROMOTIONS) {
                                          return PromotionPage(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            SERVICE) {
                                          return ServiceCharge(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            REVIEWSTORE) {
                                          return ReviewRatingPage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            SERVICECHARGES) {
                                          return ServiceCharge(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value ==
                                            ADDFAMILYADDRESS) {
                                          return FamilyMembers(
                                              actualHeight: actualHeight);
                                        } else if (controller.viewKey.value == MATHCALCULATE) {
                                          return CalciButton(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value == CURRENCYCALCULATE) {
                                          return CurrencyTab(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value == SHARE) {
                                          return SharePage(
                                            mobile: mobileController,
                                            friendmobile:
                                                friendmobileController,
                                            friendname: friendnameController,
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value == MESSAGE) {
                                          return MessagePage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value == 'Shopselectioncond') {
                                          return Shopselectioncond(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value == VIEWSHOP) {
                                          return StoreDetailsWidget(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value == STOREDETAILPAGE) {
                                          return ShopDetailsWidget(
                                            actualHeight: actualHeight,
                                          );
                                        }
                                        // else if (controller.viewKey.value == WELCOMEE) {
                                        //   return const WelcomScreen(
                                        //       //actualHeight: actualHeight,
                                        //       );
                                        // }
                                        else if (controller.viewKey.value ==
                                            COUNTRY) {
                                          return const CountryFlag(
                                              //actualHeight: actualHeight,
                                              );
                                        } else if (controller.viewKey.value ==
                                            PRODUCTVIEW) {
                                          return ProductItempage(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            REVIEWORDER) {
                                          return ReviewOrder(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (controller.viewKey.value ==
                                            PAYMODE) {
                                          return PayMode(
                                            actualHeight: actualHeight,
                                          );
                                        }
                                        // else if(controller.viewKey.value == ADDADDRESS){
                                        //   return AddAddressTab(
                                        //     actualHeight: actualHeight,
                                        //     firstController: firstName,
                                        //     lastController: lastNAme,
                                        //     countryController: country,
                                        //     cityController: city,
                                        //     areaCodeController: city,
                                        //     mainController: mailId,
                                        //     mobileController: mobile,
                                        //     mobileController1: addressbookmobile2,
                                        //     mobileController2: addressbookmobile3,
                                        //     postalController: postalCode,
                                        //     stateController: province,
                                        //     addr1Controller: add1,
                                        //     addr2Controller: add2,
                                        //     localityController: locality,
                                        //     locationController: location,

                                        //   );
                                        // }
                                        else if (controller.viewKey.value ==
                                                OWNERDETAILS ||
                                            controller.viewKey.value ==
                                                ADDADDRESS ||
                                            controller.viewKey.value ==
                                                EDITADDRESS) {
                                          return MobileOwnDataTab(
                                            actualHeight: actualHeight,
                                            firstController: firstName,
                                            lastController: lastNAme,
                                            countryController: country,
                                            cityController: city,
                                            areaCodeController: city,
                                            mainController: mailId,
                                            mobileController: mobile,
                                            mobileController1:
                                                addressbookmobile2,
                                            mobileController2:
                                                addressbookmobile3,
                                            postalController: postalCode,
                                            stateController: province,
                                            addr1Controller: add1,
                                            addr2Controller: add2,
                                            localityController: locality,
                                            locationController: location,
                                          );
                                        } else if (controller.viewKey.value ==
                                            LanguageSetter) {
                                          return Column(
                                            children: [
                                              LanguageSelectionTab(
                                                keyboardController:
                                                    keyboardController,
                                                actualHeight: actualHeight,
                                                headercontroller:
                                                    headerController,
                                              )
                                            ],
                                          );
                                        } else if (controller.viewKey.value ==
                                            RESQRCODE) {
                                          return RestaurantQrcodeTab(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (viewController
                                                .viewKey.value ==
                                            CHATTY) {
                                          return askChatty(
                                            actualHeight: actualHeight,
                                            messageController:
                                                messageController,
                                          );
                                        } else if (viewController
                                                .viewKey.value ==
                                            MARKETPLACE) {
                                          return marketPlace(
                                            actualHeight: actualHeight,
                                          );
                                        } else if (viewController
                                                .viewKey.value ==
                                            FUTURECOUPONPAGE) {
                                          return FUTURECouponPage(
                                            actualHeight: actualHeight,
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ],
                              );
                            },
                          ),
                          GetX<MenuOptionController>(
                            init: MenuOptionController(),
                            initState: (_) {},
                            builder: (controller) {
                              if (controller.isActive.value) {
                                return GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                                    int sensitivity = 8;
                                    if (details.delta.dx > sensitivity) {
                                      // Right Swipe
                                    } else if (details.delta.dx <
                                        -sensitivity) {
                                      //Left Swipe
                                      controller.deActiveMenu();
                                    }
                                  },
                                  child: Container(
                                      // color: Colors.white,
                                      margin: const EdgeInsets.only(left: 5),
                                      height: (actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          1.3,
                                      width: (actualHeight -
                                              MediaQuery.of(context)
                                                  .padding
                                                  .bottom) /
                                          2.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey[500]!)),
                                      child: ListView.builder(
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return FractionallySizedBox(
                                              widthFactor: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: Colors
                                                                .grey[500]!))),
                                                height: GetPlatform.isAndroid
                                                    ? (actualHeight - 40) /
                                                        20.1 *
                                                        0.30
                                                    : (actualHeight -
                                                            MediaQuery.of(
                                                                    context)
                                                                .padding
                                                                .bottom) /
                                                        17.9,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // navigationcontroller
                                                    //     .goToPageFromNavigation(
                                                    //         navigationcontroller
                                                    //                 .navigationHistory[
                                                    //             index]);

                                                    controller.deActiveMenu();

                                                    controller.deActiveMenu();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        '',
                                                        style: TextStyle(
                                                          fontSize: 23,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          })),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   height: 0.5,
                    //   width: double.infinity,
                    //   color: Colors.black,
                    // ),

                    Container(
                        height: 75,
                        padding:
                            const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                        decoration: const BoxDecoration(
                            //color: Colors.amberAccent,
                            border: Border(
                          top: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        )),
                        child: StatefulBuilder(builder: (context, setState) {
                          return GetX<OptionsController>(
                              init: (optionsController),
                              initState: (_) {},
                              builder: (controller) {
                                if (controller.isShow.value &&
                                    controller.optionsKey.value == '') {
                                  return SizedBox(
                                    height: 70,
                                    child: Row(
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.bottomicons.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () async {
                                                if (index == 0) {
                                                  configureController
                                                      .fetchDetails(
                                                          languageController
                                                              .languagenum
                                                              .toString());
                                                  configureController
                                                      .fetchCustomerDeliveryAddress(
                                                          languageController
                                                              .languagenum
                                                              .toString());
                                                  print("Index 1 Tapped...");
                                                  print(await Prefs.shopId);
                                                   viewController
                                                      .setView(EMPTYPAGE);
                                                  openDrawer();
                                                  viewController.setView('');
                                                  shopController
                                                      .downloadRestaurantProduct(
                                                          languageController
                                                              .languagenum
                                                              .toString());
                                                  keyboardController
                                                      .setKeypad('');
                                                  keyboardController
                                                      .setPicker('');
                                                }
                                                if (index == 1) {}
                                              },
                                              child: Container(
                                                child: FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: iconSize(
                                                      controller
                                                          .bottomicons[index],
                                                      index),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                              width: 35,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            viewController.setView(REVIEWPAGE);
                                            headerController.setSubHeaderLabel(
                                                'Review Cart');
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0,
                                                bottom: 5.0,
                                                left: 1,
                                                right: 5),
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  height: 70,
                                                  child: optionsController
                                                      .reviewcart,
                                                ),
                                                GetX<AddCartReviewController>(
                                                  init:
                                                      AddCartReviewController(),
                                                  initState: (_) {},
                                                  builder: (controller) {
                                                    return Positioned(
                                                      top: 15,
                                                      left: 43,
                                                      child: Text(
                                                        //added by saha
                                                        controller
                                                            .tableValue.value
                                                            .toString()
                                                            .padLeft(3, '0'),
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          //  Container(
                                          //   height: 70,
                                          //   width: 70,
                                          //   child: optionsController.reviewcart,

                                          // ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        ListView.separated(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              controller.bottomicons2.length,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (index == 0) {
                                                  viewController
                                                      .setView(RETAILVERTICAL);

                                                  headerController
                                                      .setSubHeaderLabel(
                                                          'Select a Retail Vertical');
                                                }
                                                if (index == 1) {
                                                  viewController
                                                      .setView(COUNTRY);
                                                  headerController
                                                      .setSubHeaderLabel(
                                                          'Select Your Country');
                                                }
                                              },
                                              child: Container(
                                                child: FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: iconSize(
                                                      controller
                                                          .bottomicons2[index],
                                                      index),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return const SizedBox(
                                              width: 35,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return Container();
                              });
                        })
                       
                        )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: const Color.fromRGBO(214, 214, 214, 1),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      height: GetPlatform.isAndroid
                          ? MediaQuery.of(context).size.height * 0.032
                          : MediaQuery.of(context).size.height * 0.032,
                      padding: GetPlatform.isAndroid
                          ? const EdgeInsets.only(top: 3)
                          : const EdgeInsets.only(),
                      //  height: MediaQuery.of(context).size.height * 0.037,
                      width: double.infinity,
                      // padding: GetPlatform.isAndroid
                      //     ? EdgeInsets.fromLTRB(0, 8, 0, 0)
                      //     : EdgeInsets.fromLTRB(0, 6, 0, 0),
                      alignment: Alignment.topCenter,
                      color: Colors.grey[350],
                      child: const Text(
                        "© Copyright - Retail Resonance Pvt Ltd - All Rights Reserved",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(94, 94, 94, 1),
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      drawer: DrawerWidget(),
    );
  }

  Color getShopListShadow(OptionsController controller, int index) {
    if (controller.optionIndex == index || index == 0 || index == 1) {
      return Colors.black45;
    } else {
      return Colors.transparent;
    }
  }

  SizedBox iconSize(controller, int index) {
    return SizedBox(
      // added by bhava
      // width: 70.8,
      width: 65,
      height: 65,
      child: controller,
    );
  }

  checkCountry() async {
    if (await Prefs.tempCountry != '') {
      if (await Prefs.country != await Prefs.tempCountry) {
        //Country not equal return false
        validateCountry = false;
        return false;
      } else {
        //Country equal return true

        validateCountry = true;
        return true;
      }
      // }
    } else {
      validateCountry = true;

      //Country equal return true
      return true;
    }
  }

  keyboardWidget(BuildContext context, KeyboardController controller) {
    if (viewController.viewKey.value == CLIENTPROFILE ||
            viewController.viewKey.value == PRODUCTPURCHASEPAGE ||
            viewController.viewKey.value == FAMILYMEMBERS ||
            viewController.viewKey.value == ADDFAMILYADDRESS ||
            viewController.viewKey.value == REVIEWSTORE || // added by gowshi
            viewController.viewKey.value == REVIEWRATINGPAGE // added by gowshi
        ) return;
    if (controller.changekeypad.value == SYMBOLSKEYBOARD) {
      return NumeralSpecialChar(
        actualHeight: actualHeight,
        context: context,
        onValueChanged: (String) {
          keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == CAPITALKEYBOARD) {
      return AlphaCapitalLetters(
        actualHeight: actualHeight,
        context: context,
        onValueChanged: (String) {
          keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else if (controller.changekeypad.value == SMALLKEYBOARD) {
      return AlphaSmallLetters(
        actualHeight: actualHeight,
        context: context,
        onValueChanged: (String) {
          keyOperation(context);
        },
        size: const Size(100, 200),
      );
    } else {
      Container();
    }
  }

  pickerMethod(StateSetter setState, KeyboardController controller) {
    //var countryList = json['COUNTRY'] as List;

    if (controller.pickerValue.value == "Country") {
      print(posMasterSelectionController.countryCode.value
          .map((item) => Center(child: Text(item.countryName)))
          .toList());

      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: CupertinoPicker(
          magnification: 1.2,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            setState(() {
              // guestCountry = index;
              // Prefs.setGuestCountry(GuestCountryController
              //     .guestfetchcountryResponse[index].countryName!);
            });
            if (optionsController.optionsKey.value == '') {
              optionsController.changeVerticalRestaurent1(
                  addressController
                      .retailResponse[optionsController.vertical].base64Imageid
                      .toString(),
                  0);
            }
            // selectItem = items[index];

            print("Selected Iem: ");
          },
          selectionOverlay: Container(
            // width: 100,

            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.6),
              border: Border.all(
                color: const Color.fromARGB(255, 14, 14, 14).withOpacity(0.5),
                width: 2.0,
              ),
            ),
          ),
          children: GuestCountryController.guestfetchcountryResponse.value
              .map((item) => Center(
                      child: Text(
                    '',
                    // item.countryName.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )))
              .toList(),
        ),
      );
    } else if (controller.pickerValue.value == "Restaurant") {
      return GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (_) {
          return SizedBox(
            height: getProportionateScreenHeight(209),
            width: MediaQuery.of(context).size.width,
            child: CupertinoPicker(
              magnification: 1.2,
              backgroundColor: AppColors.subHeaderContainer,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  outlet = index;
                });

                print("Selected Iem: ");
              },
              selectionOverlay: Container(
                // width: 100,

                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.6),
                  border: Border.all(
                    color: const Color.fromARGB(255, 5, 4, 4).withOpacity(0.5),
                    width: 2.0,
                  ),
                ),
              ), //height of each item
              //looping: true,
              children: shopController.outletpicker
                  .map((item) => Center(
                      child: Text(item.val!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ))))
                  .toList(),
            ),
          );
        },
      );
    } else if (controller.pickerValue.value == "BrowseMethod") {
      return GetX<ShopController>(
        init: ShopController(),
        initState: (_) {},
        builder: (_) {
          return SizedBox(
            height: getProportionateScreenHeight(209),
            width: MediaQuery.of(context).size.width,
            child: CupertinoPicker(
              magnification: 1.2,
              backgroundColor: AppColors.subHeaderContainer,
              itemExtent: 50,
              onSelectedItemChanged: (index) {
                setState(() {
                  browseMethod = index;
                });

                print("Selected Iem: ");
              },
              selectionOverlay: Container(
                // width: 100,

                decoration: BoxDecoration(
                  color: Colors.yellowAccent.withOpacity(0.6),
                  border: Border.all(
                    color:
                        const Color.fromARGB(255, 18, 17, 17).withOpacity(0.5),
                    width: 2.0,
                  ),
                ),
              ), //height of each item
              //looping: true,
              children: configureController.browsePicker
                  .map((item) => Center(child: Text(item.val!)))
                  .toList(),
            ),
          );
        },
      );
    }
    
    else if (controller.pickerValue.value == "RetailVertical") {
      // print(countryList);
      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: CupertinoPicker(
          magnification: 1.2,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            setState(() {
              //addedbysofi
              optionsController.vertical = index;
              var temp = false;
              Prefs.superUserLoggedIn.then((value) {
                temp = value;
              });
              print(temp);

              print(viewController.useroption.value);
              if (optionsController.optionsKey.value == GUEST) {
                optionsController.changeVerticalRestaurent(
                    addressController.retailResponse[optionsController.vertical]
                        .base64Imageid
                        .toString(),
                    1);
              } else if (optionsController.optionsKey.value == '') {
                optionsController.changeVerticalRestaurent1(
                    addressController.retailResponse[optionsController.vertical]
                        .base64Imageid
                        .toString(),
                    2);
              } else {
                optionsController.changeVerticalRestaurentClient(
                    addressController.retailResponse[optionsController.vertical]
                        .base64Imageid
                        .toString(),
                    0);
              }
            });
            // selectItem = items[index];

            print("Selected Iem: ");
            // setState(() {
            //   selectItem=value.toString();
            // });
          },
          selectionOverlay: Container(
            // width: 100,

            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.6),
              border: Border.all(
                color: const Color.fromARGB(255, 18, 17, 17).withOpacity(0.5),
                width: 2.0,
              ),
            ),
          ), //height of each item
          // looping: true,
          children: addressController.retailResponse
              .map((item) => Center(
                      child: Text(
                    item.val!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )))
              .toList(),
        ),
      );
    } else if (controller.pickerValue.value == PAY) {
      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: CupertinoPicker(
          magnification: 1.2,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            setState(() => pay = index);
            // selectItem = items[index];

            print("Selected Iem: ");
            // setState(() {
            //   selectItem=value.toString();
            // });
          },
          selectionOverlay: Container(
            // width: 100,

            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.6),
              border: Border.all(
                color: const Color.fromARGB(255, 14, 14, 14).withOpacity(0.5),
                width: 2.0,
              ),
            ),
          ), //height of each item
          //looping: true,
          children: posMasterSelectionController.payModeResponse.value
              .map((item) => Center(
                      child: Text(
                    item.payDescription,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )))
              .toList(),
        ),
      );
    } else if (controller.pickerValue.value == "guestCountry") {
      // print(countryList);
      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: CupertinoPicker(
          magnification: 1.2,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            setState(() {
              // guestCountry = index;
              // Prefs.setGuestCountry(GuestCountryController
              //     .guestfetchcountryResponse[index].countryName!);
            });
            // selectItem = items[index];

            print("Selected Iem: ");
          },
          selectionOverlay: Container(
            // width: 100,

            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.6),
              border: Border.all(
                color: const Color.fromARGB(255, 14, 14, 14).withOpacity(0.5),
                width: 2.0,
              ),
            ),
          ),

          // looping: true,
          children: GuestCountryController.guestfetchcountryResponse.value
              .map((item) => Center(
                      child: Text(
                    '',
                    //item.countryName.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )))
              .toList(),
        ),
      );
    } else if (controller.pickerValue.value == "guestCity") {
      // print(countryList);
      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: GetX<FetchCityController>(builder: (controller) {
          return CupertinoPicker(
            magnification: 1.2,
            backgroundColor: AppColors.subHeaderContainer,
            itemExtent: 50,
            onSelectedItemChanged: (index) {
              setState(() {
                guestCity = index;
                // Prefs.setGuestCountry(GuestCountryController
                //     .guestfetchcountryResponse[index].COUNTRY_NAME
                //     .toString());
              });
              // selectItem = items[index];

              print("Selected Iem: ");
              // setState(() {
              //   selectItem=value.toString();
              // });
            },
            selectionOverlay: Container(
              // width: 100,

              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.6),
                border: Border.all(
                  color: const Color.fromARGB(255, 6, 6, 6).withOpacity(0.5),
                  width: 2.0,
                ),
              ),
            ),
            //looping: true,
            children: CityController.fetchcityResponse.value
                .map((item) => Center(
                    child: Text(item.CITY_NAME.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ))))
                .toList(),
          );
        }),
      );
    } else if (controller.pickerValue.value == "fetchArea") {
      // print(countryList);
      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: GetX<FetchCityController>(builder: (controller) {
          return CupertinoPicker(
            magnification: 1.2,
            backgroundColor: AppColors.subHeaderContainer,
            itemExtent: 50,
            onSelectedItemChanged: (index) {
              setState(() {
                guestArea = index;
                // Prefs.setGuestCountry(GuestCountryController
                //     .guestfetchcountryResponse[index].COUNTRY_NAME
                //     .toString());
              });
              // selectItem = items[index];

              print("Selected Iem: ");
              // setState(() {
              //   selectItem=value.toString();
              // });
            },
            selectionOverlay: Container(
              // width: 100,

              decoration: BoxDecoration(
                color: Colors.yellowAccent.withOpacity(0.6),
                border: Border.all(
                  color: const Color.fromARGB(255, 10, 10, 10).withOpacity(0.5),
                  width: 2.0,
                ),
              ),
            ),
            // looping: true,
            children: CityController.fetchAreaResponse.value
                .map((item) => Center(
                    child: Text(item.AREA_NAME.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ))))
                .toList(),
          );
        }),
      );
    } else if (controller.pickerValue.value == "TimeZone") {
      return SizedBox(
        height: getProportionateScreenHeight(209),
        width: MediaQuery.of(context).size.width,
        child: CupertinoPicker(
          magnification: 1.2,
          backgroundColor: AppColors.subHeaderContainer,
          itemExtent: 50,
          onSelectedItemChanged: (index) {
            setState(() {
              timezone = index;
              Prefs.setTimezone(GuestCountryController
                  .guestfetchcountryResponse[guestCountry]
                  .timeZone![index]
                  .nAME!);
            });
            // selectItem = items[index];

            print("Selected Iem: ");
          },
          selectionOverlay: Container(
            width: 50,
            decoration: BoxDecoration(
              color:
                  //Colors.white.withOpacity(0.7),
                  Colors.yellowAccent.withOpacity(0.6),
              border: Border.all(
                color: const Color.fromARGB(255, 7, 7, 7).withOpacity(0.5),
                width: 2.0,
              ),
            ),
          ),
          //children: root!.status.country[0].timezone[0].nAME,
          //looping: true,
          children: GuestCountryController
              .guestfetchcountryResponse[guestCountry].timeZone!
              .map((item) => Center(
                  child: Text(item.nAME.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ))))
              .toList(),
        ),
      );
    }
    
    else {
      Container();
    }
  }


  void getOptionClient(OptionsController controller, int index) {
    if (controller.optionIndex == index) {
      controller.release();
      headerController.setTimeChange();
      headerController.setSubHeaderLabel(
          languageController.languageResponse.value.users ?? '');
    } else {
      controller.optionIndexSetter(0);
      if (index == 0) {
        headerController.setHeaderLabel(
            languageController.languageResponse.value.users ?? '');
        headerController.setSubHeaderLabel(
            languageController.languageResponse.value.client ?? '');
      }
    }
  }

  int i = -1;
  Future<void> keyOperation(context) async {
    if (keyboardController.specialKeypad.value == 'DEL') {
      keyboardController.currentController.value =
          keyboardController.currentController.value.text.substring(
                  0, keyboardController.currentController.value.text.length - 1)
              as TextEditingController;
    } else if (keyboardController.specialKeypad.value == 'CLR') {
      keyboardController.currentController.value.clear();
    } else if (keyboardController.specialKeypad.value == 'SPACE') {
      keyboardController.currentController.value.text =
          "${keyboardController.currentController.value.text} ";
    } else if (keyboardController.specialKeypad.value == 'NEXT') {
    } else {}
  }

//added by sahana
  Widget countIcon(ViewController viewController,
      OrderController orderController, ShopController shopController) {
    if (viewController.viewKey.value == WISHITEMS) {
      return SizedBox(
          child: Text(
        orderController.whishlistResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == WISHLISTEDIT) {
      return SizedBox(
          child: Text(
        orderController.whishlistEditResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == PENDINGORDERS) {
      return SizedBox(
          child: Text(
        orderController.pendingOrdersResponse.value.length
            .toString()
            .padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == PENDINGEDIT) {
      return SizedBox(
          child: Text(
        orderController.pendingEditsResponse.value.length
            .toString()
            .padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == SHOPPINGLIST) {
      return SizedBox(
          child: Text(
        shopController.catalogueListResponse.value.length
            .toString()
            .padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == SHOPEDIT) {
      return SizedBox(
          child: Text(
        shopController.catalogueResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == SHOPFILTER) {
      return SizedBox(
          child: Text(
        shopController.shoppingOutletResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == OLDORDERS) {
      return SizedBox(
          child: Text(
        orderController.myOrderResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == MYORDERSTATUS) {
      return SizedBox(
          child: Text(
        orderController.myOrderEditResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == MYORDERITEMS) {
      return SizedBox(
          child: Text(
        orderController.myOrderEditResponse.length.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == REVIEWPAGE) {
      return SizedBox(
          child: Text(
        addCartReviewController.tabletotalvalue.value
            .toString()
            .padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == SELECTCATAGORYPAGE) {
      return SizedBox(
          child: Text(
        addCartReviewController.tabletotalvalue.value
            .toString()
            .padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == SELECTSUBCATAGORYPAGE) {
      return SizedBox(
          child: Text(
        addCartReviewController.tableValue.value.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == REVIEWPAYMENT) {
      return SizedBox(
          child: Text(
        addCartReviewController.tableValue.value.toString().padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    }
    if (viewController.viewKey.value == ADDTIP) {
      return SizedBox(
          child: Text(
        addCartReviewController.tabletotalvalue.value
            .toString()
            .padLeft(3, '0'),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ));
    } else {
      return Container();
    }
  }



  // store the  values in sharedPreference
  storeValue() async {
    // Replace the following line with your actual value extraction logic
    String extractedValue = GuestCountryController
        .guestfetchcountryResponse[guestCountry].timeZone![timezone].hOUR!
        .toString();

    // Store the value as an integer in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('hOUR', int.parse(extractedValue));

    String minutesValue = GuestCountryController
        .guestfetchcountryResponse[guestCountry].timeZone![timezone].mINS!
        .toString();
    // Store the value as an integer in SharedPreferences

    prefs.setInt('mINS', int.parse(minutesValue));

    String functions = GuestCountryController
        .guestfetchcountryResponse[guestCountry].timeZone![timezone].fUNCTION!
        .toString();
    prefs.setString('fUNCTION', functions);
  }

// get the  values in sharedPreference
  getValue() async {
    // Get the stored value from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int storedValue = prefs.getInt('hOUR') ?? 0;
    int storedMins = prefs.getInt('mINS') ?? 0;
    String storedfunctions = prefs.getString('fUNCTION') ??
        ''; // Provide a default value if not found

    // Print the stored value
    print('Stored Value: $storedValue');
    print('Stored Value: $storedMins');
    print('Stored Value: $storedfunctions');
  }
}
//ca version iteration

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late Position position;
  Future getLocation() async {
    position = await _getGeoLocationPosition();
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print(serviceEnabled);
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error(languageController
              .languageResponse.value.locationServicesAreDisable ??
          '');
    } else {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openAppSettings();

        getLocation();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      getLocation();
      viewController.setView(ERROR);
      viewController.setErrorMessage(
          'The location services are used in this application to detect your country details and display the sponsors in your country, show the stores nearby to you to choose the products you want to buy. This provides you important information and rich experience. We therefore strongly recommend you providing location permission to proceed with the application.');

      return Future.error(
          languageController.languageResponse.value.locationDeniedError ?? '');
    }
    if (await Prefs.mobile != '') {}
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  var headerController = Get.put(HeaderController());
  var languageController = Get.put(LanguageController());
  var addressController = Get.put(AddressController());
  var shopController = Get.put(ShopController());
  var keyboardController = Get.put(KeyboardController());
  var orderController = Get.put(OrderController());
  var forggetController = Get.put(ResetController());
  var configureController = Get.put(ConfigureController());
  String? mobileNum;

  bool isShopOpen = false;
  void toggleShop() {
    setState(() {
      isShopOpen = !isShopOpen;
    });
  }

  bool isUSettingsOpen = false;
  void toggleUSettings() {
    setState(() {
      isUSettingsOpen = !isUSettingsOpen;
    });
  }

  bool isSupportOpen = false;
  void toggleSupport() {
    setState(() {
      isSupportOpen = !isSupportOpen;
    });
  }

  bool isAddOnsOpen = false;
  void toggleAddOns() {
    setState(() {
      isAddOnsOpen = !isAddOnsOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color:  const Color.fromARGB(255, 210, 207, 207),
          margin: EdgeInsets.only(top: 45),
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              "MENU",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 85.5),
          height: 825,
          width: 390,
          child: Stack(
            children: [
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  color: Color.fromARGB(255, 251, 249, 249),
                  width: 390,
                  height: 825,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 38,
                  width: 38,
                  child: CustomPaint(
                    painter: TrianglePainter(),
                  ),
                ),
              ),
              Container(
                height: 825,
                width: 351.65,
                child: Drawer(
                  elevation: 0,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(),
                              child: optionsController.browsenew,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Browse Products',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Prefs.superUserLoggedIn.then((value) {
                            if (value) {
                              viewController.setView(INFO);
                              viewController.setInfoMessage(
                                  'Only guest User can be Browse the Product.');
                            } else {
                              viewController.setView(PRODUCTNEWPAGE);
                              viewController.setUserOption(GUEST);
                              headerController
                                  .setSubHeaderLabel('Main Category');
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: optionsController.register,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Prefs.superUserLoggedIn.then((value) {
                            if (value) {
                              viewController.setView(INFO);
                              viewController.setInfoMessage(
                                  'You are already logged in to an account,Kindly log out that account,So that you can able to Register a new account.');
                            } else {
                              getLocation();

                              viewController.setView(MOBILENUMBER);
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: GestureDetector(
                          onTap: () {
                            toggleShop();
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: isShopOpen
                                      ? optionsController.arrowup
                                      : optionsController.arrowdown),
                              SizedBox(
                               
                                width: 10,
                              ),
                            
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.shops,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Shop',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isShopOpen) ...[
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.neworder,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'New Order',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            shopController.fetchCouponHead();
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.pendingorder,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Pending Order',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)
                                    ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            orderController.fetchmyPendingOutlet(
                                languageController.languagenum.toString());
                            headerController.setSubHeaderLabel(
                                languageController
                                        .languageResponse.value.pendingOrders ??
                                    '');
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.oldorder,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Old Order',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            orderController.fetchmyOrders(
                                languageController.languagenum.toString());
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.shoppinglist,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Shopping List',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            viewController.setView(PRODUCTNEWPAGE);
                            viewController.setUserOption(CLIENT);
                            headerController.setSubHeaderLabel('Main Category');
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.wishlist,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Favourite List',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              orderController.fetchWhishList(
                                  languageController.languagenum.toString());
                            });

                            headerController.setSubHeaderLabel(
                                languageController
                                        .languageResponse.value.wishList ??
                                    '');
                          },
                        ),
                      ],
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: optionsController.addbook,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Address Book',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);

                          Prefs.superUserLoggedIn.then((value) {
                            if (value) {
                              configureController.fetchCustomerDeliveryAddress(
                                  languageController.languagenum.toString());
                              keyboardController.addProfile.value = true;
                              keyboardController.editProfile.value = false;
                              viewController.setView(CHANGEDELIVERYADDRESS);
                            } else {
                              viewController.setView(INFO);
                              viewController.setInfoMessage(
                                'Please login to view and update your Address',
                              );
                            }
                          });
                          print("ADDRESS BOOK...!");
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: optionsController.shopatstore,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              optionsController.outlet == '63'
                              ? 'Order @ Restaurant'
                              :'Shop @ Store',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          if( optionsController.outlet == '63'){
                            
                             viewController.setView(RESQRCODE);
                             headerController.setSubHeaderLabel('Scan QR code at the Table');
                           }
                          else{
                             configureController.fetchDetails(
                              languageController.languagenum.toString());
                               viewController.setView(INFO);
                            viewController.setInfoMessage(
                              'You can use the same App to shop at store and pay for the material without having to stand in Cashiers Queue. When you enter the shop the shop name will be automatically populated'
                              );

                          }
                         
                          Navigator.pop(context);

                         
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: GestureDetector(
                          onTap: () {
                            toggleUSettings();
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: isUSettingsOpen
                                      ? optionsController.arrowup
                                      : optionsController.arrowdown
                                      ),
                              SizedBox(
                               
                                width: 10,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.usrsetings,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'User Settings',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isUSettingsOpen) ...[
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.profile,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'User Profile',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            keyboardController.setEdit(false);

                            viewController.setView(CLIENTPROFILE);
                            keyboardController.setEdit(false);

                            keyboardController.setKeypad("");
                            print("USER PROFILE...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.password,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Change PIN',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            Prefs.superUserLoggedIn.then((value) {
                              if (value) {
                                viewController.setView(ClIENTCHANGEPASSWORD);
                                keyboardController.setEdit(false);

                                keyboardController.setKeypad(SYMBOLSKEYBOARD);
                                Prefs.superUserEmailId.then((value) => {
                                      Prefs.verticalId.then((vertical) {
                                        forggetController.sentOTP(
                                            value,
                                            'cp',
                                            languageController.languagenum
                                                .toString());
                                      })
                                    });
                              } else {
                                viewController.setView(ERROR);
                                viewController.setErrorMessage(
                                  languageController.languageResponse.value
                                          .profileError ??
                                      '',
                                );
                              }
                            });

                            print("CHANGE PIN...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.feedback,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Sys.Feed Back',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            viewController.setView(DEVICEFEEDBACK);

                            keyboardController.setKeypad("");
                            print("Sys.Feed Back...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.language,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Set Language',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            viewController.setView(LanguageSetter);

                            keyboardController.setKeypad("");

                            print("SET LANGUAGE...!");
                          },
                        ),
                      ],
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: GestureDetector(
                          onTap: () {
                            toggleSupport();
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: 30,
                                  width: 30,
                                  child: isSupportOpen
                                      ? optionsController.arrowup
                                      : optionsController.arrowdown),
                              SizedBox(
                               
                                width: 10,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.support,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Support',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isSupportOpen) ...[
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.exptvw,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Expert View',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            viewController.setView(EXPERTVIEWS);

                            keyboardController.setKeypad("");
                            keyboardController.setPicker('');
                            print("EXPERT VIEWS..!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.faq,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'FAQ',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            viewController.setView(FAQ);

                            keyboardController.setKeypad("");
                            keyboardController.setPicker('');
                            print("FAQ...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.resrcs,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Resources',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            viewController.setView(RESOURCES);
                            optionsController.hideShadow();
                            keyboardController.setKeypad("");
                            keyboardController.setPicker('');
                            print("RESOURCES...!");
                          },
                        ),
                      ],
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: optionsController.tandc,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);

                          viewController.setView(TERMSANDCONDITION);

                          keyboardController.setKeypad("");
                          keyboardController.setPicker('');
                          print("TERMS & CONDITION...!");
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: GestureDetector(
                          onTap: () {
                            toggleAddOns();
                            orderController.fetchShare();
                          },
                          child: Row(
                            children: [
                               Container(
                                  height: 30,
                                  width: 30,
                                  child: isAddOnsOpen
                                      ? optionsController.arrowup
                                      : optionsController.arrowdown),
                              SizedBox(
                               
                                width: 10,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.addon,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Add Ons',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isAddOnsOpen) ...[
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.subscription,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Subscription',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            orderController.fetchMySubscription(
                                languageController.languagenum.toString());
                            print("SUBSCRIPTION...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.family,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Add Family',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            viewController.setView(ADDFAMILYADDRESS);
                            print("ADD FAMILY...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.share,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Share',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Prefs.mobile.then((value) {
                              mobileNum = value;
                            });

                            viewController.setView(SHARE);
                            print("SHARE...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.coupons,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Coupons',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            viewController.setView(FUTURECOUPONPAGE);
                            print("COUPONS...!");
                          },
                        ),
                        SizedBox(
                          height: 9.75,
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              SizedBox(
                                width: 95,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: optionsController.calculator,
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Text(
                                'Calculator',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 98, 97, 97)),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);

                            viewController.setView(MATHCALCULATE);

                            print("CALCULATE...!");
                          },
                        ),
                      ],
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: optionsController.arexp,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'AR Experience',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          viewController.setView('');
                        
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: optionsController.mrktplce,
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Market Place',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          viewController.setView(MARKETPLACE);
                          print("MARKET PLACE..!");
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            
                            Container(
                              height: 50,
                              width: 50,
                              child: 
                            Prefs.superUserLoggedIn == true
                            ?  optionsController.logOut
                            : optionsController.logIn
                            ),
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 98, 97, 97)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);

                          Prefs.superUserLoggedIn.then((value) {
                            if (value) {
                              viewController.setView(CAUTION);

                              keyboardController.setEdit(false);
                            } else {
                              viewController.setView(CLIENTLOGIN);

                              keyboardController.setEdit(false);
                            }
                          });

                          keyboardController.setKeypad("");
                          print("Login / Logout....!");
                        },
                      ),
                      SizedBox(
                        height: 9.75,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  double radius = 37.4, tw = 20, th = 0.3;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, th + radius);
    path.arcToPoint(Offset(size.width - radius, th), clockwise: false);

    path.lineTo(radius, th);
    path.arcToPoint(Offset(0, 1), clockwise: false);
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
