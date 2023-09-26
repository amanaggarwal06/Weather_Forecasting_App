import 'package:weather_project/services/location.dart';
import 'package:weather_project/services/networking.dart';
import 'package:weather_project/screens/location_screen.dart';


class WeatherModel {

  Future<dynamic> getWeather(String cityname) async{
    Networkhelper networkhelper = Networkhelper("https://api.weatherapi.com/v1/current.json?key=89910f9b66ff47caabe152918230908&q=$cityname&aqi=no");
    var weatherdata = await networkhelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationweather() async{
    Location locate_object = Location();
    await locate_object.getCurrentLocation();

    //Api call is going from here only.
    Networkhelper networkhelper = Networkhelper("https://api.weatherapi.com/v1/current.json?key=89910f9b66ff47caabe152918230908&q=${locate_object.latitude},${locate_object.longitude}&aqi=no");
    var weatherdata = await networkhelper.getData();

    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
