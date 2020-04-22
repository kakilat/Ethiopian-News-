import 'package:flutter/material.dart';
import 'package:ethionews/View/LocalnNews/localAllNews.dart' as allnews;
import 'package:ethionews/View/LocalnNews/localNewsGallery.dart' as gallery;

class LocalNews extends StatefulWidget {
  @override
  _LocalNewsState createState() => _LocalNewsState();
}

class _LocalNewsState extends State<LocalNews>
    with SingleTickerProviderStateMixin {
  TabController controller;


  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local News"),
        backgroundColor: Color(0xff272b4a),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_agenda),
              text: "Local News",
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
          allnews.LocalAllNews(),
          gallery.LocalNewsGallery(),
        ],
      ),
    );
  }
}
