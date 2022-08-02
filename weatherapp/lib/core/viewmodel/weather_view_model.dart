import 'package:flutter/material.dart';
import 'package:weatherapp/core/api/api_client.dart';
import 'package:weatherapp/core/model/weather_model.dart';
import 'package:weatherapp/core/api/api_response.dart';
import 'package:weatherapp/core/viewmodel/i_weatherview_model.dart';
import 'package:weatherapp/locator.dart';

class WeatherViewModel with ChangeNotifier implements IWeatherViewModel {
  ApiResponse<WeatherModel> _weatherResponse = ApiResponse.intial('intial');
  WeaterherApiClient weaterherApiClient = locator<WeaterherApiClient>();

  @override
  ApiResponse<WeatherModel> get weatherResponse => _weatherResponse;

  @override
  set weatherResponse(ApiResponse<WeatherModel> weatherResponse) {
    _weatherResponse = weatherResponse;
    notifyListeners();
  }

  @override
  Future<void> havaDurumuGetir({required String city}) async {
    try {
      weatherResponse = ApiResponse.loading('loading');
      final resault = await weaterherApiClient.getwaetherApiClient(city);
      weatherResponse = ApiResponse.completed(resault);
    } catch (e) {
      weatherResponse = ApiResponse.error(e.toString());
    }
  }
  
}
