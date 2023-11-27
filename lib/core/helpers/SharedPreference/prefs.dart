
import 'const.dart';
import 'preference_helper.dart';

class Prefs {
  static Future<String> get udid => PreferencesHelper.getString(Const.UDID);

  static Future setPhoneCode(String value) =>
      PreferencesHelper.setString(Const.PHONE_CODE, value);

  static Future<String> get phoneCode =>
      PreferencesHelper.getString(Const.PHONE_CODE);
  static Future setCustomerId(String value) =>
      PreferencesHelper.setString(Const.CUSTOMERID, value);

  static Future<String> get customerID =>
      PreferencesHelper.getString(Const.CUSTOMERID);

  static Future<bool> get firstTimeSplash =>
      PreferencesHelper.getBool(Const.SKIP);

  static Future setFirstTimeSplash(bool value) =>
      PreferencesHelper.setBool(Const.SKIP, value);

  static Future<bool> get checkLogin =>
      PreferencesHelper.getBool(Const.LOGINCHECK);

  static Future setcheckLogin(bool value) =>
      PreferencesHelper.setBool(Const.LOGINCHECK, value);

  static Future<bool> get skipOnce => PreferencesHelper.getBool(Const.SKIPONCE);

  static Future setSkipOnce(bool value) =>
      PreferencesHelper.setBool(Const.SKIPONCE, value);

  static Future<bool> get skipAlways =>
      PreferencesHelper.getBool(Const.SKIPALWAYS);

  static Future setSkipAlways(bool value) =>
      PreferencesHelper.setBool(Const.SKIPALWAYS, value);

  static Future setUdid(String value) =>
      PreferencesHelper.setString(Const.UDID, value);

  static Future<String> get verticalId =>
      PreferencesHelper.getString(Const.VERTICAL_ID);

  static Future setverticalId(String value) =>
      PreferencesHelper.setString(Const.VERTICAL_ID, value);

  static Future<int> get shopReference =>
      PreferencesHelper.getInt(Const.SHOPREFERENCEID);

  static Future setShopReference(int value) =>
      PreferencesHelper.setInt(Const.SHOPREFERENCEID, value);

  static Future<String> get businessID =>
      PreferencesHelper.getString(Const.BUSINESS_ID);

  static Future setBusinessID(String value) =>
      PreferencesHelper.setString(Const.BUSINESS_ID, value);
  static Future<String> get storeID =>
      PreferencesHelper.getString(Const.STORE_ID);

  static Future setStoreID(String value) =>
      PreferencesHelper.setString(Const.STORE_ID, value);

  static Future<String> get token => PreferencesHelper.getString(Const.TOKEN);

  static Future setToken(String value) =>
      PreferencesHelper.setString(Const.TOKEN, value);

  static Future<String> get shopId =>
      PreferencesHelper.getString(Const.SHOP_ID);

  static Future setShopId(String value) =>
      PreferencesHelper.setString(Const.SHOP_ID, value);

  static Future<bool> get superUserLoggedIn =>
      PreferencesHelper.getBool(Const.MANGER);

  static Future setSuperUserLoggedIn(bool value) =>
      PreferencesHelper.setBool(Const.MANGER, value);

       static Future<bool> get superUserShopid =>
      PreferencesHelper.getBool(Const.SHOPPING);

  static Future setSuperUserShopId(bool value) =>
      PreferencesHelper.setBool(Const.SHOPPING, value);

  static Future<bool> get merchantLoggedIn =>
      PreferencesHelper.getBool(Const.SUPERUSER_LOGGED_IN);

  static Future setMerchnatLoggedIn(bool value) =>
      PreferencesHelper.setBool(Const.SUPERUSER_LOGGED_IN, value);

  static Future<bool> get operatorLoggedIn =>
      PreferencesHelper.getBool(Const.OPERATOR_LOGGED_IN);

  static Future setOperatorLoggedIn(bool value) =>
      PreferencesHelper.setBool(Const.OPERATOR_LOGGED_IN, value);

