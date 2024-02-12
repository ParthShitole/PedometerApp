
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:PedoApp/Dashboard.dart';
import 'package:PedoApp/Widget/DashBoardCard.dart';
import 'package:PedoApp/Widget/topTextButton.dart';
import 'package:PedoApp/Widget/containerButton.dart';
import 'package:PedoApp/Plan.dart';
import 'package:PedoApp/Widget/imageContainer.dart';
import 'package:PedoApp/Dashboard.dart';

class daily extends StatefulWidget {

  const daily({Key? key}) : super(key: key);

  @override
  _daily createState() => _daily();
}

class _daily extends State<daily> {
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
                          Color(0xff197719),
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
                              topText("Today", false, () {
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>dashboard()));
                              }),
                              topText("Plan", false, () {
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>plan()));
                              }),
                              topText("Stats", true, () {
                                print("This was tapped");
                              }),
                              // this is the farthest button
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.20,
                              ),
                              containerButton(const Icon(
                                Icons.arrow_drop_down,
                                size: 50,
                                color: Colors.white,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height:30),
                        Image.asset('assets/chart.png',
                          height: 250,
                          width:400,
                        ),
                        SizedBox(height:10),
                        Text(
                          'Calories burnt: 543.6K',
                          style: TextStyle(color: Colors.white,fontSize: 25),
                        ),
                        SizedBox(height:10),
                        Text('Peak activity 250 steps between 11:30 to 12:00am',
                          style: TextStyle(color: Colors.white,fontSize:25),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                )
            )
          ],
        )
    );
  }
}