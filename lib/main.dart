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
        body: Container(
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardMenu(title: "Monster",icon: Icons.android,color: Colors.greenAccent,navigation: ""),
              CardMenu(title: "Equip",icon: Icons.settings_input_component,color: Colors.grey,navigation: ""),
              CardMenu(title: "Weapon",icon: Icons.ac_unit,color: Colors.blue,navigation: ""),
              CardMenu(title: "Location",icon: Icons.location_on,color: Colors.redAccent,navigation: ""),
            ],
          )
        ));
  }
}

class CardMenu extends StatelessWidget {

  CardMenu({this.title,this.icon,this.color,this.navigation});

  final String title;
  final IconData icon;
  final Color color;
  final String navigation;

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: (){
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => MonsterPage(title:this.title,color:this.color)),
        );
      },
      child: 
        Card( 
                    child: Column(
                      children: <Widget>[
                        Icon(this.icon,size: 50,color: this.color),
                        Text(this.title,
                        style: new TextStyle(color: this.color, fontSize: 28.0))
                      ],
                    ),
                  )
    );
  }
}