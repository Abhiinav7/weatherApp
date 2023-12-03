import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Widgets/appbar.dart';

import '../models/weather_models.dart';
import '../services/api_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Weather? model;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Weather? fetchedModel = await WeatherData.getData();
      setState(() {
        model = fetchedModel;
      });
        print("country===${model!.forecast.forecastday[1].day.avgvisKm}");
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Lottie.asset(
                  "assets/bg.json",
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "huy",
                  style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold,),
                ),
                SizedBox(
                  height: 200,
                ),

              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
