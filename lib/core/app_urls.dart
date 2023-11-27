// ignore_for_file: constant_identifier_names

//const String BASE_URL = "https://www.retailecoss.com/retailecosmerchant/api";
const String BASE_URL =
    "https://www.retailresonance.com/retailresonancemerchantv2/api";
const String CLIENT_URL =
    "https://www.retailresonance.com/retailresonancev2/api";

const CustomerDelete = "$BASE_URL/CustomerDelete";
const String FETCHCITY = '$CLIENT_URL/fetchcity';
const String FETCHAREA = '$CLIENT_URL/fetcharea';

const String RS_BASE64IMAGE = '$CLIENT_URL/fetchImage';
const APICURRENCYCONVERTER = "$CLIENT_URL/ApiCurrencyConverter";
const BROWSEMETHODPICKER = "$CLIENT_URL/FetchBrowsePicker";

//fetch Splash//
const FETCHSPLASH =
    "https://www.retailresonance.com/retailresonancev2/api/fetchSplash";
const FETCHSPLASHINIT =
    "https://www.retailresonance.com/retailresonancev2/api/fetchSplashInit";

//Fetch Country Details//
const FETCH_COUNTRY_DETAILS = "$BASE_URL/fetchCountryDetails";
const FETCH_COUNTRY_NAME = "$CLIENT_URL/fetchcountrynamewithtimezone";
const FETCH_ZIP_CODE = "$CLIENT_URL/FetchzipcodeDetails";

const FETCH_PHYSICAL_STOCK = "$BASE_URL/fetchPhysicalStock";

//getMobile Number//
const String NEWDEVICECHECK = '$CLIENT_URL/NewDeviceCheck';
const String NEWDEVICESMSVERIFY = '$CLIENT_URL/NewDeviceSmsVerify';

//OWNERDATA//
//FETCH
const String OWNERDATA = '$CLIENT_URL/FetchDeviceAddress';
//UPDATE
const String UPDATEDEVICEADDRESS = '$CLIENT_URL/UpdateDeviceAddress';

// UserLogin//
const String POSLoginAPI = '$CLIENT_URL/DeviceLoginAPI'; //signup APi

const String USER_DETAILS = '$BASE_URL/USER_DETAILS';
const String FETCH_PROFILEDETAILS_URL = '$CLIENT_URL/FetchCustomerProfile';

//Forget PAssword//
const String DeviceForgetPassword = '$CLIENT_URL/DeviceForgetPassword';

//Forget PAssword Update//

const String DeviceForgetPasswordUpdate =
    '$CLIENT_URL/DeviceForgetPasswordUpdate';

//Super UserProfile Update//
const String UPDATE_PROFILEDETAILS_URL = '$CLIENT_URL/UpdateCustomerProfile';

// PROFILE PIC//
const String UPDATE_EMPLOYEE_PROFILEPICTURE_URL =
    '$CLIENT_URL/UpdateProfilePic';

// const OTPSEND_URL = "$BASE_URL/ChangePasswordOTPSend";
// const OTPVERIFY_URL = "$BASE_URL/ChangePasswordOTPVerify";
// const PASSWORDUPDATE_URL = "$BASE_URL/ResetPasswordUpdate";

//SUPERUSERCHANGEPASSWORD//
const CHANGEOTPSEND_URL = "$CLIENT_URL/ChangePasswordOTPSend";
const CHANGEOTPVERIFY_URL = "$CLIENT_URL/ChangePasswordOTPVerify";
const CHANGEPASSWORDUPDATE_URL = "$CLIENT_URL/ChangePasswordUpdate";

//OTHER USER CHANGEPASSWORD//

const OTHERCHANGEOTPSEND_URL = "$BASE_URL/EmployeeChangePasswordOTPSend";
const OTHERCHANGEOTPVERIFY_URL = "$BASE_URL/EmployeeChangePasswordOTPVerify";
const OTHERCHANGEPASSWORDUPDATE_URL = "$BASE_URL/EmployeeChangePasswordUpdate";

