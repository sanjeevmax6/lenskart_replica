import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'productView.dart';
import 'customer_details.dart' as globals;

class specsDisplay extends StatefulWidget {
  @override
  _specsDisplayState createState() => _specsDisplayState();
}

class _specsDisplayState extends State<specsDisplay> with TickerProviderStateMixin {


  bool heartPress = false;

  TabController _tabController;



  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      body: (
      Column(
        children: <Widget>[
          Card(
            child: Row(
              children: <Widget>[
                SizedBox(width: 50.0,),
                RaisedButton(
                  child: Text("FIND MY FIT", style: TextStyle(
                    color: Colors.black45,
                  ),),
                  splashColor: Colors.white30,
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                SizedBox(width: 30.0,),
                RaisedButton(
                  child: Text("CREATE 3D", style: TextStyle(
                    color: Colors.black45,
                  ),),
                  splashColor: Colors.white30,
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                SizedBox(width: 5.0,),
                Container(
                  child: FlatButton(
                    child: globals.gridViewOn ? Icon(Icons.list) : Icon(Icons.grid_on),
                    onPressed: () {
                      setState(() {
                        if(globals.gridViewOn){
                          globals.gridViewOn = false;
                        }
                        else{
                          globals.gridViewOn = true;
                        }
                      });
                    },
                  ),

                ),

              ],
            ),
          ),
          TabBar(
            labelColor: Colors.yellow,
            tabs: <Widget>[
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/20,
                child: Text("FITS MY FACE", style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black45,
                ),
                ),
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.height/20,
                child: Text("ALL SIZES", style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black45,
                ),
                ),
              ),
            ],
            indicatorColor: Colors.yellow,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3.0,
            isScrollable: true,
            controller: _tabController,
          ),
          Expanded(

            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 100.0),
                          child: Icon(Icons.error, size: 200.0, color: Colors.grey,),
                        ),
                        Text("No Products To Show !!", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25.0,
                        ),),
                        SizedBox(width: 20.0,),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child:Text("OOPS !! Unfortunately the App Developer wasn't able to configure face recognition software in this app..."
                              "He might be able to do in future !! CHINS UP ", style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),),
                        ),




                      ],
                    ),
                  ),
                ),
                globals.gridViewOn ? GridView.count(
                  childAspectRatio: ((MediaQuery.of(context).size.width/2)/(MediaQuery.of(context).size.height/2.58)),
                  crossAxisCount: 2,
                  primary: false,
                  padding: EdgeInsets.all(20.0),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                    myGridItem(),
                  ],
                ):
              ListView(
                children: <Widget>[
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                  myGridItem(),
                ],
              ),
              ],
            ),
          ),
        ],
      )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list, color: Colors.white,),
        onPressed: () {

        },
        backgroundColor: Color.fromRGBO(0, 186, 198, 100),
        elevation: 50.0,

      ),



    );
  }
}

class myGridItem extends StatefulWidget {
  @override
  _myGridItemState createState() => _myGridItemState();
}

class _myGridItemState extends State<myGridItem> {

  bool heartPress = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: heartPress ? Icon(Icons.favorite, color: Colors.pink,) : Icon(Icons.favorite_border, color: Colors.black,),
                  onPressed: () {
                    setState(() {
                      if(heartPress){
                        heartPress = false;
                      }
                      else{
                        heartPress = true;
                      }
                    });
                  },
                ),
              ),
              Container(
                height: globals.gridViewOn ? 100.0 : 200.0,
                child: Image(image: AssetImage('assets/specs.jpeg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Align(
                  alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                  child: Text("Vincent Chase Kids",style: TextStyle(
                      fontSize: 15.0
                  ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                    alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                    child: Text("₹799",style: TextStyle(
                      color: Color.fromRGBO(0, 186, 198, 100),
                    ),)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child:  Align(
                  alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                  child: Text("Fits-Face Width:",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),

             Padding(
               padding: EdgeInsets.only(left: 10.0),
               child:  Align(
                 alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                 child: Text("118-128mm",style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
               ),
             ),
             Padding(
               padding: EdgeInsets.only(left: 10.0),
               child: Align(
                 alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                 child: Text("Frame Width: 123mm",style: TextStyle(
                   color: Colors.blueGrey,
                   fontWeight: FontWeight.normal,
                 ),
                 ),
               ),
             ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.teal,
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          ),
                          child: Text("5.0★",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      ),

                      SizedBox(width: 15.0,),
                      Padding(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Align(
                          alignment: globals.gridViewOn? Alignment.topLeft : Alignment.center,
                          child: Text("🔥",style: TextStyle(
                            color: Colors.orange[0],
                          ),),
                        ),
                      ),


                      Text("282 bought",style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),),

                    ],
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/2,
                child: OutlineButton(
                  splashColor: Color.fromRGBO(0, 186, 180, 100),
                  color: Colors.white,
                  borderSide: BorderSide(
                    color: Color.fromRGBO(0, 186, 198, 100),
                  ),
                  child: Text("View  More", style: TextStyle(
                    color: Colors.black,
                  ),),
                  onPressed:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => productView()));
                  } ,
                ),
              ),

            ],
          ),
        );
  }
}

