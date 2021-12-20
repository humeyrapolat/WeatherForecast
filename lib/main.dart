import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/pages/city_list/city_vm.dart';
import 'package:weather_forecast/pages/util/routers.dart';

void main() {
  //widget ağacının en tepesinde bulunan kısmı haberdar etmek
  runApp(MultiProvider(
    providers: [
      //DEğişecek olan verinin nerede olduğunu gösterir
      ChangeNotifierProvider<CityVM>(create: (_) => CityVM()),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey,fontFamily: "RobotoMono",
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[900],titleTextStyle:
        const TextStyle(color: Colors.white)
      ),
      ),
      initialRoute: "/",
      onGenerateRoute: MyAppRouters.onGenerateRoute,
    );
  }
}
