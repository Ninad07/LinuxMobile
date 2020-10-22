import 'dart:ui';
import 'package:DockerApp/Animation/animation.dart';

import 'Server.dart';
import 'terminal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'main.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class Authvar {
  static var username1 = "not yet";
  static var usermob1 = "not yet";
  static var usermail1 = "not yet";
  static var userlast;
}

class _AuthState extends State<Auth> {
  var islogged = false;
  var authc = FirebaseAuth.instance;
  FirebaseFirestore fsconnect = FirebaseFirestore.instance;
  bool error = false;
  bool error1 = false;
  String mail;
  String pass;
  String username;
  String usermob;

  @override
  Widget build(BuildContext context) {
    var Authbody = Center(
        child: Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            .7,
            .5,
            .9
          ],
              colors: [
            Colors.black,
            Colors.grey.shade800,
            Colors.grey.shade900
          ])),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Container(
              //height: 210,
              //color: Colors.white,
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Container(
                      //color: Colors.white,
                      height: 180,
                      width: 180,
                      child: Icon(
                        //FlutterIcons.terminal_fea,
                        Octicons.terminal,
                        color: Colors.white,
                        size: 180,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.3,
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 5),
                            child: Center(
                              child: Text(
                                "Linux",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40,
                                    color: Colors.grey.shade300),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            //margin: EdgeInsets.only(
                            //  left: MediaQuery.of(context).size.width / 5),
                            child: Center(
                              child: Text(
                                "Mobile",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40,
                                    color: Colors.blue.shade800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            FadeAnimation(
              1.6,
              Container(
                height: 30,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  "Username",
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
            ),
            FadeAnimation(
              1.7,
              Container(
                color: Colors.grey.shade900,
                height: 60,
                width: 370,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.5)),
                    /*focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),*/
                    //labelText: "Email or Phone number",
                    hintText: "email or phone number",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    errorText: error1 ? 'Invalid user' : null,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      error1 = false;
                    });
                    mail = value;
                  },
                ),
              ),
            ),
            FadeAnimation(
              2.0,
              Container(
                height: 30,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 25, top: 20),
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
            ),
            FadeAnimation(
              2.1,
              Container(
                color: Colors.grey.shade900,
                width: 370,
                height: 60,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    /*focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),*/
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    errorText: error1 ? 'Invalid password' : null,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      error1 = false;
                    });
                    pass = value;
                  },
                ),
              ),
            ),
            FadeAnimation(
              2.2,
              Container(
                //width: 150,
                //color: Colors.black,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 15, top: 10, bottom: 20),
                child: Text("Forgot password?",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
            FadeAnimation(
              2.5,
              Container(
                //color: Colors.black,
                margin: EdgeInsets.only(top: 10),
                height: 40,
                width: 350,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  isExtended: true,
                  //backgroundColor: Colors.black,
                  child: islogged
                      ? Transform.scale(
                          scale: 0.6,
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white))
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [.3, .55],
                                colors: [Colors.blue, Colors.blue.shade900]),
                          ),
                          height: 40,
                          width: 350,
                          //color: Colors.white,
                          child: Center(child: Text("Login"))),
                  onPressed: () async {
                    var result2;
                    setState(() {
                      islogged = true;
                    });
                    try {
                      result2 = await authc.signInWithEmailAndPassword(
                          email: mail, password: pass);
                      print(authc.currentUser.uid);
                      var retrived = await fsconnect
                          .collection("user")
                          .doc(authc.currentUser.uid)
                          .get();
                      print(retrived.data());
                      var temp = retrived.data();

                      Authvar.usermob1 = temp['mob'];
                      Authvar.usermail1 = temp['mail'];
                      Authvar.username1 = temp['Name'];
                      Authvar.userlast =
                          authc.currentUser.metadata.lastSignInTime;
                      //print(retrived);
                    } catch (e) {
                      print(e);
                      setState(
                        () {
                          error1 = true;
                        },
                      );
                    }
                    print(result2);
                    if (result2 != null) {
                      islogged = false;
                      //AppToast("Logged in");
                      print('logged in');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Server();
                      }));
                    }
                  },
                ),
              ),
            ),

            /* Container(
              child: Center(
                child: Text(
                  "Or Login through",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
*/
            /*Container(
                child: Image.asset(
              "images/login.png",
              height: 50,
              width: 120,
            )),*/
            SizedBox(
              height: 40,
            ),
            FadeAnimation(
              2.8,
              Container(
                child: Center(
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            FadeAnimation(
              3,
              Container(
                child: GestureDetector(
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.grey.shade100),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Scaffold(
                              body: Center(
                            child: Container(
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [
                                    .7,
                                    .5,
                                    .9
                                  ],
                                      colors: [
                                    Colors.black,
                                    Colors.grey.shade800,
                                    Colors.grey.shade900
                                  ])),
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    FadeAnimation(
                                      1,
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            top: 100),
                                        child: Center(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "Sign Up",
                                                style: TextStyle(
                                                    color: Colors.blue.shade700,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    FadeAnimation(
                                      1.3,
                                      Container(
                                        height: 30,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 25),
                                        child: Text(
                                          "Name",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      1.4,
                                      Container(
                                        color: Colors.grey.shade900,
                                        height: 60,
                                        width: 370,
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1.5)),
                                            /*focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade700,
                                                    width: 2)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade200)),*/
                                            //labelText: "Email or Phone number",
                                            hintText: "full name",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade400),
                                            //errorText: error ? 'Invalid user' : null,
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.grey.shade500,
                                              size: 20,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            username = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      1.7,
                                      Container(
                                        height: 30,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 15),
                                        child: Text(
                                          "Phone",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      1.8,
                                      Container(
                                        color: Colors.grey.shade900,
                                        height: 60,
                                        width: 370,
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1.5)),
                                            /*focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade700,
                                                    width: 2)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade200)),*/
                                            //labelText: "Email or Phone number",
                                            hintText: "phone number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade400),
                                            //errorText: error ? 'Invalid user' : null,
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(
                                              Icons.phone,
                                              color: Colors.grey.shade500,
                                              size: 20,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            usermob = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      2.1,
                                      Container(
                                        height: 30,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 15),
                                        child: Text(
                                          "Email",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      2.2,
                                      Container(
                                        color: Colors.grey.shade900,
                                        height: 60,
                                        width: 370,
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1.5)),
                                            /*focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade700,
                                                    width: 2)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade200)),*/
                                            //labelText: "Email or Phone number",
                                            hintText: "email",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade400),
                                            errorText:
                                                error ? 'Invalid user' : null,
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.grey.shade500,
                                              size: 20,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              error = false;
                                            });
                                            mail = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      2.5,
                                      Container(
                                        height: 30,
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.only(left: 25, top: 20),
                                        child: Text(
                                          "Password",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    FadeAnimation(
                                      2.6,
                                      Container(
                                        color: Colors.grey.shade900,
                                        width: 370,
                                        height: 60,
                                        child: TextField(
                                          style: TextStyle(color: Colors.white),
                                          obscureText: true,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 1.5)),
                                            /*focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade700,
                                                    width: 2)),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade200)),*/
                                            hintText: "password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade400),
                                            errorText: error1
                                                ? 'Invalid password'
                                                : null,
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.grey.shade500,
                                              size: 20,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              error1 = false;
                                            });
                                            pass = value;
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    FadeAnimation(
                                      2.9,
                                      Container(
                                        //color: Colors.black,
                                        margin: EdgeInsets.only(top: 10),
                                        height: 40,
                                        width: 350,
                                        child: FloatingActionButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          isExtended: true,
                                          backgroundColor: Colors.black,
                                          child: islogged
                                              ? Transform.scale(
                                                  scale: 0.6,
                                                  child:
                                                      CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.white))
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        stops: [
                                                          .3,
                                                          .55
                                                        ],
                                                        colors: [
                                                          Colors.blue,
                                                          Colors.blue.shade900
                                                        ]),
                                                  ),
                                                  height: 40,
                                                  width: 350,
                                                  //color: Colors.white,
                                                  child: Center(
                                                      child: Text("Sign Up"))),
                                          onPressed: () async {
                                            print(pass);
                                            var result;
                                            setState(() {
                                              islogged = true;
                                            });
                                            try {
                                              result = await authc
                                                  .createUserWithEmailAndPassword(
                                                email: mail,
                                                password: pass,
                                              );
                                              print("this is result \n");
                                              print(authc.currentUser
                                                  .uid); //Dnuqhm4MGxRzRKscgSJJzNAZbiF2
                                              print(usermob);
                                              print(username);
                                              print(mail);
                                              await fsconnect
                                                  .collection("user")
                                                  .doc(authc.currentUser.uid)
                                                  .set(
                                                {
                                                  "Name": username,
                                                  "mob": usermob,
                                                  "mail": mail,
                                                },
                                              );
                                            } catch (e) {
                                              print(e);
                                              setState(() {
                                                error = true;
                                              });
                                            }
                                            print(result);
                                            if (result != null) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Terminal();
                                              }));
                                              islogged = false;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    FadeAnimation(
                                      3.1,
                                      Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: GestureDetector(
                                            child: Text(
                                              "Go back to login page",
                                              style: TextStyle(
                                                  color: Colors.grey.shade100),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));

    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Scaffold(body: Authbody));
  }
}