  static Future<bool> get delagentLoggedIn =>
      PreferencesHelper.getBool(Const.STEWARD_LOGGED_IN);

  static Future setDelagentLoggedIn(bool value) =>
      PreferencesHelper.setBool(Const.STEWARD_LOGGED_IN, value);

  static Future<bool> get auditorLoggedIn =>
      PreferencesHelper.getBool(Const.AUDITOR_LOGGED_IN);

  static Future setAuditorLoggedIn(bool value) =>
      PreferencesHelper.setBool(Const.AUDITOR_LOGGED_IN, value);

  static Future<bool> get authenticated =>
      PreferencesHelper.getBool(Const.AUTHENTICATED);

  static Future setAuthenticated(bool value) =>
      PreferencesHelper.setBool(Const.AUTHENTICATED, value);

  static Future<bool> get downloadedAssets =>
      PreferencesHelper.getBool(Const.DOWNLOADED_ASSETS);

  static Future setDownloadedAssets(bool value) =>
      PreferencesHelper.setBool(Const.DOWNLOADED_ASSETS, value);

  static Future<String> get superUserEmailId =>
      PreferencesHelper.getString(Const.SUPERUSER_EMAIL_ID);

  static Future setSuperUserEmailId(String value) =>
      PreferencesHelper.setString(Const.SUPERUSER_EMAIL_ID, value);

  static Future<String> get superUserPassword =>
      PreferencesHelper.getString(Const.SUPERUSER_PASSWORD);

  static Future setSuperUserPassword(String value) =>
      PreferencesHelper.setString(Const.SUPERUSER_PASSWORD, value);

  static Future<String> get operatorEmailId =>
      PreferencesHelper.getString(Const.OPERATOR_EMAIL_ID);

  static Future setOperatorEmailId(String value) =>
      PreferencesHelper.setString(Const.OPERATOR_EMAIL_ID, value);

  static Future<String> get operatorPassword =>
      PreferencesHelper.getString(Const.OPERATOR_PASSWORD);

  static Future setOperatorPassword(String value) =>
      PreferencesHelper.setString(Const.OPERATOR_PASSWORD, value);

  static Future<String> get delagentEmailId =>
      PreferencesHelper.getString(Const.STEWARD_EMAIL_ID);

  static Future setDelagentEmailId(String value) =>
      PreferencesHelper.setString(Const.STEWARD_EMAIL_ID, value);

  static Future<String> get delagentPassword =>
      PreferencesHelper.getString(Const.STEWARD_PASSWORD);

  static Future setDelagentPassword(String value) =>
      PreferencesHelper.setString(Const.STEWARD_PASSWORD, value);

  static Future<String> get auditorEmailId =>
      PreferencesHelper.getString(Const.AUDITOR_EMAIL_ID);

  static Future setAuditorEmailId(String value) =>
      PreferencesHelper.setString(Const.AUDITOR_EMAIL_ID, value);

  static Future<String> get auditorPassword =>
      PreferencesHelper.getString(Const.AUDITOR_PASSWORD);

  static Future setAuditorPassword(String value) =>
      PreferencesHelper.setString(Const.AUDITOR_PASSWORD, value);

  //Super User profile

  static Future<String> get superUserSalutations =>
      PreferencesHelper.getString(Const.SALUTATIONS);

  static Future setSuperUserSalutations(String value) =>
      PreferencesHelper.setString(Const.SALUTATIONS, value);

  static Future<String> get superUserCountry =>
      PreferencesHelper.getString(Const.COUNTRY);

  static Future setCountry(String value) =>
      PreferencesHelper.setString(Const.COUNTRY, value);

  static Future<String> get country =>
      PreferencesHelper.getString(Const.COUNTRY);

  static Future setLatitude(double value) =>
      PreferencesHelper.setDouble(Const.LATITUDE, value);

  static Future<double> get originalLatitute =>
      PreferencesHelper.getDouble(Const.LATITUDE);

