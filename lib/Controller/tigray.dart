import 'package:flutter/material.dart';
import 'package:ethionews/View/Tigrigna/TigrayAllNews.dart' as allnews;
import 'package:ethionews/View/Tigrigna/TigrayNewsGallery.dart' as gallery;

class TigrignaNews extends StatefulWidget {
  @override
  _TigrignaNewsState createState() => _TigrignaNewsState();
}

class _TigrignaNewsState extends State<TigrignaNews>
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
        title: Text("Tigrigna"),
        backgroundColor: Color(0xff272b4a),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_agenda),
              text: "Tigrigna News",
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
          allnews.TigrignaAllNews(),
          gallery.TigrignaGallery(),
        ],
      ),
    );
  }
}
