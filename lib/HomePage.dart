import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'specsDisplay.dart';
import 'customer_details.dart' as globals;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
        child: Scaffold(
          drawer: NavDrawer(),
          appBar: MyCustomAppBar(
            height: 120,
          ),
          body: (
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
               child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/ad1.jpeg'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/ad2.jpeg'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/ad3.jpeg'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/ad4.jpeg'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/ad5.jpeg'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/ad6.jpeg'),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: MediaQuery.of(context).size.height/2.9,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  body: Column(
                    children: <Widget>[
                      Container(
                        child: Column(

                          children: <Widget>[
                            Container(
                              height: 60,
                              child: TabBar(
                                tabs: <Widget>[
                                  Container(
                                    color: Color.fromRGBO(0, 186, 198, 2.0),
                                    width: 70.0,
                                    child: Text("MEN", style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                    ),
                                  ),
                                  Container(
                                    color: Color.fromRGBO(0, 186, 198, 2.0),
                                    width: 75.0,
                                    child: Text("WOMEN", style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),),
                                  ),
                                  Container(
                                    color: Color.fromRGBO(0, 186, 198, 2.0),
                                    width: 75.0,
                                    child: Text("KIDS", style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),),
                                  ),
                                ],
                                unselectedLabelColor: Colors.blue,
                                indicatorColor: Color.fromRGBO(0, 186, 198, 2.0),

                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight: 3.0,
                                indicatorPadding: EdgeInsets.all(5.0),
                                isScrollable: true,
                                controller: _tabController,

                              ),
                            ),
                            Container(
                              height: 240,
                              child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 0.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(

                                                width: MediaQuery.of(context).size.width/3,
                                                child: Column(
                                                  children: <Widget>[
                                                    Image(image: AssetImage('assets/men6.jpeg'),
                                                    ),
//                                              SizedBox(height: 2.0,),
                                                    FlatButton(
                                                      child:  Text("Eyeglasses", style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),),
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                      },
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Container(

                                                width: MediaQuery.of(context).size.width/3,
                                                child: Column(
                                                  children: <Widget>[
                                                    SizedBox(height: 15.0,),
                                                    Image(image: AssetImage('assets/men5.jpeg'),
                                                    ),
//                                              SizedBox(height: 2.0,),
                                                    FlatButton(
                                                      child:  Text("Phone/PC", style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),),
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(

                                                width: MediaQuery.of(context).size.width/3,
                                                child: Column(
                                                  children: <Widget>[
                                                    SizedBox(height: 25.0,),
                                                    Image(image: AssetImage('assets/men4.jpeg'),
                                                    ),
//                                              SizedBox(height: 2.0,),
                                                    FlatButton(
                                                      child:  Text("Contact Lenses", style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),),
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(

                                                width: MediaQuery.of(context).size.width/3,
                                                height: 100.0,
                                                child: Column(
                                                  children: <Widget>[
                                                    Image(image: AssetImage('assets/men3.jpeg'),
                                                    ),
//                                              SizedBox(height: 2.0,),
                                                    FlatButton(
                                                      child:  Text("Sunglasses", style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),),
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(

                                                width: MediaQuery.of(context).size.width/3,
                                                height: 80.0,
                                                child: Column(
                                                  children: <Widget>[
//                                                SizedBox(height: 0.0,),
                                                    Image(image: AssetImage('assets/men2.jpeg'),
                                                    ),
//                                              SizedBox(height: 2.0,),

                                                  ],
                                                ),
                                              ),
                                              Container(

                                                width: MediaQuery.of(context).size.width/3,
                                                child: Column(
                                                  children: <Widget>[
                                                    SizedBox(height: 25.0,),
                                                    Image(image: AssetImage('assets/men1.jpeg'),
                                                    ),
//                                              SizedBox(height: 2.0,),
                                                    FlatButton(
                                                      child:  Text("Reading Eyeglasses", style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),),
                                                      onPressed: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )

                                        ],
                                      ),
                                    )
                                  ),

                                  Container(
                                   child:  Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  Image(image: AssetImage('assets/women6.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Eyeglasses", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 15.0,),
                                                  Image(image: AssetImage('assets/women5.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Phone/PC", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 25.0,),
                                                  Image(image: AssetImage('assets/men4.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Contact Lenses", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  Image(image: AssetImage('assets/women3.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Sunglasses", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 15.0,),
                                                  Image(image: AssetImage('assets/men2.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),

                                                ],
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 25.0,),
                                                  Image(image: AssetImage('assets/women2.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Reading Eyeglasses", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                  Container(
                                    child:  Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  Image(image: AssetImage('assets/kid3.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Eyeglasses", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 15.0,),
                                                  Image(image: AssetImage('assets/kid2.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Sunglasses", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width/3,
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 25.0,),
                                                  Image(image: AssetImage('assets/kid1.jpeg'),
                                                  ),
//                                              SizedBox(height: 2.0,),
                                                  FlatButton(
                                                    child:  Text("Zero Power", style: TextStyle(
                                                      fontSize: 10.0,
                                                    ),),
                                                    onPressed: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => specsDisplay()));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),


                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/8,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Protect Your Kids Eyes", style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("With BLU Smartphone Lenses", style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.blue,
                            ),),
                            Text("Starting at ₹499", style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),)
                          ],
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/2.1,
                          child: Image(image: AssetImage('assets/kidAd1.jpeg'),
                          ),
                        ),


                      ],
                    ),


              ),
              SizedBox(height: 30.0,),

              Container(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/appAd1.jpeg'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      child: Image(image: AssetImage('assets/appAd2.jpeg'),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Image(image: AssetImage('assets/locationPic.jpeg'),
                        ),
              ),
                        SizedBox(width: 8.0,),
                        Column(
                          children: <Widget>[
                            Text("Please share your location" ),
                            Text("to see nearby stores"),
                            RaisedButton(
                              splashColor: Color.fromRGBO(0, 186, 180, 100),
                              color: Color.fromRGBO(0, 186, 198, 100),
                              child: Text("Enable Location", style: TextStyle(
                                color: Colors.white,
                              ),),
                              onPressed: () {

                              } ,
                            ),
                          ],
                        ),


                  ],

                ),
              SizedBox(height: 30.0,),
//              Container(
//                  child: ConstrainedBox(
//                    constraints: BoxConstraints.expand(),
//                    child: FlatButton(
//                      onPressed: () {
//
//                      },
//                      padding: EdgeInsets.all(0.0),
//                      child: Container(
//                        width: MediaQuery.of(context).size.width,
//                        child: Image(image: AssetImage('assets/appAd1.jpeg'),
//                      ),
//
//                      ),
//                    ),
//                  ),
//                ),
              Container(
                height: MediaQuery.of(context).size.height/8,
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage('assets/appAd5.jpeg'),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                height: MediaQuery.of(context).size.height/8,
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage('assets/videoAd3.jpeg'),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                height: MediaQuery.of(context).size.height/8,
                width: MediaQuery.of(context).size.width,
                child: Image(image: AssetImage('assets/appAd6.jpeg'),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/6.5,
                color: Color.fromRGBO(11, 24, 33, 1.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text("Can we Help?", style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.textsms, color: Colors.white,),
                                  SizedBox(width: 10.0,),
                                  Text("CONTACT US", style: TextStyle(
                                    color: Color.fromRGBO(0, 186, 198, 100),
                                  ),
                                  ),
                                ],
                              ),
                            ),

                            InkWell(
                              child: Text("LENSKART.COM", style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13.0,
                                decoration: TextDecoration.underline,
                              ),),
                              onTap: () {
                                launch('https://www.lenskart.com/contacts');
                              },
                            ),

                          ],
                        ),
                        SizedBox(width: 100.0,),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.mail, color: Colors.white),
                                  SizedBox(width: 10.0,),
                                  Text("EMAIL",style: TextStyle(
                                    color: Color.fromRGBO(0, 186, 198, 100),
                                    fontSize: 15.0,
                                  ),)
                                ],
                              ),
                              SizedBox(height: 5.0,),
                              InkWell(
                                child: Text('support@lenskart.com',style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.underline,
                                ),),
                                onTap: () {
                                  _launchURL('support@lenskart.com', 'Customer Review', '');
                                },
                              ),

                            ],
                          ),
                        ),
                      ],

                    ),


                  ],
                ),
              )


            ],

          )

              ),
