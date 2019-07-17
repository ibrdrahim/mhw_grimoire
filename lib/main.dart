import 'package:flutter/material.dart';
import 'package:mhw_grimoire/monsterPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: ''),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            //leading: Icon(Icons.home),
            backgroundColor: Colors.orange,
            title: Text("MHW Grimoire")),
        body:
         ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              CardMenu(title: "Monster",icon: "assets/images/commons/monster.png",color: Colors.greenAccent,navigation: ""),
              CardMenu(title: "Armor",icon: "assets/images/commons/armor.png",color: Colors.grey,navigation: ""),
              CardMenu(title: "Weapon",icon: "assets/images/commons/weapon.png",color: Colors.blue,navigation: ""),
              CardMenu(title: "Location",icon:"assets/images/commons/location.jpg",color: Colors.redAccent,navigation: ""),
            ],
        ));
  }
}

class CardMenu extends StatelessWidget {

  CardMenu({this.title,this.icon,this.color,this.navigation});

  final String title;
  final String icon;
  final Color color;
  final String navigation;

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: (){

        if (this.title == "Monster") {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => MonsterPage(title:this.title,color:this.color)),
          );
        } else {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => 
              Scaffold(
                appBar: AppBar(title: Text(this.title)),
                body: Center(child : Text("Coming Soon",style: TextStyle(fontSize: 40,color: Colors.blue),)),
              )
            ),
          );
        }
      },
      child: 
        Card( 
          child: Column(
            children: <Widget>[
              Image.asset(icon,height: 100,),
              Text(this.title,
              style: new TextStyle(color: this.color, fontSize: 28.0))
            ],
          ),
        )
    );
  }
}