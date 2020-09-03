import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'customer_details.dart' as globals;
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
//      theme: ThemeData(
//
//        primarySwatch: Colors.blue,
//
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
      home: EasingAnimation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EasingAnimation extends StatefulWidget {
  @override
  _EasingAnimationState createState() => _EasingAnimationState();
}

class _EasingAnimationState extends State<EasingAnimation> with TickerProviderStateMixin{

  Animation animation;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            () => Navigator.pushReplacement(context, MaterialPageRoute(builder:
            (context) => MobileNumberPage()
        )
        )
    );

    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            curve: Curves.fastOutSlowIn,
            parent: animationController
        )
    )..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        animationController.reset();
        animation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            curve: Curves.fastOutSlowIn,

            parent: animationController
          )
        );
        animationController.forward();
      }
    });

    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child){
            return Transform(
              transform: Matrix4.translationValues(0.0, animation.value * deviceHeight, 0.0),
              child:  Image(image: AssetImage('assets/lenskart_logo.jpg'),
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/2,),
            );
          },
        ),
      ),
    );
  }
}

class MobileNumberPage extends StatefulWidget {
  @override
  _MobileNumberPageState createState() => _MobileNumberPageState();
}

bool valid = true;
bool onPressTextInput = false;



class _MobileNumberPageState extends State<MobileNumberPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
        child: Material(
          color: Colors.white,
          child:Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/contact_picture.jpeg',
                ),
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,

              ),
              Icon(Icons.account_circle, size: 150.0,color: Color.fromRGBO(0, 186, 198, 100), ),
              SizedBox(height: 10.0,),
              Column(
                children: <Widget>[
                  Text("Your Mobile Number", style: TextStyle(
                      color: Colors.black, fontSize: 20.0
                  ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
                    child: TextFormField(
                      enabled: true,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter Mobile Number" ,
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 186, 198, 100),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 186, 198, 100),
                          ),
                        ),
                      ),
                      autofocus: true,
                      onChanged: (number) {
                        onPressTextInput = true;
                        if(number.length < 10) {
                          setState(() {
                            valid = false;
                          });
                        }
                        else if(number.length == 10){
                          setState(() {
                            valid = true;
                          });
                        }
                        globals.phoneNumber = number as int;
                      },
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    child: valid ? Text("") : Text("Enter a 10 digit number", style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ) ,
                  SizedBox(height: 20.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 50.0,
                    child: RaisedButton(
                      splashColor: Color.fromRGBO(0, 186, 180, 100),
                      color: Color.fromRGBO(0, 186, 198, 100),
                      child: Text("Continue", style: TextStyle(
                        color: Colors.white,
                      ),),
                      onPressed: valid ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NamePage()));
                      } : null,
                    ),
                  ),

                ],
              ),

            ],
          ),
        )
    );

  }
}

class NamePage extends StatefulWidget {
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
        child: Material(
          child:Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/contact_picture.jpeg',
                ),
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,

              ),
              Icon(Icons.account_circle, size: 150.0,color: Color.fromRGBO(0, 186, 198, 100), ),
              SizedBox(height: 10.0,),
              Column(
                children: <Widget>[
                  Text("Your Name", style: TextStyle(
                      color: Colors.black, fontSize: 20.0
                  ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
                    child: TextFormField(
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: "Enter Name" ,
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(0, 186, 198, 100),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(0, 186, 198, 100),
                          ),
                        ),
                      ),
                      autofocus: true,
                      onChanged: (name) {
                        onPressTextInput = true;
                        globals.customerName = name;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 50.0,
                    child: RaisedButton(
                      splashColor: Color.fromRGBO(0, 186, 180, 100),
                      color: Color.fromRGBO(0, 186, 198, 100),
                      child: Text("Continue", style: TextStyle(
                        color: Colors.white,
                      ),),
                      onPressed: valid ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                      } : null,
                    ),
                  ),

                ],
              ),

            ],
          ),
        )
    );

  }
}

