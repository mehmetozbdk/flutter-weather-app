
import 'package:weatherapp/core/api/api_base_helper.dart';
import 'package:weatherapp/locator.dart';

import '../constants/endpoints.dart';
import '../model/weather_model.dart';

class WeaterherApiClient {
  Future<WeatherModel> getwaetherApiClient(String city) async {
    ApiBaseHelper apiBaseHleper = locator<ApiBaseHelper>();
    final String _url = '${Endpoints.firstBaseUrl}$city${Endpoints.endBaseUrl}';

    final responseJson = await apiBaseHleper.get(url: _url);
    // print(responseJson);
    /// jsonDecode
    /// Dizeyi ayrıştırır ve elde edilen Json nesnesini döndürür.

    return WeatherModel.fromJson(responseJson);
  }
}
