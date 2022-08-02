import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'app_exeption.dart';

class ApiBaseHelper {
  Future<dynamic> get({required String url}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeOutException('ConnectionTimeOut');
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('zaman aşımı');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = _convertToJson(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 408:
        throw TimeOutException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Sunucuyla İletişim Kurulurken Hata Oluştu. Web site adını kontrol et.\nDurum Kodu: ${response.statusCode}');
    }
  }

  dynamic _convertToJson(Uint8List bodyBytes) {
    var responseBody = utf8.decode(bodyBytes);
    return json.decode(responseBody);
  }
}
