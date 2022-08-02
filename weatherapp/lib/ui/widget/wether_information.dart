import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/api/api_response.dart';
import '../../core/model/weather_model.dart';
import '../../core/viewmodel/i_weatherview_model.dart';

class WeatherInformation extends StatefulWidget {
  const WeatherInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherInformation> createState() => _WeatherInformationState();
}

class _WeatherInformationState extends State<WeatherInformation> {
  late String city;
  WeatherModel? weatherModel;
  String otherWeahter = 'Diğer Havadurmu Bilgileri';
  String warning = 'Lütfen Şehir Girin!';

  Widget bodyWidget(IWeatherViewModel _weatherViewModel) {
    switch (_weatherViewModel.weatherResponse.status) {
      case Status.loading:
        {
          print('loading');
          return loadingWidget();
        
        }

      case Status.completed:
        {
          var _weatherData = _weatherViewModel.weatherResponse.data;
          return getWeahterWidget(_weatherData);
        }

      case Status.error:
        {
          return errorWidget();
        }

      default:
        {
          WidgetsBinding.instance.addPostFrameCallback((_) {});
          return Container();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    var iWeatherViewModel = Provider.of<IWeatherViewModel>(context);

    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) async {
                            city = value;
                          },
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () async {
                      if (city.isNotEmpty) {
                        await iWeatherViewModel.havaDurumuGetir(city: city);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(warning),
                        ));
                      }
                    },
                    icon: const Icon(Icons.search)),
              ),
            ],
          ),
          bodyWidget(iWeatherViewModel)
        ],
      ),
    );
  }

  Widget errorWidget() => const Text('ERROR');

  Widget loadingWidget() => const CircularProgressIndicator();

  Widget getWeahterWidget(WeatherModel weatherModel) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.sunny, color: Colors.orange, size: 60),
        ),
        Text(weatherModel.main!.temp.toString(),
            style: textStyle(textSize: 18)),
        const SizedBox(
          height: 20,
        ),
        Text(weatherModel.name.toString(), style: textStyle(textSize: 18)),
        const SizedBox(
          height: 40,
        ),
        Text(
          otherWeahter,
          style: textStyle(textSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Wind: ${weatherModel.wind!.speed}',
              style: textStyle(textSize: 18),
            ),
            Text(
              'Humidty: ${weatherModel.main!.humidity}',
              style: textStyle(textSize: 18),
            ),
          ],
        )
      ],
    );
  }

  TextStyle textStyle({required double? textSize}) =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: textSize);
}
 /* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/model/weather_model.dart';
import '../../core/viewmodel/view_model.dart';

class WeatherInformation extends StatefulWidget {
  const WeatherInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherInformation> createState() => _WeatherInformationState();
}

class _WeatherInformationState extends State<WeatherInformation> {
  String? city;
  WeatherModel? weatherModel;
  String otherWeahter = 'Diğer Havadurmu Bilgileri';
  String warning = 'Lütfen Şehir Girin!';
  Widget bodyWidget(WeatherViewModel _weatherViewModel) {
    switch (_weatherViewModel.setSate) {
      case WeatherSatate.loading:
        return loadingWidget();

      case WeatherSatate.complated:
        return getWeahterWidget(_weatherViewModel);

      case WeatherSatate.error:
        return errorWidget();

      default:
        {
          return Container();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel =
        Provider.of<WeatherViewModel>(context, listen: true);

    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) async {
                            city = value;
                          },
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () async {
                      if (city != null) {
                        await weatherViewModel.havaDurumuGetir(city!);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar( SnackBar(
                          content: Text(warning),
                        ));
                      }
                    },
                    icon: const Icon(Icons.search)),
              ),
            ],
          ),
          bodyWidget(weatherViewModel)
        ],
      ),
    );
  }

  Widget errorWidget() => const Text('ERROR');

  Widget loadingWidget() => const CircularProgressIndicator();

  Widget getWeahterWidget(WeatherViewModel weatherModel) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.sunny, color: Colors.orange, size: 60),
        ),
        Text(weatherModel.getWeather!.main!.temp.toString(),
            style: textStyle(textSize: 18)),
        const SizedBox(
          height: 20,
        ),
        Text(weatherModel.getWeather!.name.toString(),
            style: textStyle(textSize: 18)),
        const SizedBox(
          height: 40,
        ),
        Text(
          otherWeahter,
          style: textStyle(textSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Wind: ${weatherModel.getWeather!.wind!.speed}',
              style: textStyle(textSize: 18),
            ),
            Text(
              'Humidty: ${weatherModel.getWeather!.main!.humidity}',
              style: textStyle(textSize: 18),
            ),
          ],
        )
      ],
    );
  }

  TextStyle textStyle({required double? textSize}) =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: textSize);
} */