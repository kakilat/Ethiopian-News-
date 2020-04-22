import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'DtailLatestPost.dart';


class BreakingNews extends StatefulWidget {
  @override
  _BreakingNewsState createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  Future getAllNews() async {
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("Breaking").getDocuments();
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
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Expanded(
                  flex: 1,
                  child: new Container(
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "ሰበር ዜና ",
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.white),
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
                                onTap: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              LatestPostDetail(
                                                  snapshot.data[index])));
                                },
                                child: Container(
                                  width: 300.0,
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: new Row(children: <Widget>[
                                    new Expanded(
                                      flex: 1,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
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
                                                                snapshot.data[
                                                                index])));
                                              },
                                              child: new Text(
                                                snapshot
                                                    .data[index].data["title"],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            new SizedBox(
                                              height: 5.0,
                                            ),
                                            new Text(
                                              snapshot
                                                  .data[index].data["content"],
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white),
                                            ),
                                            new SizedBox(
                                              height: 5.0,
                                            ),
                                            new Container(
                                              child: new Row(
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.remove_red_eye,
                                                    color:
                                                    Colors.deepOrangeAccent,
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
                                        )),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
