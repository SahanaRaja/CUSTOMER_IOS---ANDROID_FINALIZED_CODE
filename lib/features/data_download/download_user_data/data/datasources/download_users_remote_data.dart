// ignore_for_file: avoid_renaming_method_parameters, avoid_function_literals_in_foreach_calls, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../../../../../core/app_urls.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../database/database.dart';
import '../models/pos_users_details_response_model.dart';
import '../tables/user_details_table.dart';

abstract class DownloadPosUserRemoteDataSource {
  Future<PosUserDetailsResponseModel> downloadUsersData(
      String token, String type, String shopId);
}

class DownloadPosUserRemoteDataSourceImpl
    extends DownloadPosUserRemoteDataSource {
  @override
  Future<PosUserDetailsResponseModel> downloadUsersData(
      String token1, String type, String shopId) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": "75299e5f2da42a297693ce9bb62b7bcb"
    };
    var tableLength = await getDbValues('pos_user_details');
    if (tableLength.isEmpty) {
      String jsonRequestBody = '{"type": "A"}';
      http.Response response = await http.post(Uri.parse(USER_DETAILS),
          headers: headers, body: jsonRequestBody);
      if (response.statusCode == 200) {
        print(response.body);
        PosUserDetailsResponseModel posUserDetailsResponseModel =
            PosUserDetailsResponseModel.fromJson(json.decode(response.body));
        final db = await initDb();
        Batch batch = db.batch();
        posUserDetailsResponseModel.status?.posUsersDetails.forEach((element) {
          UserDetailsTable posUserDetailsTable = UserDetailsTable(
            UD_DEVICE_ID: element.udDeviceId.toString(),
            UD_USER_PASSWORD: element.udUserPassword.toString(),
            UD_EMAIL_ID: element.udEmailId,
            UD_USER_ASSIGNED_TYPE: element.udUserAssignedType,
            UD_USER_TYPE: element.udUserType,
            UD_VERTICAL_ID: element.udVerticalId,
            UD_USER_CODE: element.udUserCode,
            UD_USER_NAME: element.udUserName,
            UD_COUNTRY_NAME: element.udCountryName,
            UD_CREATED_DATE: element.udCreatedDate,
            UD_DOB: element.udDob,
            UD_FIRST_NAME: element.udFirstName,
            UD_FLAG_STATUS: element.udFlagStatus,
            UD_IMAGE_PATH: element.udImagePath,
            UD_LAST_NAME: element.udLastName,
            UD_MOBILE_NO: element.udMobileNo,
            UD_SHOP_ID: element.udShopId,
            UD_STATE_NAME: element.udStateName,
            UD_TITLE: element.udTitle,
            UD_ACCESS_TYPE_ID: element.udAccessType,
            UD_ADDRESS1: element.udaddr1,
            UD_ADDRESS2: element.udaddr2,
            UD_ZIP_CODE: element.udzipCode,
          );
          batch.insert(
            'pos_user_details',
            posUserDetailsTable.toMap(),
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        });
        await batch.commit(noResult: true);
        return posUserDetailsResponseModel;
      } else {
        throw ServerException();
      }
    } else {
      String jsonRequestBody = '{"type": "U"}';
      http.Response response = await http.post(Uri.parse(USER_DETAILS),
          headers: headers, body: jsonRequestBody);
      if (response.statusCode == 200) {
        PosUserDetailsResponseModel posUserDetailsResponseModel =
            PosUserDetailsResponseModel.fromJson(json.decode(response.body));
        final db = await initDb();
        Batch batch = db.batch();
        posUserDetailsResponseModel.status?.posUsersDetails.forEach((element) {
          UserDetailsTable posUserDetailsTable = UserDetailsTable(
            UD_DEVICE_ID: element.udDeviceId.toString(),
            UD_USER_PASSWORD: element.udUserPassword.toString(),
            UD_EMAIL_ID: element.udEmailId,
            UD_USER_ASSIGNED_TYPE: element.udUserAssignedType,
            UD_USER_TYPE: element.udUserType,
            UD_VERTICAL_ID: element.udVerticalId,
            UD_USER_CODE: element.udUserCode,
            UD_USER_NAME: element.udUserName,
            UD_COUNTRY_NAME: element.udCountryName,
            UD_CREATED_DATE: element.udCreatedDate,
            UD_DOB: element.udDob,
            UD_FIRST_NAME: element.udFirstName,
            UD_FLAG_STATUS: element.udFlagStatus,
            UD_IMAGE_PATH: element.udImagePath,
            UD_LAST_NAME: element.udLastName,
            UD_MOBILE_NO: element.udMobileNo,
            UD_SHOP_ID: element.udShopId,
            UD_STATE_NAME: element.udStateName,
            UD_TITLE: element.udTitle,
            UD_ACCESS_TYPE_ID: element.udAccessType,
            UD_ADDRESS1: element.udaddr1,
            UD_ADDRESS2: element.udaddr2,
            UD_ZIP_CODE: element.udzipCode,
          );
          batch.insert(
            'pos_user_details',
            posUserDetailsTable.toMap(),
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        });
        await batch.commit(noResult: true);
        posUserDetailsResponseModel.status?.posUsersDetails.forEach((element) {
          UserDetailsTable posUserDetailsTable = UserDetailsTable(
            UD_DEVICE_ID: element.udDeviceId.toString(),
            UD_USER_PASSWORD: element.udUserPassword.toString(),
            UD_EMAIL_ID: element.udEmailId,
            UD_USER_ASSIGNED_TYPE: element.udUserAssignedType,
            UD_USER_TYPE: element.udUserType,
            UD_VERTICAL_ID: element.udVerticalId,
            UD_USER_CODE: element.udUserCode,
            UD_USER_NAME: element.udUserName,
            UD_COUNTRY_NAME: element.udCountryName,
            UD_CREATED_DATE: element.udCreatedDate,
            UD_DOB: element.udDob,
            UD_FIRST_NAME: element.udFirstName,
            UD_FLAG_STATUS: element.udFlagStatus,
            UD_IMAGE_PATH: element.udImagePath,
            UD_LAST_NAME: element.udLastName,
            UD_MOBILE_NO: element.udMobileNo,
            UD_SHOP_ID: element.udShopId,
            UD_STATE_NAME: element.udStateName,
            UD_TITLE: element.udTitle,
            UD_ACCESS_TYPE_ID: element.udAccessType,
            UD_ADDRESS1: element.udaddr1,
            UD_ADDRESS2: element.udaddr2,
            UD_ZIP_CODE: element.udzipCode,
          );
          batch.update(
            'pos_user_details',
            posUserDetailsTable.toMap(),
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        });
        await batch.commit(noResult: true, continueOnError: true);
        return posUserDetailsResponseModel;
      } else {
        throw ServerException();
      }
    }
  }
}
