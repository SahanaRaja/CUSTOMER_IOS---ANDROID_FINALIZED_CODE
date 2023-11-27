// ignore_for_file: non_constant_identifier_names

class UserDetailsTable {
  final String UD_DEVICE_ID;
  final String UD_USER_PASSWORD;
  final String UD_EMAIL_ID;
  final String UD_USER_ASSIGNED_TYPE;
  final String UD_USER_TYPE;
  final String UD_VERTICAL_ID;
  final int UD_USER_CODE;
  final int UD_FLAG_STATUS;
  final String UD_STATE_NAME;
  final String UD_TITLE;
  final String UD_IMAGE_PATH;
  final String UD_MOBILE_NO;
  final String UD_FIRST_NAME;
  final String UD_LAST_NAME;
  final String UD_DOB;
  final String UD_SHOP_ID;
  final String UD_COUNTRY_NAME;
  final String UD_CREATED_DATE;
  final String UD_USER_NAME;
  final int UD_ACCESS_TYPE_ID;
  final String UD_ADDRESS1;
  final String UD_ADDRESS2;
  final String UD_ZIP_CODE;

  UserDetailsTable({
    required this.UD_DEVICE_ID,
    required this.UD_USER_PASSWORD,
    required this.UD_EMAIL_ID,
    required this.UD_USER_ASSIGNED_TYPE,
    required this.UD_USER_TYPE,
    required this.UD_VERTICAL_ID,
    required this.UD_USER_CODE,
    required this.UD_FLAG_STATUS,
    required this.UD_STATE_NAME,
    required this.UD_TITLE,
    required this.UD_IMAGE_PATH,
    required this.UD_MOBILE_NO,
    required this.UD_FIRST_NAME,
    required this.UD_LAST_NAME,
    required this.UD_DOB,
    required this.UD_SHOP_ID,
    required this.UD_COUNTRY_NAME,
    required this.UD_CREATED_DATE,
    required this.UD_USER_NAME,
    required this.UD_ACCESS_TYPE_ID,
    required this.UD_ADDRESS1,
    required this.UD_ADDRESS2,
    required this.UD_ZIP_CODE,
  });

  Map<String, dynamic> toMap() {
    return {
      'UD_DEVICE_ID': UD_DEVICE_ID,
      'UD_USER_PASSWORD': UD_USER_PASSWORD,
      'UD_EMAIL_ID': UD_EMAIL_ID,
      'UD_USER_ASSIGNED_TYPE': UD_USER_ASSIGNED_TYPE,
      'UD_USER_TYPE': UD_USER_TYPE,
      'UD_VERTICAL_ID': UD_VERTICAL_ID,
      'UD_USER_CODE': UD_USER_CODE,
      'UD_USER_NAME': UD_USER_NAME,
      'UD_FLAG_STATUS': UD_FLAG_STATUS,
      'UD_STATE_NAME': UD_STATE_NAME,
      'UD_TITLE': UD_TITLE,
      'UD_IMAGE_PATH': UD_IMAGE_PATH,
      'UD_MOBILE_NO': UD_MOBILE_NO,
      'UD_FIRST_NAME': UD_FIRST_NAME,
      'UD_LAST_NAME': UD_LAST_NAME,
      'UD_DOB': UD_DOB,
      'UD_COUNTRY_NAME': UD_COUNTRY_NAME,
      'UD_CREATED_DATE': UD_CREATED_DATE,
      'UD_ACCESS_TYPE_ID': UD_ACCESS_TYPE_ID,
      'UD_ADDRESS1': UD_ADDRESS1,
      'UD_ADDRESS2': UD_ADDRESS2,
      'UD_ZIP_CODE': UD_ZIP_CODE,
    };
  }
}
