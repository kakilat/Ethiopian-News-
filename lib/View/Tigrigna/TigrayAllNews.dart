import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import 'dart:async';

import 'TigrayNewsDtail.dart';

class TigrignaAllNews extends StatefulWidget {
  @override
  _TigrignaAllNewsState createState() => _TigrignaAllNewsState();
}

class _TigrignaAllNewsState extends State<TigrignaAllNews> {
  Future getAllNews() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap =
    await firestore.collection("TigrignaNews").getDocuments();

    return snap.documents;
  }

  Future<Null> onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getAllNews();
    });
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
            return RefreshIndicator(
              onRefresh: onRefresh,
              backgroundColor: Colors.indigo,
              color: Colors.white,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                        key: ValueKey(index),
                        actionPane: SlidableDrawerActionPane(),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            caption: 'Share News',
                            color: Colors.blueGrey,
                            icon: Icons.share,
                          ),

                        ],
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>
                                TigrignaDtail(snapshot.data[index])));
                          },
                          child: Container(
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: Color(0xff272b4a),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(6),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      snapshot.data[index].data["image"],
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[index].data["title"],
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 6.0,
                                            ),
                                            Text(
                                              snapshot
                                                  .data[index].data["content"],
                                              maxLines: 3,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.remove_red_eye,
                                                    color:
                                                    Colors.deepOrangeAccent,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(                                                      "Views",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>
                                                    TigrignaDtail(snapshot.data[index])));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    color: Colors.blueGrey),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "View Details",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            );
          }
        },
      ),
    );
  }
}