const POSUSER_PASSWORD_OTPVERIFY = "$BASE_URL/EmployeeResetPasswordOTPVerify";
const POSUSER_PASSWORD_OTPSEND = "$BASE_URL/EmployeeResetPasswordOTPSend";
const POSUSER_PASSWORD_UPDATE = "$BASE_URL/EmployeeResetPasswordUpdate";

//First Time User Manager//

const MANAGER_MAIL_CHECK = "$CLIENT_URL/NewCustomerEmailCheck";
const MANAGER_OTP_VERIFY = "$CLIENT_URL/EmailOtpVerify";
const MANAGER_POS_USER_DETAILS = "$CLIENT_URL/DeviceRegisteration";

//PosMasterSelectionApi //
const POSMASTERSELECTIONAPI = "$BASE_URL/PosMasterSelectionApi";
// const MASTERSELECTIONAPI = "$CLIENT_URL/MasterSelectionApi";
const FETCHRESTAURANTTYPE = "$CLIENT_URL/FetchRestaurantType";
//Setting configureApi //
const FETCHREVIEWSETTINGS = "$CLIENT_URL/FetchReviewSettings";

//Change the Shopping Mode//
const SHOPPINGMODE = "$CLIENT_URL/UpdateMenu";
//Fetch Add-Ons
const FETCHADDONS = "$CLIENT_URL/fetchAddon";
//Fetch modifier

const FETCHMODIFIER = "$CLIENT_URL/fetchModifier";

//Customer Delivery Address//
const CUSTOMERDELIVERYADDRESS = "$CLIENT_URL/FetchCustomerDeliveryAddress";

//Update Customer Delivery Address//
const UPDATEDELIVERYADDRESS = "$CLIENT_URL/UpdateCustomerDeliveryAddress";

//Fetch Shop//
const FETCHSHOPTYPE = "$CLIENT_URL/FetchShopType";

//Letme Shop//
const LETMESHOP = "$CLIENT_URL/LetmeShop";
const LETMESHOPGUEST = "$CLIENT_URL/LetmeShopGuest";
//Get Item by Order Id Api //
const FETCH_MYORDER_item = "$CLIENT_URL/fetchmyorderitems";

//Vertical//
const VERTICAL = "$CLIENT_URL/fetchVertical";

//Vertical//
const UPDATEVERTICAL = "$CLIENT_URL/UpdateVertical";
const UPDATEMYSHOPS = "$CLIENT_URL/UpdateMyShops";

//Delivery Time
const DELIVERYTIME = "$CLIENT_URL/FetchDeliveryslot";

// Update Delivery Time
const UPDATEPREFERRER = "$CLIENT_URL/UpdatePerferrerTime";

//Shop Module//

// Advertiser Coupon
const ADVERTISERCOUPON = "$CLIENT_URL/fetchAdvertisercouponhead";

// fetch Company Coupon
const FETCHCOMPANYCOUPON = "$CLIENT_URL/fetchcompanycoupon";
const PRODUCTITEM = "$CLIENT_URL/fetchProductListItemsSer";
//fetch CompanyCustomer Offer
const FETCHCOMPANYCUSTOMEROFFER = "$CLIENT_URL/fetchcompanycustomeroffer";

//Update CompanyCustomer Offer
const UPDATECUSTOMERCOUPON = "$CLIENT_URL/updatecustomercoupon";

//Fetch Customer Coupon
const FETCHCUSTOMERCOUPONS = "$CLIENT_URL/fetchcustomercoupons";
const FETCH_LANGUAGE = "$BASE_URL/fetchlanguagearbfiledata";
const FETCH_CAT_SUB_BRAND_FILTER = "$CLIENT_URL/fetchcatsubcatusingbrandfilter";
const FETCH_BRAND_FILTER = "$CLIENT_URL/fetchbrandfilter";
const FETCH_PRODUCT_ALL = "$CLIENT_URL/fetchProductListALLSer";
//Fetch Shop Product
const SHOPPRODUCT = "$CLIENT_URL/downloadshopproducts";
const RESPRODUCT = "$CLIENT_URL/downloadshopproductsrestaruant";

