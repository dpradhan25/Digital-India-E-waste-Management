import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innobuzz/Pages/LargeApp.dart';
import 'package:innobuzz/Pages/SmallApp.dart';


class Home extends StatefulWidget {
  const Home({Key key, @required this.user, FirebaseUser User}) : super(key: key);
  final AuthResult user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
//            RaisedButton(
//              onPressed: navigateToLargeApp,
//              child: Text('Large Appliances'),
//            ),
//
//            RaisedButton(
//              onPressed: navigateToSmallApp,
//              child: Text('Small Appliances'),
//            ),
            SizedBox(height: 20,),
            makeItem(image: 'assets/images/Largef.png', tag: 'red', context: context),
            makeItem1(image: 'assets/images/smallf.png', tag: 'blue', context: context)

          ],
        ),
      ),
    );
  }


  Widget makeItem({image,tag,context}) {
    return Hero(
        tag: tag,
        child: GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => largeapp(), fullscreenDialog: true));
          },
          child: Container(
            height: 250,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10,
                      offset: Offset(0, 10)
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Large", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Appliances", style: TextStyle(color: Colors.white, fontSize: 20),)

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );

  }
  Widget makeItem1({image,tag,context}) {
    return Hero(
        tag: tag,
        child: GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => smallapp(), fullscreenDialog: true));
          },
          child: Container(
            height: 250,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10,
                      offset: Offset(0, 10)
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Small", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Appliances", style: TextStyle(color: Colors.white, fontSize: 20),),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );

  }
  void navigateToLargeApp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => largeapp(), fullscreenDialog: true));

  }
  void navigateToSmallApp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => smallapp(), fullscreenDialog: true));



  }
}
