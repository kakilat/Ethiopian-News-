import 'package:carousel_pro/carousel_pro.dart';
import 'package:ethionews/Controller/oromifa.dart';
import 'package:ethionews/my_string_values.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'Addnews.dart';
import 'Controller/InternationalNews.dart';
import 'Controller/LocalNews.dart';
import 'Controller/PoliticsNews.dart';
import 'Controller/SportNews.dart';
import 'Controller/tigray.dart';
import 'DtailLatestPost.dart';
import 'allnewsMain.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshot;
  CollectionReference collectionReference =
      Firestore.instance.collection("LatestNews");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription = collectionReference.snapshots().listen((datasnap) {
      setState(() {
        snapshot = datasnap.documents;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
   // _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: Text("ወቅታዊ መረጃ"),
        backgroundColor: Color(0xFF222240),
      ),
      drawer: new Drawer(
        child: Container(
          color: Color(0xFF272B4A),
          child: new ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(""),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'image/navi.jpg',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              new ListTile(
                title: new Text(
                  "አለም አቀፍ ዜናዎች",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: new Icon(
                  Icons.language,
                  color: Colors.blueGrey,
                ),
                leading: Icon(Icons.info_outline,
                  color: Colors.black38,),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InternationalNews()));
                },
              ),
              new ListTile(
                title: new Text(
                  "ስፖርት ዜናዎች ",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: new Icon(
                  Icons.directions_run,
                  color: Colors.blueGrey,
                ),
                leading: Icon(Icons.info_outline,
                  color: Colors.black38,),
                onTap: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => SportNews()));
                },
              ),
              new ListTile(
                title: new Text(
                  "የፖለቲካ ዜናዎች ",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: new Icon(
                  Icons.nature_people,
                  color: Colors.blueGrey,
                ),
                leading: Icon(Icons.info_outline,
                  color: Colors.black38,),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => PoliticalNews()));
                },
              ),
              new ListTile(
                title: new Text(
                  "የሃገር ውስጥ ዜናዎች ",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: new Icon(
                  Icons.local_activity,
                  color: Colors.blueGrey,
                ),
                leading: Icon(Icons.info_outline,
                  color: Colors.black38,),
                onTap: () {

                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => LocalNews()));
                 
                },
              ),
              Container(

                child:  ListTile(
                    title: Text("Share App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),),
                    trailing: Icon(Icons.share,
                      color: Colors.lightBlueAccent,),

                    //color: Color.fromRGBO(58, 66, 86, 1.0),
                    onTap: () {
                      Share.share('check out my website https://play.google.com/store/apps/details?id=instant.ethionews');
                    },
                  ),

              ),

              Container(

                child:  ListTile(
                  title: Text("Other Apps",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),),
                  trailing: Icon(Icons.android,
                    color: Colors.lightBlueAccent,),
                  //color: Color.fromRGBO(58, 66, 86, 1.0),
                  onTap: () {
                    launch('https://play.google.com/store/apps/developer?id=Instant+Systems');
                  },
                ),

              ),

              new ListTile(
                title: new Text(
                  "Add News ",
                  style: TextStyle(color: Colors.white),
                ),
                leading: new Icon(
                  Icons.local_activity,
                  color: Colors.blueGrey,
                ),
                onTap: () {

                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => SetupInformation()));

                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF222240),
      body:  new Column(
          children: <Widget>[
            //AllNews(),
            Container(
              height: 195,
              child: AllNews(),
            ),
            Expanded(

                child: Container(
                  height: 140,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(7),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFF272B4A),
                                      ),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>
                                                    OromifaNews()));
                                          },
                                          child: Text(
                                            "Afan Oromoo",
                                            style: TextStyle(
                                                fontSize: 19, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xFF272B4A),
                                      ),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        TigrignaNews()));
                                          },
                                          child: Text(
                                            "Tigrigna",
                                            style: TextStyle(
                                                fontSize: 19, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),

                            //
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            //Second Container Crsol Slider
            Expanded(
              flex:2 ,
              child: new Container(
                margin: EdgeInsets.all(0.0),

                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 6.0,
                    dotIncreasedColor: Color(0xFF222240),
                    dotBgColor: Colors.transparent,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 10.0,
                    dotColor: Colors.blue,
                    showIndicator: true,
                    borderRadius: true,
                    indicatorBgPadding: 7.0,
                    images: [
                      Image.asset(
                        'logos/ebs.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'logos/arts.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'logos/ahadu.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'logos/ebc.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'logos/fana.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'logos/jtv.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'logos/kana.jpg',
                        fit: BoxFit.cover,
                      ), Image.asset(
                        'logos/ltv.jpg',
                        fit: BoxFit.cover,
                      ), Image.asset(
                        'logos/nahu.png',
                        fit: BoxFit.cover,
                      ), Image.asset(
                        'logos/walta.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Second Container Carsol slider end
            //Second Container Carsol slider end

            new SizedBox(
              height: 6,
            ),
            //Third Container
            Expanded(
              flex: 1,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(7),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF272B4A),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) =>
                                                InternationalNews()));
                                      },
                                      child: Text(
                                        "አለም አቀፍ ዜና",
                                        style: TextStyle(
                                            fontSize: 19, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF272B4A),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    PoliticalNews()));
                                      },
                                      child: Text(
                                        "የፖለቲካ ዜናዎች ",
                                        style: TextStyle(
                                            fontSize: 19, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF272B4A),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) => LocalNews()));
                                      },
                                      child: Text(
                                        "ሃገር ውስጥ ዜናዎች ",
                                        style: TextStyle(
                                            fontSize: 19, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xFF272B4A),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (context) => SportNews()));
                                      },
                                      child: Text(
                                        "የስፖርት መረጃ ",
                                        style: TextStyle(
                                            fontSize: 19, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ],
                          ),
                        )
                        //
                      ],
                    ),
                  ),
                ],
              )
            )

            //Third Container
          ],
        ),
    );
  }
}
