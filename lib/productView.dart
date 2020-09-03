import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lenskart_replica/productBuy.dart';
import 'package:url_launcher/url_launcher.dart';

class productView extends StatefulWidget {
  @override
  _productViewState createState() => _productViewState();
}

class _productViewState extends State<productView> {

  bool heartPress = false;
  bool isSwitched = false;
  bool onPressTextInput = false;
  bool valid = true;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                  splashColor: Color.fromRGBO(0, 186, 180, 100),
                  color: Color.fromRGBO(0, 186, 198, 100),
                  child: Text("BUY NOW", style: TextStyle(
                    color: Colors.white,
                  ),),
                  onPressed:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => productBuy()));
                  }
              ),
            ),

      ),
      body: (
          ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 0),
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/4,
                        child: Image(image: AssetImage('assets/product1.jpeg'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/4,
                        child: Image(image: AssetImage('assets/product2.jpeg'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/4,
                        child: Image(image: AssetImage('assets/product3.jpeg'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[350],
                  height: MediaQuery.of(context).size.height/20,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.color_lens, color: Colors.indigoAccent),
                        onPressed: () {

                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.timelapse, color: Colors.white),
                        onPressed: () {

                        },
                      ),
                      SizedBox(width: 150.0,),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.white,),
                        onPressed: () {

                        },
                      ),
                      IconButton(
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
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor: Colors.indigo,
                        activeTrackColor: Colors.indigoAccent,
                      ),


                    ],
                  )
                ),
                Container(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Vincent Chase Kids", ),
                            SizedBox(width: 180.0,),
                            Text("🔥",style: TextStyle(
                              color: Colors.orange[0],
                            ),),
                            Text("282 bought",style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          children: <Widget>[
                            Text("Grey Full Rim Square", ),
                            SizedBox(width: 220.0,),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.teal,
                                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                              ),
                              child: Text("5.0  ★",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          children: <Widget>[
                            Text("₹799",style: TextStyle(
                              color: Color.fromRGBO(0, 186, 198, 100),
                            ),),
                            SizedBox(width: 230.0,),
                            Text("Frame Width: 127nm")
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Delivery Time", style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),

                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 280.0,
                              child: TextFormField(
                                enabled: true,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Enter Pin Code" ,
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
                                  if(number.length < 6) {
                                    setState(() {
                                      valid = false;
                                    });
                                  }
                                  else if(number.length == 10){
                                    setState(() {
                                      valid = true;
                                    });
                                  }

                                },
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            Container(
                              height: 60.0,
                              child: OutlineButton(
                                splashColor: Color.fromRGBO(0, 186, 180, 100),
                                color: Colors.white,
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(0, 186, 198, 100),
                                ),
                                child: Text("Go", style: TextStyle(
                                  color: Colors.black,
                                ),),
                                onPressed:  () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => productView()));
                                } ,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                              child: Text("About the Product", style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),)
                          ),
                          Align(
                            child: Text("Grey Mirror Full Rim Square Kids 8-12 yrs Vincent Chase Kids Rockstars VC S11937 - C2 Sunglasses", style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),),
                          ),
                          SizedBox(height: 10.0,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Product ID: 132705", style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star_half, color: Colors.black, size: 40.0,),
                        SizedBox(width: 30.0,),
                        Text("1 Year Manufacturer Warranty", style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20.0,
                        ),),
                        SizedBox(width: 20.0,),
                        Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.info, color: Colors.black, size: 25.0,),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                              child: Text("Specifications", style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),)
                          ),
                          SizedBox(height: 30.0,),
                          Align(
                            child: Row(
                              children: <Widget>[
                                Text("Frame Width", style: TextStyle(
                                  color: Colors.grey,
                                ),),
                                SizedBox(width: 20.0,),
                                Text("127nm", style: TextStyle(
                                  color: Colors.grey,
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0,),
                          Align(
                            child: Row(
                              children: <Widget>[
                                Text("Weight", style: TextStyle(
                                  color: Colors.grey,
                                ),),
                                SizedBox(width: 55.0,),
                                Text("0.6000", style: TextStyle(
                                  color: Colors.grey,
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0,),
                          Align(
                            child: Row(
                              children: <Widget>[
                                Text("Collection", style: TextStyle(
                                  color: Colors.grey,
                                ),),
                                SizedBox(width: 35.0,),
                                Text("Rockstars", style: TextStyle(
                                  color: Colors.grey,
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(height: 15.0,),
                          Align(
                            child: Row(
                              children: <Widget>[
                                Text("Height", style: TextStyle(
                                  color: Colors.grey,
                                ),),
                                SizedBox(width: 55.0,),
                                Text("40mm", style: TextStyle(
                                  color: Colors.grey,
                                ),)
                              ],
                            ),
                          ),
                          FlatButton(
                            child: Text("SHOW MORE DETAILS", style: TextStyle(
                              color: Color.fromRGBO(0, 186, 198, 100),
                            ),),
                            onPressed: () {

                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Commitment too Quality", style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            child: Text("We at Lenskart are committed to giving you the best quality possible. Give us a try, you'll love us !", style: TextStyle(
                              color: Colors.grey,
                            ),),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                        children: <Widget>[
                                          Icon(Icons.high_quality, size: 50.0, color: Colors.black45,),
                                          SizedBox(height: 15.0,),
                                          Text("1 Year Warranty", style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 14.0,
                                          ),)
                                        ],

                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.store, size: 50.0, color: Colors.black45,),
                                        SizedBox(height: 15.0,),
                                        Text("14 Day Return Policy", style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14.0,
                                        ),)
                                      ],

                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Icon(Icons.supervisor_account, size: 50.0, color: Colors.black45,),
                                        SizedBox(height: 15.0,),
                                        Text("3 Decimal Tested", style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 14.0,
                                        ),)
                                      ],

                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                ),

                ],
          )

      ),
//      floatingActionButton:
//      Container(
//        width: MediaQuery.of(context).size.width,
//        child: FloatingActionButton.extended(
//          backgroundColor: Color.fromRGBO(0, 186, 198, 100),
//          label: Text("BUY NOW", style: TextStyle(
//            color: Colors.white,
//          ),),
//
//          onPressed: () {
//
//          },
//
//        ),
//      ),
//
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
  }
}

