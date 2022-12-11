import 'package:flutter/material.dart';

import 'Dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
        home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Health App'),
        backgroundColor: Color(0xff197719),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Photos/Baground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Login",
                style: TextStyle(
                    fontSize:45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                )
            ),
            SizedBox(height: 15,),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
                ),

                hintText: 'Enter your username',
              ),
            ),
            SizedBox(height: 15,),
            SizedBox(height: 15,),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)
                ),
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(height: 50,width:100,
            child:ElevatedButton(
              child: Text('Login',style: TextStyle(fontSize: 20),),
              style:
              ElevatedButton.styleFrom(
                backgroundColor:  Colors.green,
              ),
              onPressed: () {
                // Retrieve the text the user has entered by using the
                // TextEditingController.
                final username = usernameController.text;
                final password = passwordController.text;
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>dashboard()));
                // TODO: Create a way to check the username and password
                // against some credentials and display an error message
                // if the login fails.
              },
            ),
            )
          ],
        ),
      ),
    );
  }
}