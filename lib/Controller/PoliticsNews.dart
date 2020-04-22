import 'package:flutter/material.dart';
import 'package:ethionews/View/PoliticsNews/PoliticsAllNes.dart'as allnews;
import 'package:ethionews/View/PoliticsNews/PoliticsNewsGallery.dart'as gallery;


class PoliticalNews extends StatefulWidget {
  @override
  _PoliticalNewsState createState() => _PoliticalNewsState();
}

class _PoliticalNewsState extends State<PoliticalNews> with SingleTickerProviderStateMixin{
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
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("Political News"),
        backgroundColor: Color(0xff272b4a),
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.view_agenda),
              text: "Political News",
            ),
            Tab(
              icon: Icon(Icons.image),
              text: "Gallery",
            )
          ],
        ),
      ),
      body: WillPopScope(
        child: TabBarView(
          controller: controller,
          children: <Widget>[
            allnews.PoliticalAllNews(),
            gallery.PoliticalGallery(),
          ],
        ),
        onWillPop: (){
          if (_globalKey.currentState.isDrawerOpen) {
            Navigator.pop(context);
            Navigator.of(context).pop();// closes the drawer if opened
            return Future.value(false); // won't exit the app
          } else {
            return Future.value(true); // exits the app
          }
        },
      ),
    );;
  }
}
