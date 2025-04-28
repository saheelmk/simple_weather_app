import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/constants/text_styles.dart';
import 'package:weather_app_tutorial/extensions/datetime.dart';
import 'package:weather_app_tutorial/providers/current_weather_providers.dart';
import 'package:weather_app_tutorial/view/gradient_container.dart';
import 'package:weather_app_tutorial/view/hourly_forecast_view.dart';
import 'package:weather_app_tutorial/view/weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(data: (weather) {
      return GradientContainer(
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weather.name,
                style: TextStyles.h1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 260,
                child: Image.asset(
                    'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png'),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                weather.weather[0].description,
                style: TextStyles.h2,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          WeatherInfo(weather: weather),
          const SizedBox(
            height: 40,
          ),
          // view Hourly Forecast
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyles.h2,
              ),
              TextButton(
                  onPressed: () {}, child: const Text('View full forecast'))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          HourlyForecastView(),
        ],
      );
    }, error: (error, stackrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
