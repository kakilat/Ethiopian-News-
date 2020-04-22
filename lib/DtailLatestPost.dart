import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'my_string_values.dart';

class LatestPostDetail extends StatefulWidget {
  DocumentSnapshot snapshot;
  LatestPostDetail(this.snapshot);
  @override
  _LatestPostDetailState createState() => _LatestPostDetailState();
}

class _LatestPostDetailState extends State<LatestPostDetail> {

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
      appBar: new AppBar(

        title: Text("Detail"),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: new Image.network(
                widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          new SizedBox(
            height: 6.0,
          ),
          new Container(
            color: Color(0xFF272B4A),
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            child: new Column(
              children: <Widget>[

                    new Container(
                      height: 180,

                    margin: EdgeInsets.all(10.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new CircleAvatar(
                          child: new Text(
                            widget.snapshot.data["title"][0],
                            style: TextStyle(fontSize: 21),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        new SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: new Text(
                            widget.snapshot.data["title"],
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),


                Expanded(
                  flex:6,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(widget.snapshot.data["content"],
                      style: TextStyle(
                        fontSize: 16.0,
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
          )
        ],
      ),
    );
  }
}
