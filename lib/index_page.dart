import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage>{
  @override
  void initState() {
    super.initState();
    readCacheData();
  }

  void readCacheData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirst = prefs.getBool('flutter_x_is_first');
    if(isFirst == null || isFirst == false){
      prefs.setBool('flutter_x_is_first', true);
    } else {

    }

    print('hello $isFirst');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              )
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset('images/logo.png', width:24, height:24, fit: BoxFit.contain)
                ),
                SizedBox(width:14),
                Text('flutter-x 欢迎您')
              ]
          ),
    )
        ],
      )
    );
  }
}