  static Future setLongitude(double value) =>
      PreferencesHelper.setDouble(Const.LONGITUDE, value);

  static Future<double> get orginalLongitude =>
      PreferencesHelper.getDouble(Const.LONGITUDE);

  static Future setTempCountry(String value) =>
      PreferencesHelper.setString(Const.TEMPCOUNTRY, value);

  static Future<String> get tempCountry =>
      PreferencesHelper.getString(Const.TEMPCOUNTRY);

  static Future<String> get superUserCity =>
      PreferencesHelper.getString(Const.CITY);

  static Future setUserCity(String value) =>
      PreferencesHelper.setString(Const.CITY, value);

  static Future<String> get superUserDob =>
      PreferencesHelper.getString(Const.DOB);

  static Future setSuperUserDob(String value) =>
      PreferencesHelper.setString(Const.DOB, value);

  static Future<String> get superUserFirstName =>
      PreferencesHelper.getString(Const.FIRST_NAME);

  static Future<String> get superUserLastName =>
      PreferencesHelper.getString(Const.LAST_NAME);

  static Future setSuperUserFirstName(String value) =>
      PreferencesHelper.setString(Const.FIRST_NAME, value);

  static Future setSuperUserLastName(String value) =>
      PreferencesHelper.setString(Const.LAST_NAME, value);

  static Future<String> get superUserProfileEmailId =>
      PreferencesHelper.getString(Const.PROFILE_EMAIL_ID);

  static Future setSuperUserProfileEmailId(String value) =>
      PreferencesHelper.setString(Const.PROFILE_EMAIL_ID, value);

  static Future<String> get userState =>
      PreferencesHelper.getString(Const.STATE);

  static Future setUserState(String value) =>
      PreferencesHelper.setString(Const.STATE, value);

  //Operator profile

  static Future<String> get operatorSalutations =>
      PreferencesHelper.getString(Const.SALUTATIONS);

  static Future setOperatorSalutations(String value) =>
      PreferencesHelper.setString(Const.SALUTATIONS, value);

  static Future<String> get operatorCountry =>
      PreferencesHelper.getString(Const.COUNTRY);

  static Future setOperatorCountry(String value) =>
      PreferencesHelper.setString(Const.COUNTRY, value);

  static Future<String> get operatorCity =>
      PreferencesHelper.getString(Const.CITY);

  static Future setOperatorCity(String value) =>
      PreferencesHelper.setString(Const.CITY, value);

  static Future<String> get operatorDob =>
      PreferencesHelper.getString(Const.DOB);

  static Future setOperatorDob(String value) =>
      PreferencesHelper.setString(Const.DOB, value);

  static Future<String> get operatorFirstName =>
      PreferencesHelper.getString(Const.FIRST_NAME);

  static Future setOperatorFirstName(String value) =>
      PreferencesHelper.setString(Const.FIRST_NAME, value);

  static Future<String> get operatorLastName =>
      PreferencesHelper.getString(Const.LAST_NAME);

  static Future setOperatorLastName(String value) =>
      PreferencesHelper.setString(Const.LAST_NAME, value);

  static Future<String> get operatorProfileEmailId =>
      PreferencesHelper.getString(Const.PROFILE_EMAIL_ID);

  static Future setOperatorProfileEmailId(String value) =>
      PreferencesHelper.setString(Const.PROFILE_EMAIL_ID, value);

  static Future<String> get operatorState =>
      PreferencesHelper.getString(Const.STATE);

  static Future setOperatorState(String value) =>
      PreferencesHelper.setString(Const.STATE, value);

  //steward profile

  static Future<String> get empID => PreferencesHelper.getString(Const.EMP_ID);

  static Future setEmpID(String value) =>
      PreferencesHelper.setString(Const.EMP_ID, value);

  static Future<String> get stewardSalutations =>
      PreferencesHelper.getString(Const.SALUTATIONS);