//Add Tips
const FETCH_CART_ADD_CHARGE = "$CLIENT_URL/fetchCartAddCharge";

//Add Tips
const FETCH_UPDATE_PRODUCT_DETAILS = "$CLIENT_URL/fetchUpdatedProductDetails";

//Shopping List
const SHOPPINGLISTUPDATE = "$CLIENT_URL/shopinglistUpdate";
const FETCHSHOPPINGLIST = "$CLIENT_URL/fetchshoppinglist";
const MOVESHOPPINGLISTTOCART = "$CLIENT_URL/MoveShoppingListtoCart";

//PENDING ORDERS
const FETCH_PENDINGORDERS = "$CLIENT_URL/fetchpendingorder";
const FETCH_PENDINGUPDATE = "$CLIENT_URL/updatependingorders";
//FetchPendingOutlets

const FETCH_PENDINOUTLET = "$CLIENT_URL/fetchpendingoutlets";
// fetchShoppingOutlets
const FETCH_SHOPPING_OUTLET = "$CLIENT_URL/fetchShoppingOutlets";

//WHISHLIST
const FETCH_WHISLIST = "$CLIENT_URL/fetchWishList";

//fetchCatalogueProduct
const FETCH_CATALOGUE_PRODUCT = "$CLIENT_URL/fetchCatalogueProduct";

//OLD ORDER
const FETCH_MYORDER = "$CLIENT_URL/fetchMyorders";

//UPDATE WHISHLIST
const UPDATE_WHISHLIST = "$CLIENT_URL/wishListUpdate";

//SHOPATSTOREINITIATE
const SHOPATSTOREINITIATE = "$CLIENT_URL/ShopAtStoreInitiate";
//SASBarcodeScan
const SASBARCODESCAN = "$CLIENT_URL/SASBarcodeScan";
//updateShopAtStore
const UPDATESHOPATSTORE = "$CLIENT_URL/updateShopAtStore";

// loyalty details
const FETCH_LOYALTY = "$CLIENT_URL/fetchLoyalty";

// update loyalty
const UPDATE_LOYALTY = "$CLIENT_URL/updateLoyalty";

// SASMoveShoppingListtoCart
const SASMOVESHOPPINGLISTTOCART = "$CLIENT_URL/SASMoveShoppingListtoCart";

//fetchStoreReview
const FETCHSTOREREVIEW = "$CLIENT_URL/fetchStoreReview";

//UpdateCustomerReviewStore
const UPDATECUSTOMERREVIEWSTORE = "$CLIENT_URL/UpdateCustomerReviewStore";

//fetchProductReview
const FETCHPRODUCTREVIEW = "$CLIENT_URL/fetchProductReview";

//UpdateProductReview
const UPDATEPRODUCTREVIEW = "$CLIENT_URL/UpdateProductReview";
//FamilyMemberRegistration
const ADDFAMILY = "$CLIENT_URL/FamilyMemberRegistration";
//Share App
const FETCHSHAREAPP = "$CLIENT_URL/fetchshareApp";
//updateshareappdetails
const SHAREAPPDETAILS = "$CLIENT_URL/updateshareappdetails";
//fetchmessagecount
const MESSAGECOUNT = "$CLIENT_URL/fetchmessagecount";
//subscription -fetch
const FETCHMYSUBSCRIPTION = "$CLIENT_URL/fetchmySubscription";
//subscription -Update
const UPDATESUBSCRIPTION = "$CLIENT_URL/UpdateSubscription";

// fetchshareApp
//const FETCHSHAREAPP = "$CLIENT_URL/fetchshareApp";
// Insert Order
const ORDERINSERTNEW = "$CLIENT_URL/OrderInsertNew";
const CHATTYQUSANS = "$CLIENT_URL/fetchQuestion";
