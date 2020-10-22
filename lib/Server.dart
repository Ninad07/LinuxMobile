import 'package:DockerApp/Animation/animation.dart';
import 'package:DockerApp/terminal.dart';
import 'package:flutter/material.dart';

class Server extends StatefulWidget {
  static var IP;
  @override
  _ServerState createState() => _ServerState();
}

class _ServerState extends State<Server> {
  @override
  Widget build(BuildContext context) {
    var body = SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //color: Colors.grey.shade900,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.5, .6],
                colors: [Colors.black, Colors.grey.shade900])),

        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            FadeAnimation(
              2,
              Container(
                height: 300,
                width: 300,
                child: Image.asset(
                  "images/server.png",
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            FadeAnimation(
              2.5,
              Container(
                child: Text(
                  "Connect to the Host",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            FadeAnimation(
              3,
              Container(
                //color: Colors.black,
                height: 55,
                width: 330,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.shade800,
                    )),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.shade800, width: 1.5)),
                    /*focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade700,
                                                  width: 2)),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade200)),*/
                    //labelText: "Email or Phone number",
                    hintText: "Host IP",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    //errorText: error ? 'Invalid user' : null,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.laptop_chromebook,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                  ),
                  onChanged: (value) {
                    Server.IP = value;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(
              3.5,
              Container(
                height: 45,
                width: 200,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  isExtended: true,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: Text("Connect"),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Terminal();
                    }));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: body,
    );
  }
}
