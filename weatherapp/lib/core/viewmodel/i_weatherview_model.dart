import 'package:flutter/cupertino.dart';
import 'package:weatherapp/core/api/api_response.dart';

import 'package:weatherapp/core/model/weather_model.dart';
import 'package:weatherapp/locator.dart';
import '../api/api_client.dart';

abstract class IWeatherViewModel with ChangeNotifier {
  //abstract calass oldugu için get ve set methodlarının  gövdesini tanımlamadık ve 
  //havaDurumuGetir() fonksıyınunun da gövdesini tanımlamadık

  ApiResponse<WeatherModel> get weatherResponse;

  set weatherResponse(ApiResponse<WeatherModel> weatherResponse);

  Future<void> havaDurumuGetir({required String city});
}
