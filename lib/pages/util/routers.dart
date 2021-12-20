import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/pages/city_list/city_view.dart';
import 'package:weather_forecast/pages/daily_weather/daily_weather_view.dart';
import 'package:weather_forecast/pages/daily_weather/daily_weather_vm.dart';

extension RouteSettingsEx on RouteSettings {
  T? routeArgs<T>() {
    return arguments as T?;
  }
}
class MyAppRouters{
  static Route onGenerateRoute(RouteSettings routeSettings) {
    bool fullscreenDialog = false;
    late WidgetBuilder widgetBuilder;

    switch (routeSettings.name) {
      case "/":
        widgetBuilder = (_) => const CityPage();
        break;
      case "/dailyWeather":
        widgetBuilder = (_) => ChangeNotifierProvider(
          create: (_)=>  DailyWeatherVM(routeSettings.routeArgs()),
          child: DailyWeatherView(),
        );
        break;
      default:
        fullscreenDialog = true;
        widgetBuilder = (_) => Container();
    }
    return MaterialPageRoute(
        builder: widgetBuilder,
        settings: routeSettings,
        fullscreenDialog: fullscreenDialog);
  }
}