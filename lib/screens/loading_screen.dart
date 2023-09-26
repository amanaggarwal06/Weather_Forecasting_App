import 'package:flutter/material.dart';
import 'package:weather_project/services/location.dart';
import 'package:weather_project/services/networking.dart';
import 'package:weather_project/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_project/services/weather.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

    double ?latitude;
    double ?longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocationData();
    print("Aman");
  }

  void getlocationData()  async {

    WeatherModel weatherModel = WeatherModel();
    var weatherdata = await weatherModel.getLocationweather();

       Navigator.push(context, MaterialPageRoute(builder: (context){
         return LocationScreen(weatherdata);
       }));
  }
  
  // void getData() async {
     // Uri url = Uri.https("https://api.weatherapi.com/v1/current.json?key=89910f9b66ff47caabe152918230908&q=48.8567,2.3508&aqi=no');


      // var code = jsonDecode(data)['current']['condition']['code'];
      // var temperature = jsonDecode(data)['current']['temp_c'];
      // var cityname = jsonDecode(data)['location']['name'];
      // print(latitude);
      // print(longitude);
      // print(temperature);
      // print(cityname);



  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:
          SpinKitCircle(
            color: Colors.white,
            size: 100.0,
          )
      )
    );
  }
}
