import 'package:flutter/material.dart';

import '../widget/wether_information.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //WeaterherApiClient? weaterherApiClient = locator<WeaterherApiClient>();

/*   String ctyName = 'Şanlıurfa';
  double tmp = 40.05;
  double wind = 20;
  int humidty = 05;

  int pressure = 30; */
  String appTitle = 'Hava Durumu Uygulmsaı';
  bool centerTitle = true;

  @override
  void initState() {
    // weaterherApiClient!.getwaetherApiClient('istanbul');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          centerTitle: centerTitle,
        ),
        body: const WeatherInformation());
  }
}
