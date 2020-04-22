import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'DtailLatestPost.dart';

class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {



  Future getAllNews() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("AllNews").getDocuments();
    return snap.documents;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222240),
      body: FutureBuilder(
        future: getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "Data Loading....",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          } else {
            return new  Container(
              margin: EdgeInsets.only(left: 10),
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Letest News",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      new SizedBox(
                        height: 5.0,
                      ),
                      new Container(
                        height: 130,
                        color: Color(0xFF272B4A),
                        child: new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                            LatestPostDetail(
                                                snapshot.data[index])));
                              },
                              child: Container(
                                width: 300.0,
                                margin: EdgeInsets.only(left: 10.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: new Image.network(
                                          snapshot.data[index].data["image"],
                                          fit: BoxFit.cover,
                                          height: 130.0,
                                        ),
                                      ),
                                    ),
                                    new SizedBox(
                                      width: 10.0,
                                    ),
                                    new Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            LatestPostDetail(
                                                                snapshot.data[index])));
                                              },
                                              child: new Text(
                                                snapshot.data[index].data["title"],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 22.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            new SizedBox(
                                              height: 5.0,
                                            ),
                                            SingleChildScrollView(
                                              child: new Text(
                                                snapshot.data[index].data["content"],
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 18.0, color: Colors.white),
                                              ),
                                            ),
                                            new SizedBox(
                                              height: 5.0,
                                            ),
                                            new Container(
                                              child: new Row(
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.remove_red_eye,
                                                    color: Colors.deepOrangeAccent,
                                                  ),
                                                  new SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  new Text(
                                                    "View",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );



          }
        },
      ),
    );
  }
}
