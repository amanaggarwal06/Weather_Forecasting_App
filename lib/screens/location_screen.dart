import 'package:flutter/material.dart';
import 'package:weather_project/utilities/constants.dart';
import 'package:weather_project/services/weather.dart';
import 'package:weather_project/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationweatherdata ;

  LocationScreen (this.locationweatherdata);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
  String ? WIcon;
  String ? message;
  int  temperature = 0;
  String ? cityname;
  // String ? emoji;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    updataUI(widget.locationweatherdata);
  }

  void updataUI(dynamic weatherdata){
      setState(() {
      if(weatherdata == null){
        temperature = 0;
        cityname = 'Nothing';
        WIcon = 'error';
        message = 'Unable to connect with the server';
        return;
      }

     var code = weatherdata['current']['condition']['code'];
    double temp = weatherdata['current']['temp_c'];
    temperature = temp.toInt();
     cityname = weatherdata['location']['name'];
     // emoji = weatherdata['current']['icon'];
    WIcon = weather.getWeatherIcon(code);
    message = weather.getMessage(temperature);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherdata = await weather.getLocationweather();
                      updataUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: ()  async{
                      var typedCity = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));

                      if(typedCity != null){
                           var weatherdata =  await weather.getWeather(typedCity);
                           updataUI(weatherdata);
                      }
                      },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$WIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$message in $cityname!',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

