import 'package:DockerApp/Animation/animation.dart';
import 'package:DockerApp/AuthPage.dart';
import 'package:DockerApp/Server.dart';

import 'userpage.dart';
import 'package:bmnav/bmnav.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  //var IP = "192.168.43.56";
  var cmd;
  // var uid = FirebaseAuth.instance;
  FirebaseFirestore fs1 = FirebaseFirestore.instance;
  var output, displayOutput = "";

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    APICommand(cmd) async {
      var url = "http://${Server.IP}/cgi-bin/command.py?x=${cmd}";
      var r = await http.get(url);
      setState(() {
        output = r.body;
      });

      setState(() {
        displayOutput += "[root@localhost ~]# " + cmd + "\n" + output + "\n";
      });
    }

    var body = SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height - 187,
            width: MediaQuery.of(context).size.width,
            child: Column(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                //margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          //borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1.5)),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "root@localhost:~",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 29,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          //borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade800, width: 1.5)),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 256,
                //color: Colors.grey.shade700,
                child: SingleChildScrollView(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(displayOutput),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  child: Center(
                                child: Text(
                                  "[root@localhost ~]#",
                                  style: TextStyle(fontSize: 13),
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width - 180,
                                  child: TextField(
                                    //keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade700,
                                              width: 2)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade200)),
                                    ),
                                    onChanged: (value) {
                                      cmd = value;
                                    },
                                  )),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue),
                                height: 25,
                                width: 30,
                                child: FloatingActionButton(
                                    backgroundColor: Colors.blue,
                                    onPressed: () async {
                                      await APICommand(cmd);
                                      await fs1.collection('history').add(
                                          {"command": cmd, "output": output});
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        //FlutterIcons.greater_than_faw5s,
                                        FlutterIcons.arrow_right_ent,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              )
            ])));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.black,
            flexibleSpace: Center(
              child: Row(
                children: <Widget>[
                  FadeAnimation(
                    1.6,
                    Container(
                        height: 50,
                        width: 65,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.grey.shade500, width: 1)),
                        margin: EdgeInsets.only(
                            top: 30,
                            left: MediaQuery.of(context).size.width / 4,
                            right: 0),
                        child: Icon(
                          FlutterIcons.terminal_faw5s,
                          size: 35,
                          color: Colors.blueAccent,
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FadeAnimation(
                    1.1,
                    Container(
                      margin: EdgeInsets.only(top: 35),
                      child: Text(
                        "Terminal",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //title: Text("Terminal"),
          ),
        ),
        bottomNavigationBar: BottomNav(
          index: 1,
          color: Colors.black,
          iconStyle: IconStyle(
              color: Colors.grey.shade600,
              onSelectSize: 30,
              size: 25,
              onSelectColor: Colors.blueAccent),
          items: [
            BottomNavItem(Icons.home, label: null),
            BottomNavItem(Icons.laptop_windows, label: null),
            BottomNavItem(Icons.person, label: null),
          ],
          onTap: (int i) {
            print(i);
            if (i == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return userinfo();
              }));
            }

            if (i == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Auth();
              }));
            }

            if (i == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Server();
              }));
            }
          },
        ),
        body: body,
      ),
    );
  }
}
