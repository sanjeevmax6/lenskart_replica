import 'dart:async';

import 'package:flutter/material.dart';

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
            (context) => SplashScreen()
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
    );

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

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("reached")),
      body: Center(
        child: Text("Home Page", textScaleFactor: 2,),
      ),
    );
  }
}

