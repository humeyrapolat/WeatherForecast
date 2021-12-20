import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_forecast/pages/city_list/city_vm.dart';
import 'package:weather_forecast/pages/model/city.dart';

class CityPage extends StatelessWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(fontFamily: 'RobotoMono', fontSize: 25),
        ),
      ),
      body: context.watch<CityVM>().cityList.isEmpty
          ? Center(child: Image.asset("assets/loading_two.gif"))
          : ListView.builder(
              itemCount: context.watch<CityVM>().cityList.length,
              itemBuilder: (c, i) {
                City item = context.watch<CityVM>().cityList[i];

                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/dailyWeather',
                        arguments: item);
                  },
                  child: Card(
                    shadowColor: Colors.grey[400],
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            item.title!,
                            style: TextStyle(
                                fontFamily: 'RobotoMono', fontSize: 19),
                          ),
                          Text(
                            item.woeid!.toString(),
                            style: TextStyle(fontSize: 1, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
