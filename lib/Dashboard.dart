import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Widget/DashBoardCard.dart';
import 'package:untitled/Widget/topTextButton.dart';
import 'package:untitled/Widget/dailyAverage.dart';
import 'package:untitled/Widget/containerButton.dart';
import 'package:untitled/Daily.dart';
import 'package:untitled/Plan.dart';
import 'package:untitled/Widget/buttonNav.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';

class dashboard extends StatefulWidget {

  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status ='?', _steps = '0';


  double miles = 0;
  double duration = 30.0;
  double calories = 40.0;
  double addValue = 0.025;
  double percent = 0.5;
  double target = 10000;
  int steps = 20;
  double previousDistacne = 0.0;
  double distance = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff023020),
                Color(0xff71a454),
              ])
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
              child:Column(

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        topText("Today", true, () {
                          print("This was tapped");
                        }),
                        topText("Plan", false, () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>plan()));
                        }),
                        topText("Daily", false, () {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>daily()));
                        }),
                        // this is the farthest button
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                        ),
                        containerButton(const Icon(
                          Icons.arrow_drop_down,
                          size: 50,
                          color: Colors.white,
                        )),
                      ],
                    ),
                  ),
                  dashboardCard(_steps,int.parse(_steps)/2000.0,int.parse(_steps)*0.04 , (int.parse(_steps)/2000.0)*20,(int.parse(_steps)/target),target),
                  //const dailyAverage(),
                ],
              )
            )
          )
        ],
      ),
        bottomNavigationBar: const buttonNav(),
    );
  }
  String formatDate(DateTime d) {
    return d.toString().substring(0, 19);
  }


  @override
  void initState() {
  super.initState();
  initPlatformState();
  }

  void onStepCount(StepCount event) {
  print(event);
  setState(() {
  _steps = event.steps.toString();
  });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
  print(event);
  setState(() {
  _status = event.status;
  });
  }

  void onPedestrianStatusError(error) {
  print('onPedestrianStatusError: $error');
  setState(() {
  _status = 'Pedestrian Status not available';
  });
  print(_status);
  }

  void onStepCountError(error) {
  print('onStepCountError: $error');
  setState(() {
  _steps = '0';
  });
  }

  void initPlatformState() {
  _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
  _pedestrianStatusStream
      .listen(onPedestrianStatusChanged)
      .onError(onPedestrianStatusError);

  _stepCountStream = Pedometer.stepCountStream;
  _stepCountStream.listen(onStepCount).onError(onStepCountError);

  if (!mounted) return;
  }

  }

