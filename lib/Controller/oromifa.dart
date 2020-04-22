import 'package:flutter/material.dart';
import 'package:ethionews/View/oromiffa/OromifaAllNews.dart' as allnews;
import 'package:ethionews/View/oromiffa/OromiffaNewsGallary.dart' as gallery;

class OromifaNews extends StatefulWidget {
  @override
  _OromifaNewsState createState() => _OromifaNewsState();
}

class _OromifaNewsState extends State<OromifaNews>
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
        title: Text("Oromifa"),
        backgroundColor: Color(0xff272b4a),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_agenda),
              text: "Oromifa News",
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
          allnews.OromifaNews(),
          gallery.OromifaNewsGallery(),
        ],
      ),
    );
  }
}