  static Future setStewardSalutations(String value) =>
      PreferencesHelper.setString(Const.SALUTATIONS, value);

  static Future<String> get stewardCountry =>
      PreferencesHelper.getString(Const.COUNTRY);

  static Future setStewardCountry(String value) =>
      PreferencesHelper.setString(Const.COUNTRY, value);

  static Future<String> get stewardCity =>
      PreferencesHelper.getString(Const.CITY);

  static Future setStewardCity(String value) =>
      PreferencesHelper.setString(Const.CITY, value);

  static Future<String> get stewardDob =>
      PreferencesHelper.getString(Const.DOB);

  static Future setStewardDob(String value) =>
      PreferencesHelper.setString(Const.DOB, value);

  static Future<String> get stewardFirstName =>
      PreferencesHelper.getString(Const.FIRST_NAME);

  static Future setStewardFirstName(String value) =>
      PreferencesHelper.setString(Const.FIRST_NAME, value);

  static Future<String> get stewardLastName =>
      PreferencesHelper.getString(Const.LAST_NAME);

  static Future setStewardLastName(String value) =>
      PreferencesHelper.setString(Const.LAST_NAME, value);

  static Future<String> get stewardProfileEmailId =>
      PreferencesHelper.getString(Const.PROFILE_EMAIL_ID);

  static Future setStewardProfileEmailId(String value) =>
      PreferencesHelper.setString(Const.PROFILE_EMAIL_ID, value);

  static Future<String> get stewardState =>
      PreferencesHelper.getString(Const.STATE);

  static Future setStewardState(String value) =>
      PreferencesHelper.setString(Const.STATE, value);

  //Auditor profile

  static Future<String> get auditorSalutations =>
      PreferencesHelper.getString(Const.SALUTATIONS);

  static Future setAuditorSalutations(String value) =>
      PreferencesHelper.setString(Const.SALUTATIONS, value);

  static Future<String> get auditorCountry =>
      PreferencesHelper.getString(Const.COUNTRY);

  static Future setAuditorCountry(String value) =>
      PreferencesHelper.setString(Const.COUNTRY, value);

  static Future<String> get auditorCity =>
      PreferencesHelper.getString(Const.CITY);

  static Future setAuditorCity(String value) =>
      PreferencesHelper.setString(Const.CITY, value);

  static Future<String> get auditorDob =>
      PreferencesHelper.getString(Const.DOB);

  static Future setAuditorDob(String value) =>
      PreferencesHelper.setString(Const.DOB, value);

  static Future<String> get auditorFirstName =>
      PreferencesHelper.getString(Const.FIRST_NAME);

  static Future setAuditorFirstName(String value) =>
      PreferencesHelper.setString(Const.FIRST_NAME, value);

  static Future<String> get auditorLastName =>
      PreferencesHelper.getString(Const.LAST_NAME);

  static Future setAuditorLastName(String value) =>
      PreferencesHelper.setString(Const.LAST_NAME, value);

  static Future<String> get auditorProfileEmailId =>
      PreferencesHelper.getString(Const.PROFILE_EMAIL_ID);

  static Future setAuditorProfileEmailId(String value) =>
      PreferencesHelper.setString(Const.PROFILE_EMAIL_ID, value);

  static Future<String> get auditorState =>
      PreferencesHelper.getString(Const.STATE);

  static Future setAuditorState(String value) =>
      PreferencesHelper.setString(Const.STATE, value);

  static Future<bool> get sound => PreferencesHelper.getBool(Const.SOUND);

  static Future setSound(bool value) =>
      PreferencesHelper.setBool(Const.SOUND, value);

  static Future removeValue(String rmValue) =>
      PreferencesHelper.prefs.then((value) => value.remove(rmValue));

  static Future<void> clear() async {
    await PreferencesHelper.prefs.then((value) => value.clear());
  }

  static Future<String> get merchantCompanyLogo =>
      PreferencesHelper.getString(Const.MERCHANT_COMPANY_LOGO);

