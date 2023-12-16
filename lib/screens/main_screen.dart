import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../provider/model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ModelProvider>(context).model;
    return Scaffold(
      body: SafeArea(
        child: model == null ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitWave(
                  size: 20,
                  color: Colors.deepPurple,
                  duration: Duration(seconds: 3),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Updating Weather...",
                  style:  GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )

            :Stack(
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                    Text(model!.location.name,
                        style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30)),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${DateFormat.yMMMd('en_US').format(DateTime.now())}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white70)),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "http:" + model!.current.condition.icon,
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model!.current.tempC.toString()+" °C",
                      style: GoogleFonts.alkatra(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model!.current.condition.text,
                      style: GoogleFonts.rosarivo(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 80,right: 20,bottom: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 120,
                        width: 82,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Wind",
                              style: GoogleFonts.abyssinicaSil(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/wind.png",fit: BoxFit.cover,color: Colors.white60,)
                            ),
                            Text(
                              model!.current.windKph.toString()+" kph",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 82,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "UV",
                              style: GoogleFonts.abyssinicaSil(
                                  fontSize: 20,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset("assets/sun.png",fit: BoxFit.cover,color: Colors.white60,)
                            ),

                            Text(
                              model!.current.uv.toString(),
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 84,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pressure",
                              style: GoogleFonts.abyssinicaSil(
                                  fontSize: 20,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(
                                height: 40,
                                width: 40,
                                child:Icon(Icons.compress,
                                size: 40,
                                  color: Colors.white60,
                                )
                            ),

                            Text(
                              model!.current.pressureMb.toString()+" hpa",
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.white38,
                 ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Feels like",
                              style: GoogleFonts.abyssinicaSil(
                                  fontSize: 20,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                model!.current.feelslikeC.toString()+" °C",
                              style: GoogleFonts.alikeAngular(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Humidity",
                              style: GoogleFonts.abyssinicaSil(
                                  fontSize: 20,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              model!.current.humidity.toString()+" %",
                              style: GoogleFonts.alikeAngular(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ],
                        ),
                        //
                      ],
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
