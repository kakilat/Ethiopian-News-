import 'package:flutter/material.dart';

import 'package:ethionews/View/SportNews/SportAllNews.dart'as allnews;
import 'package:ethionews/View/SportNews/SportNewsGallery.dart' as gallery;



class SportNews extends StatefulWidget {
  @override
  _SportNewsState createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews>with SingleTickerProviderStateMixin{
  TabController controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new TabController(length: 2,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sport News"),
        backgroundColor: Color(0xff272b4a),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_agenda),
              text: "Sport News",
            ),
            Tab(
              icon: Icon(Icons.image),
              text: "Gallery",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          allnews.SportAllNews(),
          gallery.SportGallerry(),
        ],
      ),
    );;
  }
}
