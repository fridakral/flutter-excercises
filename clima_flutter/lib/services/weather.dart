import 'package:clima_flutter/services/networking.dart';
import '../services/location.dart';
const openWeatherUrl = 'api.openweathermap.org';
const openWeatherMap = '/data/2.5/weather';
const openWeatherApiKey = 'fabf55c4b7a58f26202d258bb9cb56c3';


class WeatherModel {

  Future<dynamic> getLocationWeather() async {

    Location location = Location();
    await location.getCurrentLocation();
    var url = Uri.https(openWeatherUrl, openWeatherMap, {'lat': '${location.latitude}' , 'lon': '${location.longitude}', 'units':'metric', 'appid':openWeatherApiKey});
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
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