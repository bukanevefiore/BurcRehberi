
import 'package:burcrehberi/burc_liste.dart';
import 'package:burcrehberi/models/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {

  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {

    secilenBurc=BurcListesi.tumBurclar[widget.gelenIndex];
    baskinRengiBul();
    super.initState();
  }


  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletteGenerator= PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenBurc.burcBuyukResim));

    fPaletteGenerator.then((value) {
      paletteGenerator = value;
      debugPrint("secilen renk : " +paletteGenerator.dominantColor.color.toString());

      setState(() {

        baskinRenk =paletteGenerator.dominantColor.color;
      });

    } );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        //primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            // primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenBurc.burcBuyukResim, fit: BoxFit.cover,),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi+" Burcu Ve Özellikleri"),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: Colors.black87,
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Colors.black,
                ),
                child: SingleChildScrollView(
                  child: Text(secilenBurc.burcDetayi, style: TextStyle(fontSize: 18, color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
