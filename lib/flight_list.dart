import 'package:flightapp/CustomShapeClipper.dart';
import 'package:flutter/material.dart';

import 'main.dart';

final Color discountBackgroundColor = Color(0xFFFFE08D);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);



class FlightListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Search Resut'),
        centerTitle: true,
        leading: InkWell(child: Icon(Icons.arrow_back),onTap: (){
          Navigator.pop(context);
        },),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            FlightListTopPart(),
            SizedBox(height: 20.0,),
            FlightListingBottomPart(),
          ],
        ),
      ),
      
    );
  }
}

Color firstColor = Color(0xFFF47D15);
Color secondColor = Color(0xFFEF772C);

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 160.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                elevation: 10.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 22.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                                              child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Boston(BOS)",style:TextStyle(fontSize:16.0)),
                            Divider(color: Colors.grey,height: 20.0,),
                            Text("New York City(JFK)",style:TextStyle(fontSize:16.0,fontWeight:FontWeight.bold))
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(flex: 1,child: Icon(Icons.import_export,color: Colors.black,size: 32.0,))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      );
  }
}


class FlightListingBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,),
            child: Text("Best Deals for Next 6 months",style:dropDownMenuItemStyle),
          )
          ,SizedBox(height: 10.0,),

          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
              FlightCard(),
            ],
          )

        ],
      ),

      
    );
  }
}

class FlightCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
            //height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: flightBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("\$4,159",style:TextStyle(fontSize:20.0,fontWeight:FontWeight.bold)),
                       SizedBox(width: 10.0,),
                       Text("\$5,159",style:TextStyle(fontSize:16.0,fontWeight:FontWeight.normal,decoration: TextDecoration.lineThrough,color: Colors.grey)),
                    
                    ],
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      FlightDetailChip(Icons.calendar_today, "June 2019"),
                      FlightDetailChip(Icons.flight_takeoff, "Jet Airways"),
                      FlightDetailChip(Icons.star, "4.4"),
                    ],
                  )
                ],
              ),
            ),
          
        ),

        Positioned(
          top: 10,
          right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  decoration: BoxDecoration(
                    color: discountBackgroundColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
            child: Text("55%",style:TextStyle(
              color:appTheme.primaryColor,
              fontSize:14.0,
              fontWeight: FontWeight.bold
            )),
          ),
        )


          ],
      ),
    );
  }
}


class FlightDetailChip extends StatelessWidget {
  final iconData;
  final label;

  FlightDetailChip(this.iconData,this.label);
  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black,fontSize: 14.0),
      backgroundColor: chipBackgroundColor,
      avatar: Icon(iconData),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}