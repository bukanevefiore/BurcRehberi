import 'package:burcrehberi/burc_detay.dart';
import 'package:burcrehberi/burc_liste.dart';
import 'package:burcrehberi/models/burc.dart';
import 'package:burcrehberi/utils/strings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,

      initialRoute: "/burcListesi",

      routes: {
        "/": (context) => BurcListesi(),
        "/burcListesi" : (context) => BurcListesi(),

      },

      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemenlari=settings.name.split("/");
        if(pathElemenlari[1] == 'burcDetay'){
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathElemenlari[2])));
        }
        return null;
      },

      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      //home: BurcListesi(),
    );
  }


}
