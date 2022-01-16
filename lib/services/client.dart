import 'dart:convert';
import 'dart:io';

import 'package:bts_wall/const/constants.dart';
import 'package:bts_wall/tools/utils.dart';
import 'package:dio/dio.dart';

enum FormatType {
  JSON,
  STRING,
}
var dio = Dio();

class Client {
  // |GET| : this function to make GET Dio call
  static Future<dynamic> dioGet(
    String url,
    Map<String, String> params, {
    String method,
    FormatType formatType = FormatType.JSON,
    bool debug = true,
  }) async {
    try {
      // check if internet connected
      if (!await MyUtils.checkInternet()) {
        return null;
      }

      // avoid null params error
      if (params == null) params = Map<String, String>();

      // init header
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      /// [AUTHHORIZATION] 

      if (!MyUtils.isNullOrEmpty(AppConstats.accessToken))
        headers.addAll({'Authorization': 'Bearer ${AppConstats.accessToken}'});

      // Add Header and Base URL
      dio.options = BaseOptions(headers: headers, baseUrl: AppConstats.baseUrl);

      // print url to check errors
      if (debug) {
        print(
            'url====================================  get - ${method ?? "get"} ');
        // print(url);
        print('=======================================');
      }

      // check method && call the request Response
      Response res;

      res = await dio.get(url);

      print('body ======================================== ${AppConstats.baseUrl} $url ');
      print(res.statusCode);
      print(res.data);
      print('=============================================');

      // check response
      if (res == null) return null;

      // set response message
      // MyUtils.setResponseMessage(res);

      // check if their authorization error
      if (res.statusCode == 401) {
        // not logged
        return null;
      }

      // check if the request complete
      if (res.statusCode == 200 && res.data != null) {
        switch (formatType) {
          case FormatType.JSON:
            return jsonDecode(res.toString());
            break;
          default:
            return res.data;
        }
      }
    } on DioError catch (e) {
      print('The Exception is : ');
      print(e.response.data);
    }
    return null;
  }
}
