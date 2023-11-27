// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../core/app_urls.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../database/database.dart';
import '../models/image_response_model/image_response_model.dart';
import '../tables/assets_table.dart';

abstract class DownloadAssetsDataSource {
  Future<ImageResponseModel> downloadAssetsDataSource(
      String type, String shopId);
}

class DownloadAssetsImpl extends DownloadAssetsDataSource {
  @override
  Future<ImageResponseModel> downloadAssetsDataSource(
      String type, String shopId) async {
    // Map<String, String> headers = {
    //   "Content-type": "application/json",
    //   "TokenNo": TOKEN
    // };
    var prefs = await SharedPreferences.getInstance();
    String? tokenNos = prefs.getString("TokenNo");
    String NEWTOKEN = tokenNos ?? "";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "TokenNo": NEWTOKEN
      //  TOKEN
    };
    var tableLength = await getDbValues('assets');
    if (tableLength.isEmpty) {
      String jsonRequestBody = '{"no_of_records":500,"page_number":1}';
      print("AssetDownloadParams: $jsonRequestBody");
      http.Response response = await http.post(Uri.parse(RS_BASE64IMAGE),
          headers: headers, body: jsonRequestBody);
      print("AssetDownloadResponseBody: ${response.body}");
      print("statusCode: ${response.statusCode}");
      if (response.statusCode == 200) {
        ImageResponseModel downloadAssetsResponseModel =
            ImageResponseModel.fromJson(response.body);
        final db = await initDb();
        Batch batch = db.batch();
        for (var element in downloadAssetsResponseModel.status!.base64Image!) {
          AssetsTable assets = AssetsTable(
              BM_BASE64_ID: element.imageId.toString(),
              // BM_FLAG_STATUS: element.bmflagstatus.toString(),
              BM_ICON_NAME: element.imageName ?? '',
              BM_BASE64_IMAGE_STRING: element.imageBase64 ?? '');
          batch.insert(
            'assets',
            assets.toMap(),
          );
        }
        await batch.commit(noResult: true, continueOnError: true);
        return downloadAssetsResponseModel;
      } else {
        print('AssetDownloadBlock Called Client Failed');
        throw ServerException();
      }
    } else {
      String jsonRequestBody = '{"no_of_records":500,"page_number":1}';
      print("AssetDownloadParams: $jsonRequestBody");
      http.Response response = await http.post(Uri.parse(RS_BASE64IMAGE),
          headers: headers, body: jsonRequestBody);
      print("AssetDownloadBody: ${response.body}");
      print("statusCode: ${response.statusCode}");
      if (response.statusCode == 200) {
        ImageResponseModel downloadAssetsResponseModel =
            ImageResponseModel.fromJson(response.body);
        final db = await initDb();
        Batch batch = db.batch();
        for (var element in downloadAssetsResponseModel.status!.base64Image!) {
          AssetsTable assets = AssetsTable(
              BM_BASE64_ID: element.imageId.toString(),
              // BM_FLAG_STATUS: element.bmflagstatus.toString(),
              BM_ICON_NAME: element.imageName ?? '',
              BM_BASE64_IMAGE_STRING: element.imageBase64 ?? '');
          batch.insert(
            'assets',
            assets.toMap(),
          );
        }
        await batch.commit(noResult: true, continueOnError: true);

        for (var element in downloadAssetsResponseModel.status!.base64Image!) {
          AssetsTable assets = AssetsTable(
              BM_BASE64_ID: element.imageId.toString(),
              // BM_FLAG_STATUS: element.bmflagstatus.toString(),
              BM_ICON_NAME: element.imageName ?? '',
              BM_BASE64_IMAGE_STRING: element.imageBase64 ?? '');
          batch.update(
            'assets',
            assets.toMap(),
          );
        }
        await batch.commit(noResult: true, continueOnError: true);
        print("statusCode: ${downloadAssetsResponseModel.status!.message}");
        return downloadAssetsResponseModel;
      } else {
        print('AssetDownloadBlock Called Client Failed');
        throw ServerException();
      }
    }
  }
}
