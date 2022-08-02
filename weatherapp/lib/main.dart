import 'package:flutter/material.dart';
import 'package:weatherapp/locator.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/ui/screen/home.dart';
import 'core/viewmodel/i_weatherview_model.dart';
import 'core/viewmodel/weather_view_model.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IWeatherViewModel>(
            create: (_) => WeatherViewModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}
