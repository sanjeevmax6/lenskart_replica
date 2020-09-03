import 'package:flutter/material.dart';

class productBuy extends StatefulWidget {
  @override
  _productBuyState createState() => _productBuyState();
}

class _productBuyState extends State<productBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 24, 33, 1.0),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            child: Card(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Order Total(incl. GST", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0
                      ),),
                    ),
                    ),

                  Padding(

                    padding: EdgeInsets.all(5.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text("₹2000", style: TextStyle(
                        color: Color.fromRGBO(0, 186, 198, 100),
                        fontSize: 20.0
                    ),),
                    ),


                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
