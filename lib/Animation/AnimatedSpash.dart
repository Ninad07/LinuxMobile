//import 'package:DockerApp/Animation/animation.dart';
import 'package:DockerApp/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    var body = SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade900,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          FadeAnimation(
            4,
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Form(
                  child: Container(
                    height: 350,
                    width: 350,
                    child: Image.asset("images/linux.png"),
                  ),
                ),
                Positioned(
                  right: 25,
                  bottom: 35,
                  child: Container(
                    width: 130,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade900, width: 5)),
                    child: Icon(
                      FlutterIcons.terminal_faw5s,
                      color: Colors.white,
                      size: 75,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeAnimation(
            5.5,
            Container(
              //color: Colors.black,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 5),
                      child: Text(
                        "Linux",
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      //margin: EdgeInsets.only(
                      //  right: MediaQuery.of(context).size.width / 7),
                      child: Text(
                        "Mobile",
                        style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          FadeAnimation(
            2,
            Container(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
            2,
            Container(
              child: Center(
                child: Text(
                  "loading...",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ));

    return Scaffold(
      body: body,
    );
  }
}
