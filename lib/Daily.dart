import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/Dashboard.dart';
import 'package:untitled/Widget/DashBoardCard.dart';
import 'package:untitled/Widget/topTextButton.dart';
import 'package:untitled/Widget/containerButton.dart';
import 'package:untitled/Plan.dart';

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
    topText("Daily", true, () {
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
    ],
    )
    )
    )
            ],
        )
    );
  }
}