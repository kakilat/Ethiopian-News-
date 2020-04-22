import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class TigrignaGallery extends StatefulWidget {
  @override
  _TigrignaGalleryState createState() => _TigrignaGalleryState();
}

class _TigrignaGalleryState extends State<TigrignaGallery> {
  Future getAllImage()async{
    var firebase=Firestore.instance;

    QuerySnapshot snapshot =await firebase.collection("TigrignaNews").getDocuments();
    return snapshot.documents;
  }

  Future<Null> getRefresh()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getAllImage();
    });
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
                                "Sport News",
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
    );;
  }
}