//          floatingActionButton:
//          Stack(
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  Container(
//                    width: 90.0,
//                    child: FloatingActionButton(
//                        heroTag: 0,
//                        backgroundColor: Colors.white,
//
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.all(Radius.circular(16.0))
//                        ),
//                        onPressed: () {
//
//                        },
//                        child: Column(
//                          children: <Widget>[
//                            Icon(Icons.remove_red_eye, color: Colors.indigoAccent,),
//                            SizedBox(height: 10.0,),
//                            Text("FRAME SIZE", style: TextStyle(
//                              fontSize: 7.5,
//                              color: Colors.indigoAccent,
//                            ),),
//                          ],
//                        )
//
//                    ),
//                  ),
//                  SizedBox(width: 15.0,),
//                  Container(
//                    width: 90.0,
//                    child: FloatingActionButton(
//                        heroTag: 1,
//                        backgroundColor: Colors.white,
//
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.all(Radius.circular(16.0))
//                        ),
//                        onPressed: () {
//
//                        },
//                        child: Column(
//                          children: <Widget>[
//                            Icon(Icons.remove_red_eye, color: Colors.indigoAccent,),
//                            SizedBox(height: 10.0,),
//                            Text("FRAME SIZE", style: TextStyle(
//                              fontSize: 7.5,
//                              color: Colors.indigoAccent,
//                            ),),
//                          ],
//                        )
//
//                    ),
//                  ),
//                  SizedBox(width: 15.0,),
//                  Container(
//                    width: 90.0,
//                    child: FloatingActionButton(
//                        heroTag: 2,
//                        backgroundColor: Colors.white,
//
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.all(Radius.circular(16.0))
//                        ),
//                        onPressed: () {
//
//                        },
//                        child: Column(
//                          children: <Widget>[
//                            Icon(Icons.remove_red_eye, color: Colors.indigoAccent,),
//                            SizedBox(height: 10.0,),
//                            Text("FRAME SIZE", style: TextStyle(
//                              fontSize: 7.5,
//                              color: Colors.indigoAccent,
//                            ),),
//                          ],
//                        )
//
//                    ),
//                  ),
//                  SizedBox(width: 15.0,),
//                  Container(
//                    width: 90.0,
//                    child: FloatingActionButton(
//                        heroTag: 0,
//                        backgroundColor: Colors.white,
//
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.all(Radius.circular(16.0))
//                        ),
//                        onPressed: () {
//
//                        },
//                        child: Column(
//                          children: <Widget>[
//                            Icon(Icons.remove_red_eye, color: Colors.indigoAccent,),
//                            SizedBox(height: 10.0,),
//                            Text("FRAME SIZE", style: TextStyle(
//                              fontSize: 7.5,
//                              color: Colors.indigoAccent,
//                            ),),
//                          ],
//                        )
//
//                    ),
//                  ),
//
//                ],
//              ),
//
//
//            ],
//          ),
//
//          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,


        ),

        );

  }
}

