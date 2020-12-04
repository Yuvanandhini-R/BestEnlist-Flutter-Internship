import 'package:day9/state_model/WeatherStateModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Consumer<WeatherStateModel>(
              builder: (context, weatherStateModel, child) => TextField(
                onChanged: (text) => weatherStateModel.setQ(text),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    hintText: 'Enter City Name (Default: Kanchipuram)'),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(75),
        ),
        actions: [
          Consumer<WeatherStateModel>(
            builder: (context, weatherStateModel, child) => FlatButton(
              child: Icon(Icons.refresh_rounded, color: Colors.white),
              onPressed: () => weatherStateModel.reloadData(),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<WeatherStateModel>(
              builder: (context, weatherStateModel, child) => FutureBuilder(
                  future: weatherStateModel.weatherData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network("https:" +
                                snapshot.data['current']['condition']['icon']),
                            Text("${snapshot.data['current']['temp_c']} °C")
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Something Went Wrong!");
                    }

                    return CircularProgressIndicator();
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("Weather Data Provided By WeatherApi.com"),
          )
        ],
      ),
    );
  }
}
