import 'package:get_it/get_it.dart';
import 'package:weatherapp/core/api/api_base_helper.dart';
import 'package:weatherapp/core/api/api_client.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeaterherApiClient());
  locator.registerLazySingleton(() => ApiBaseHelper());
}
