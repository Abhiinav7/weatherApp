import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/weather_models.dart';
class WeatherData {

 static  Future<Weather?> getData() async {
    String baseurl = "api.weatherapi.com";
    String key = '4b9be6fb1718410c8a972224232811';

    final queryParameters = {
      "key": "$key",
      "q": "calicut",

    };
    var url = Uri.https(baseurl, '/v1/current.json', queryParameters);
    final response = await http.get(url);
    if (response.statusCode == 200) {
  //print(response.body);
      final model = weatherFromJson(response.body);

      return model;
    }
    else {
       throw Exception("error");
    }
  }
}
