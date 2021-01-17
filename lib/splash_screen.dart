import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(top: 150, bottom: 40),
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: AssetImage('assets/images/logo.jpg'),
                        ),
                      ),
                      Text(
                        'Flutter News',
                        style: TextStyle(
                            color: Colors.deepPurple[800], fontSize: 34),
                      )
                    ]),
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
