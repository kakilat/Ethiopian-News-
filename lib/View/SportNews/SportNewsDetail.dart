import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import '../../my_string_values.dart';


class SportDetail extends StatefulWidget {
  DocumentSnapshot snapshot;

  SportDetail(this.snapshot);
  @override
  _SportDetailState createState() => _SportDetailState();
}

class _SportDetailState extends State<SportDetail> {

  MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['wallpepares', 'walls', 'amoled'],
    birthday: new DateTime.now(),
    childDirected: true,
  );

  MyStringValues myStringValues=new MyStringValues();

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: myStringValues.change_val_unit_id,
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("Banner Event ");
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAdMob.instance
        .initialize(appId: myStringValues.change_val_app_id);
    _bannerAd = createBannerAd()
      ..load()
      ..show();

    // _bannerAd.dispose();
    super.initState();
  }
  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tigrigna News Detail"
        ),
        backgroundColor: Color(0xff222240),
      ),
      backgroundColor: Color(0xff222240),
      body: ListView(
        children: <Widget>[

          new Container(
            height: 250,
            margin: EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,),
            ),
          ),

          SizedBox(height: 7.0,),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Color(0xFF272B4a),
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
            ),
            child: Card(
              elevation: 10.0,
              color: Color(0xFF272B4a),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(

                    margin:EdgeInsets.all(5) ,
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          child:Text( widget.snapshot["title"][0]),
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(width: 6,),
                        Expanded(
                          child: Text(widget.snapshot["title"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(6) ,
                    child: Text("52 views",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrangeAccent
                      ),),
                  ),
                  SizedBox(height: 10.0,),
                  Expanded(
                    flex:6,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.all(6.0),
                        child: Text(widget.snapshot["content"],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Container(),
                  )
                ],
              ),

            ),
          ) ],
      ),

    );
  }
}
