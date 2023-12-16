import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/weather_models.dart';
import '../screens/main_screen.dart';
import '../services/api_services.dart';

class ModelProvider extends ChangeNotifier{
  Weather? model;


  Future getDataApi(context)async{

    model=await WeatherData.getData();
    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {return
    //   MainScreen();
    // },) );
    notifyListeners();
  }

}