class MyAppBarForInBetween extends StatelessWidget implements PreferredSizeWidget{

  final double tabHeight;

  const MyAppBarForInBetween({
    Key key,
    @required this.tabHeight,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: tabHeight),
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Text("MEN", style: TextStyle(
                          color: Colors.blue,
                        ),),
                      ),
                      Tab(
                        child: Text("WOMEN", style: TextStyle(
                          color: Colors.blue,
                        ),),
                      ),
                      Tab(
                        child: Text("KIDS", style: TextStyle(
                          color: Colors.blue,
                        ),),
                      ),
                    ],
                  ),

                ),

              ),
            ),
          ),
        ),
      ],
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(tabHeight);
}


class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(11, 24, 33, 1.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: AppBar(
              backgroundColor: Color.fromRGBO(11, 24, 33, 1.0),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_balance_wallet),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {

                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {

                  },
                ),

              ],
            ),

          ),

        ),

      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.contacts, size: 75.0,color: Color.fromRGBO(34, 100, 144, 100),),
                    SizedBox(width: 50.0,),
                    Text("${globals.customerName}", style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),

                Row(
                  children: <Widget>[
                    Container(
                      width: 90.0,
                      child: RaisedButton(
                          color: Colors.blueGrey,
                          child: Text("My account", style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0
                          ),),
                          onPressed: () {

                          }
                      ),
                    ),

                    SizedBox(width: 20.0,),
                    Container(
                      width: 140.0,
                      child: RaisedButton(
                          color: Colors.blueGrey,
                          child: Text("Get Gold Membership", style: TextStyle(
                            color: Colors.yellow,
                              fontSize: 11.0
                          ),),
                          onPressed: () {

                          }
                      ),
                    )
                  ],

                ),
              ],
            ),


            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/profile_background.jpg")
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text("Your Orders"),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.remove_red_eye),
            title: Text('Eye Glasses'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Sun Glasses'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.event_note),
            title: Text('Powered Sunglasses'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.lens),
            title: Text('Powered Contact Lenses'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Avail Gold at Store'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Services'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Rate Us'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.screen_share),
            title: Text('Agent Screen Share'),
            onTap: () => {

            },
          ),
        ],
      ),
    );
  }
}

