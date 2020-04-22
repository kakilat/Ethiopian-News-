import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InternationalNewsDetail extends StatefulWidget {
  DocumentSnapshot snapshot;

  InternationalNewsDetail(this.snapshot);

  @override
  _InternationalNewsDetailState createState() =>
      _InternationalNewsDetailState();
}

class _InternationalNewsDetailState extends State<InternationalNewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
        backgroundColor: Color(0xFF222241),
      ),
      backgroundColor: Color(0xff222240),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 250,
            margin: EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.snapshot.data["image"],
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //fIRST cONTAINER
          SizedBox(
            height: 7.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Color(0xFF272B4a),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Card(
              elevation: 10.0,
              color: Color(0xFF272B4a),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          child: Text(widget.snapshot["title"][0]),
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Text(
                            widget.snapshot["title"],
                            maxLines: 3,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(6),
                    child: Text(
                      "views",
                      style: TextStyle(
                          fontSize: 20, color: Colors.deepOrangeAccent),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
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
          )
        ],
      ),
    );
  }
}
