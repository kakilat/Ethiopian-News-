import 'package:flutter/material.dart';
import 'package:ethionews/View/InternationalNews/InternationalAllNews.dart'as allnews;
import 'package:ethionews/View/InternationalNews/InternationalNewsGallery.dart' as gallery;


class InternationalNews extends StatefulWidget {

  @override
  _InternationalNewsState createState() => _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews>with SingleTickerProviderStateMixin {

  TabController controller;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new TabController(length: 2,vsync: this);
  }
@override
  void dispose() {
   controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("International News",
        ),
      bottom: TabBar(
        controller: controller,
        indicatorColor: Colors.blueGrey,
        indicatorWeight: 5.0,
        tabs: <Widget>[
new Tab(icon: Icon(Icons.view_agenda),text: "News",),
          new Tab(icon: Icon(Icons.image),text: " Gallery",)
        ],
      ),
        backgroundColor: Color(0xFF272B4a),

      ),
      body: TabBarView(
        controller:controller,
        children: <Widget>[
allnews.InternationalNews(),
          gallery.IntrnationalNewsGallery(),
        ],
      ),

    );
  }
}
