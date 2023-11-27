import 'dart:convert';

import 'package:customer_assist/core/app_constants.dart';
import 'package:customer_assist/core/app_urls.dart';
import 'package:customer_assist/core/helpers/SharedPreference/prefs.dart';
import 'package:customer_assist/home/data/forgotpassword/super_user/models/reset_send_otp_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/barcode_scanner_model/barcode_scanner_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/company_offer/company_offer.dart';
import 'package:customer_assist/home/data/shopcoupon/models/sas_move_shopping_list_model/sas_move_shopping_list_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/sas_response_model/sas_response_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shop_coupon_model/shop_coupon_model.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/Res_Item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/RrestaurantItem.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/banner.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/product_item.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/resItem.dart';
import 'package:customer_assist/home/data/shopcoupon/models/shopping_products_model/shopping_products_model.dart';
import 'package:customer_assist/home/data/shopcoupon/repositories/shop_coupon_repository_impl.dart';
import 'package:customer_assist/home/presentation/controllers/header_controller.dart';
import 'package:customer_assist/home/presentation/controllers/language_controller.dart';
import 'package:customer_assist/home/presentation/controllers/loading_controller.dart';
import 'package:customer_assist/home/presentation/controllers/options_controller.dart';
import 'package:customer_assist/home/presentation/controllers/view_controller.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/shoppinglist.dart';
import 'package:customer_assist/home/presentation/widgets/stackwidgets/store/free_flow_shopping.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/failures.dart';
import '../../data/shopcoupon/models/addons.dart/additem.dart';
import '../../data/shopcoupon/models/addons.dart/addonmodel.dart';
import '../../data/shopcoupon/models/coupon_company/coupon_company.dart';
import '../../data/shopcoupon/models/sas_move_shopping_list_model/move_shop_list_model.dart';
import '../../data/shopcoupon/models/shopping_list_data_model/item.dart';
import '../../data/shopcoupon/models/shopping_list_data_model/shopping_list_data_model.dart';
import '../../data/shopcoupon/models/shopping_outlet_model/shopping_outlet_model.dart';
import '../../data/shopcoupon/models/shopping_outlet_model/store_detail.dart';
import '../../data/shopcoupon/models/shopping_products_model/item.dart';
import '../../data/shopcoupon/models/shopping_products_model/sub_category_items.dart';
import '../widgets/stackwidgets/store/shopping_list_page.dart';

class ShopController extends GetxController {
  LoadingController loadingController = Get.find();
  ViewController viewController = Get.find();
  HeaderController headerController = Get.find();
  OptionsController optionsController = Get.find();
  // var addCartReviewController = Get.put(AddCartReviewController());
  List productitem = <SubCategoryItems>[].obs;
  var productdisplay = <SubCategoryItems>[].obs;
  var productview = <SubCategoryItems>[].obs;
  List categoryname = <RestaurantItem>[].obs;
  var languageController = Get.put(LanguageController());
  var shoppingResponse = const ShopCouponModel().obs;
  var companyCouponResponse = const CouponCompany().obs;
  var shoppingListResponse = <ItemModel>[].obs;
  var shoppingOutletResponse = <StoreDetailModel>[].obs;
  var editshop = <Map<String, String>>[].obs;
  var selectedList = [].obs;
  var catalogueListResponse = <cataloguefetch>[].obs;
  var shoppinglistResponse = <cataloguefetchdetails>[].obs;
  var flowShopping = <cataloguedetails>[].obs;
  var productweight = <cataloguedetails>[].obs;
  var catalogueResponse = <cataloguefetch>[].obs;
  //var catalogueFilterResponse = <StoreDetailModel>[].obs;
  var companyOffer = const CompanyOffer().obs;
  var catagory = <Item>[].obs;
  var allcatagory = <Item>[].obs;
  var barcodeScannerResponse = SubCategoryItems().obs;
  var shopByListResponse = <MoveShopListModel>[].obs;
  List promoList = [].obs;
  var catagoryIndex = 0.obs;
  //var catagoryname = [].obs;
  var catagoryPageIndex = 0.obs;
  var subcatagoryPageIndex = 0.obs;
  var itemIndex = 0.obs;
  var reviewPage = false.obs;
  var image = false.obs;
  var outletpicker = <OutLetfetch>[].obs;
  List shoppingOutlets = [].obs;
  var resitem = <ResItem>[].obs;
  //var categoryname =<>[].obs;
  var advertisement = <Banners>[].obs;
  var vedio = ''.obs;
  var url = ''.obs;
  var timeswapper = ''.obs;
  var allcategory = <ResItem>[].obs;
  var supercatagoryIndex = 0.obs;
  var subcatagoryIndex = 0.obs;
  var headername = ''.obs;