  static Future setMerchantCompanyLogo(String value) =>
      PreferencesHelper.setString(Const.MERCHANT_COMPANY_LOGO, value);

  static Future<String> get merchantID =>
      PreferencesHelper.getString(Const.MERCHANTID);

  static Future setMerchantID(String value) =>
      PreferencesHelper.setString(Const.MERCHANTID, value);
  static Future<String> get mobile =>
      PreferencesHelper.getString(Const.MOBILE_NUMBER);

  static Future setMobile(String value) =>
      PreferencesHelper.setString(Const.MOBILE_NUMBER, value);

  static Future setPostalCode(String value) =>
      PreferencesHelper.setString(Const.POSTALCODE, value);

  static Future<String> get postalCode =>
      PreferencesHelper.getString(Const.POSTALCODE);

  static Future setShoppingMode(String value) =>
      PreferencesHelper.setString(Const.SHOPPINGMODE, value);

  static Future<String> get shoppingMode =>
      PreferencesHelper.getString(Const.SHOPPINGMODE);

  static Future setDeliveryType(String value) =>
      PreferencesHelper.setString(Const.DELIVERYTYPE, value);

  static Future<String> get deliveryType =>
      PreferencesHelper.getString(Const.DELIVERYTYPE);

  static Future setOrderID(String value) =>
      PreferencesHelper.setString(Const.ORDERID, value);

  static Future<String> get orderId =>
      PreferencesHelper.getString(Const.ORDERID);

  static Future setOrderAmount(double value) =>
      PreferencesHelper.setDouble(Const.ORDERAMOUNT, value);

  static Future<double> get orderAmount =>
      PreferencesHelper.getDouble(Const.ORDERAMOUNT);


  static Future setGuestCountry(String value) =>
      PreferencesHelper.setString(Const.GUESTCOUNTRY, value);

  static Future<String> get guestcountry =>
      PreferencesHelper.getString(Const.GUESTCOUNTRY);

      static Future setTimezone(String value) =>
      PreferencesHelper.setString(Const.TIMEZONE, value);

  static Future<String> get timezone =>
      PreferencesHelper.getString(Const.TIMEZONE);

      static Future setRatings(String value) =>
      PreferencesHelper.setString(Const.RATINGS, value);

  static Future<String> get ratings =>
      PreferencesHelper.getString(Const.RATINGS);

  static Future setReviewId(int value) =>
      PreferencesHelper.setInt(Const.REVIEWID, value);

  static Future<int> get reviewid =>
      PreferencesHelper.getInt(Const.REVIEWID);
  
  static Future setReviewInstruction(String value) =>
      PreferencesHelper.setString(Const.REVIEWINSTRUCTION, value);

  static Future<String> get reviewinstruction =>
      PreferencesHelper.getString(Const.REVIEWINSTRUCTION);

  static Future setGuestCity(String value) =>
      PreferencesHelper.setString(Const.GUESTCITY, value);

  static Future<String> get guestcity =>
      PreferencesHelper.getString(Const.GUESTCITY);

  static Future setGuestArea(String value) =>
      PreferencesHelper.setString(Const.GUESTAREA, value);

  static Future<String> get areaCode =>
      PreferencesHelper.getString(Const.GUESTAREA);

  static Future setRestaurant(String value) =>
      PreferencesHelper.setString(Const.RESTAURANTNAME, value);

  static Future<String> get resName =>
      PreferencesHelper.getString(Const.RESTAURANTNAME);

  static Future setBrowseMethod(String value) =>
      PreferencesHelper.setString(Const.BROWSEMETHODNAME, value);

  static Future<String> get browseMethodName =>
      PreferencesHelper.getString(Const.BROWSEMETHODNAME);

      static Future setCustomerAddrId(String value) =>
      PreferencesHelper.setString(Const.CUSTOMERADDRESSID, value);

  static Future<String> get customerAddrId =>
      PreferencesHelper.getString(Const.CUSTOMERADDRESSID);




      // MOB POS


      

}
