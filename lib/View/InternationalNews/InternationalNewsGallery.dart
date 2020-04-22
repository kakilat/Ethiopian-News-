import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../my_string_values.dart';

class IntrnationalNewsGallery extends StatefulWidget {
  @override
  _IntrnationalNewsGalleryState createState() =>
      _IntrnationalNewsGalleryState();
}

class _IntrnationalNewsGalleryState extends State<IntrnationalNewsGallery> {
  Future getAllImage() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap =
        await firestore.collection("InternationalAllNews").getDocuments();
    return snap.documents;
  }

  Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getAllImage();
    });
  }
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
      backgroundColor: Color(0xF222240),
      body: FutureBuilder(
        future: getAllImage(),
        builder: (contxt, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: new CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: getRefresh,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(6),
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              snapshot.data[index].data["image"],
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40.0,
                          left: 30.0,
                          child: Container(
                            height: 50.0,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                "International News",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
