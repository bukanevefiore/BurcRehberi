import 'package:burcrehberi/burc_liste.dart';
import 'package:burcrehberi/models/burc.dart';
import 'package:burcrehberi/utils/strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    WidgetsApp.debugAllowBannerOverride=false;
    return MaterialApp(
      title: "Burç Rehberi",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BurcListesi(),
    );
  }


}
