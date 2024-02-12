import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:PedoApp/Dashboard.dart';
import 'package:PedoApp/Widget/DashBoardCard.dart';
import 'package:PedoApp/Widget/topTextButton.dart';
import 'package:PedoApp/Widget/containerButton.dart';
import 'package:PedoApp/Daily.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class plan extends StatefulWidget {

  const plan({Key? key}) : super(key: key);

  @override
  _plan createState() => _plan();
}

class _plan extends State<plan> {
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
                              topText("Plan", true, () {
                                print("This was tapped");
                              }),
                              topText("Stats", false, () {
                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>daily()));
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
                        SizedBox(height:25),
                        ElevatedButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>daily()));
                                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                            },
                            child: Text(
                              'Select Date & Time',
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            )),
                      ],
                    )
                )
            ),

          ],
        )
    );
  }
}