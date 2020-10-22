import 'package:DockerApp/Animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'AuthPage.dart';
import 'Server.dart';

class userinfo extends StatefulWidget {
  @override
  _userinfoState createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: FadeAnimation(
        1.3,
        Stack(
          children: <Widget>[
            new Container(
              // child: Image.network(
              //   'https://th.bing.com/th/id/OIP.MI3Hv2cdd2j5mC6qLlstmAHaEK?w=315&h=180&c=7&o=5&dpr=1.25&pid=1.7'),
              height: 300,
              decoration: BoxDecoration(color: Colors.black
                  //gradient: LinearGradient(colors: [Colors.grey, Colors.black]),
                  ),
            ),
            new Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                //actions: <Widget>[Icon(Icons.settings)],
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
            ),
            FadeAnimation(
              1.6,
              Container(
                margin: EdgeInsets.only(top: 100, left: 138),
                child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.behN54W1j_BEWTTR4fCqRgHaHa?w=196&h=196&c=7&o=5&dpr=1.25&pid=1.7')),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 280),
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              // color: Colors.white,
            ),
            FadeAnimation(
              1.9,
              Container(
                //alignment: Alignment.center,
                margin: EdgeInsets.only(top: 240, left: 20, right: 20),
                child: Card(
                  color: Colors.grey.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 10,
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 25, right: 10),
                    title: Text(
                      'RHEL8',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      Server.IP,
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                      ),
                      onPressed: null,
                      iconSize: 35,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.grey.shade500,
              margin: EdgeInsets.only(top: 300),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    // margin: EdgeInsets.only(top: 10),
                    child: FadeAnimation(
                      2.2,
                      ListTile(
                        leading: Icon(
                          Icons.supervisor_account,
                          size: 35,
                          color: Colors.blueGrey[800],
                        ),
                        title: Text('Name',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        subtitle: Text(Authvar.username1),
                        //  leading: Icon(FlutterIco),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    child: FadeAnimation(
                      2.5,
                      ListTile(
                        leading: Icon(
                          Icons.mail_outline,
                          size: 35,
                          color: Colors.blueGrey[800],
                        ),
                        title: Text('Mail',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        subtitle: Text(Authvar.usermail1),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    child: FadeAnimation(
                      2.8,
                      ListTile(
                        leading: Icon(
                          Icons.phonelink_ring,
                          size: 35,
                          color: Colors.blueGrey[800],
                        ),
                        title: Text('Mobile Number',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        subtitle: Text(Authvar.usermob1),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.grey.shade200,
                    elevation: 0,
                    child: FadeAnimation(
                      3.1,
                      ListTile(
                        leading: Icon(
                          Icons.timer,
                          size: 35,
                          color: Colors.blueGrey[800],
                        ),
                        title: Text('Last login',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            )),
                        subtitle: Text(Authvar.userlast.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