  var addOns = <AddOns>[].obs;
  //var productview = ''.obs;
  var checklist;

  setCatagoryIndex(int index) {
    print('SetCategory $index');
    catagoryIndex.value = index;
  }

  setSubCatagoryIndex(int index) {
    print('SetCategory $index');
    subcatagoryIndex.value = index;
  }

  setsupercatagoryIndex(int index) {
    print('SetCategory $index');
    supercatagoryIndex.value = index;
  }

  setReviewPage(bool review) {
    reviewPage.value = review;
  }

  setCatagoryPageIndex(int index) {
    catagoryPageIndex.value = index;
  }

  setSubCatagoryPageIndex(int index) {
    subcatagoryPageIndex.value = index;
  }

  setItemIndex(int index) {
    itemIndex.value = index;
  }

  setImage() {
    image.value = true;
  }

  void fetchCouponHead() async {
    loadingController.setLoading(true);

    Either<Failure, ShopCouponModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().fetchAdvertisercouponhead();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessState(failureOrSuccessMessage);
  }

  void fetchCouponValues(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, CouponCompany> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().fetchCompanyCoupon(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateCompany(failureOrSuccessMessage);
  }

  void fetchCompanyCustomerOffer(List promo, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, CompanyOffer> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl()
            .fetchCompanyCustomerOffer(promo, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateCompanyOffer(failureOrSuccessMessage);
  }

  void updateCustomerCoupon(List coupon, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl()
            .updateCustomerCoupon(coupon, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateUpdateCustomer(failureOrSuccessMessage);
  }

  void downloadShoppingProduct(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ShoppingProductsModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().downloadShoppingProduct(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShoppingProduct(failureOrSuccessMessage);
  }

  void downloadRestaurantProduct(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, RestaurantProductsModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().downloadResProduct(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateResProduct(failureOrSuccessMessage);
  }

  void downloadProductItem(String search) async {
    loadingController.setLoading(true);

    Either<Failure, ProductItem> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().downloadProductItem(search);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateProductItem(failureOrSuccessMessage);
  }

  void fetchAddOns(String productcode, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, AddOnsModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().addOnsItem(productcode, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateAddonitem(failureOrSuccessMessage);
  }

  void fetchCatalogueProduct(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ShoppingProductsModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().fetchCatalogueProduct(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShoppingList(failureOrSuccessMessage);
  }

//ShoppingList Update
  void shoppingUpdate(List items, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().shoppingUpdate(items, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateShoppingUpdate(failureOrSuccessMessage);
  }

  //Fetch ShoppingList

  void fetchShoppingList(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ShoppingListDataModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().fetchShoppingList(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStatefetchShop(failureOrSuccessMessage);
  }

  void fetchShoppingOutlets(List item, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ShoppingOutletModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().fetchShoppingOutlets(item, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateshopOutlet(failureOrSuccessMessage);
  }

//Shop at Store Move Shopping List Cart

  void sasMoveShoppingListtoCart(String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, SasMoveShoppingListModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().sasMoveShoppingListtoCart(languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateshopListToCart(failureOrSuccessMessage);
  }

  void fetchBarcodeScan(String item, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, BarcodeScannerModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().fetchBarcodeScan(item, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateBarcodeScan(failureOrSuccessMessage);
  }

  void updateShopAtStore(List item, String languageId) async {
    loadingController.setLoading(true);

    Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().updateShopAtStore(item, languageId);
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateBarcodeScanUpdate(failureOrSuccessMessage);
  }

  void shopAtStoreInitiate(String item) async {
    loadingController.setLoading(true);

    Either<Failure, SasResponseModel> failureOrSuccessMessage =
        await ShopCouponRepositoryImpl().shopAtStoreInitiate();
    loadingController.setLoading(false);

    _eitherErrorOrSuccessStateStoreInitiate(failureOrSuccessMessage, item);
  }

  void _eitherErrorOrSuccessState(
    Either<Failure, ShopCouponModel> failureOrSuccessMessage,
  ) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          shoppingResponse.value = r;
          viewController.setView(COUPONPAGE);
          headerController.subHeaderLabel(COUPONPAGE);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateCompany(
      Either<Failure, CouponCompany> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          companyCouponResponse.value = r;
          viewController.setView(PROMOTIONS);
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.promotions ?? '');
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateCompanyOffer(
      Either<Failure, CompanyOffer> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          companyOffer.value = r;
          viewController.setView(PROMOTIONSSCRATCHPAGE);
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.promotions ?? '');
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateUpdateCustomer(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.result == 1) {
          // ReuseCode//
          // optionsController.setOptionList(NEWORDERCHANGE);
          // viewController.setView('');
          // companyOffer.value = r;
          // viewController.setView(PROMOTIONSSCRATCHPAGE);
          // headerController.setSubHeaderLabel(PROMOTIONS);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateShoppingProduct(
      Either<Failure, ShoppingProductsModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          catagory.value = r.status!.items!;
          print(catagory.value);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateAddonitem(
      Either<Failure, AddOnsModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          addOns.value = r.status!.aDDON!;
          print("------------------>$addOns.value");
          viewController.setView(ADDONS);
          //showSimpleDialog();
        } else {
          // viewController.setView(ERROR);
          // viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateResProduct(
      Either<Failure, RestaurantProductsModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          resitem.value = r.status!.items!;
          advertisement.value = r.status!.banner;
          print(advertisement.value);
          print(resitem.value);
          Prefs.setSuperUserShopId(true);
          // if (viewController.viewKey.value == RESQRCODE) {
          //   viewController.setView('Shopselectioncond');
          // }
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  // void _eitherErrorOrSuccessStateResProduct(
  //     Either<Failure, RestaurantProductsModel> failureOrSuccessMessage) {
  //   failureOrSuccessMessage.fold(
  //     (l) {},
  //     (r) async {
  //       if (r.status!.result == 1) {
  //         resitem.value = r.status!.items!;
  //         print(resitem.value);
  //       } else {
  //         viewController.setView(ERROR);
  //         viewController.setErrorMessage(r.status!.message!);
  //       }
  //     },
  //   );
  // }

  void _eitherErrorOrSuccessStateShoppingList(
      Either<Failure, ShoppingProductsModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          allcatagory.value = r.status!.items!;
          update();

          viewController.setView(LISTSHOPPING);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  // void _eitherErrorOrSuccessStateShoppingList(
  //     Either<Failure, ShoppingProductsModel> failureOrSuccessMessage) {
  //   failureOrSuccessMessage.fold(
  //     (l) {},
  //     (r) async {
  //       if (r.status!.result == 1) {
  //         Stopwatch stopwatch = new Stopwatch()..start();

  //         allcatagory.value = r.status!.items!;
  //         update();
  //         print('doSomething() executed in ${stopwatch.elapsed}');
  //         print(allcatagory.value);
  //       } else {
  //         viewController.setView(ERROR);
  //         viewController.setErrorMessage(r.status!.message!);
  //       }
  //     },
  //   );
  // }

  void _eitherErrorOrSuccessStateShoppingUpdate(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.result == 1) {
        } else {
          viewController.setErrorMessage(r.message!);
          viewController.setView(ERROR);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStatefetchShop(
      Either<Failure, ShoppingListDataModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          shoppingListResponse.value = r.status!.items!;
          viewController.setSubUserOption(SHOPPINGLIST);
          viewController.setView(WHISHLIST);
        } else {
          viewController.setErrorMessage(r.status!.message!);
          viewController.setView(ERROR);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateProductItem(
      Either<Failure, ProductItem> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        productitem = r.items!;
        // productdisplay = r.items!;
        //productview = r.items!;
        print(productitem);
      },
    );
  }

  void _eitherErrorOrSuccessStateshopOutlet(
      Either<Failure, ShoppingOutletModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          shoppingOutletResponse.value = r.status!.stores!.storeDetails!;
          print(viewController.viewKey.value);
          if (!(viewController.viewKey.value == SHOPFILTER)) {
            viewController.setView(SHOPOUTLETPAGE);
            headerController.setSubHeaderLabel(
                languageController.languageResponse.value.selectShop ?? '');
          }
        } else {
          viewController.setErrorMessage(r.status!.message!);
          viewController.setView(ERROR);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateBarcodeScan(
      Either<Failure, BarcodeScannerModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          barcodeScannerResponse.value = r.status!.items!;
          setImage();
          // addCartReviewController.addToCartReview(r.status!.items!);
          viewController.setUserOption(SHOPATSTORE);
          updateShopAtStore([
            {
              "PRODUCT_CODE": r.status!.items!.productCode,
              "PRODUCT_QUANTITY": "1"
            }
          ], languageController.languagenum.toString());
          // viewController.setView(COUPONPAGE);
          // headerController.subHeaderLabel(COUPONPAGE);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateshopListToCart(
      Either<Failure, SasMoveShoppingListModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          viewController.setView(SHOPBYLIST);
          headerController.setSubHeaderLabel(
              languageController.languageResponse.value.shopByList ?? '');
          shopByListResponse.value = r.status!.items![0].items!;
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateBarcodeScanUpdate(
      Either<Failure, ResetPasswordOTPModel> failureOrSuccessMessage) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.result == 1) {
          // barcodeScannerResponse.value = r!;
          // setImage();
          // addCartReviewController.addToCartReview(r.status!.items!);
          // viewController.setUserOption(SHOPATSTORE);
          // viewController.setView(COUPONPAGE);
          // headerController.subHeaderLabel(COUPONPAGE);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.message!);
        }
      },
    );
  }

  void _eitherErrorOrSuccessStateStoreInitiate(
      Either<Failure, SasResponseModel> failureOrSuccessMessage,
      String itemCode) {
    failureOrSuccessMessage.fold(
      (l) {},
      (r) async {
        if (r.status!.result == 1) {
          Prefs.setShopReference(r.status!.shopreferenceid!);
          fetchBarcodeScan(itemCode, languageController.languagenum.toString());
          // barcodeScannerResponse.value = r!;
          // setImage();
          // addCartReviewController.addToCartReview(r.status!.items!);
          // viewController.setUserOption(SHOPATSTORE);
          // viewController.setView(COUPONPAGE);
          // headerController.subHeaderLabel(COUPONPAGE);
        } else {
          viewController.setView(ERROR);
          viewController.setErrorMessage(r.status!.message!);
        }
      },
    );
  }

  getData() async {
    String jsonRequestBody;
    if (optionsController.optionsKey.value == GUEST) {
      jsonRequestBody = '{"CUSTOMER_ID":"0"}';
    } else {
      jsonRequestBody = '{"CUSTOMER_ID":"${await Prefs.customerID}"}';
    }

    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": CLIENTTOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };

    final response = await http.post(
      Uri.parse(FETCHRESTAURANTTYPE),
      headers: headers,
      body: jsonRequestBody,
    );
    print('RESTAURANT_TYPErequest$jsonRequestBody');
    print('RESTAURANT_TYPEresponse${response.body}');
    var jsonData = jsonDecode(response.body);
    print(jsonData['status']['Result']);
    if (jsonData['status']['Result'] == 1) {
      outletpicker.value =
          (jsonData['status']['RESTAURANT_TYPE'] as List<dynamic>)
              .map((d) => OutLetfetch.fromJson(d))
              .toList();
      update();
    } else {}
    print(outletpicker.length);
  }
}

class OutLetfetch {
  String? val;
  String? id;

  OutLetfetch({this.val, this.id});

  factory OutLetfetch.fromJson(Map<String, dynamic> json) {
    return OutLetfetch(
      val: json['val'],
      id: json['Id'],
    );
  }
}
