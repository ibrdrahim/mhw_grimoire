import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhw_grimoire/monster.dart';
import 'package:mhw_grimoire/API.dart';

void main() => runApp(MonsterPage());

class MonsterPage extends StatelessWidget {

  MonsterPage({this.title,this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MonsterList();
  }
}

class MonsterList extends StatefulWidget {
  @override
  createState() => _MonsterListState();
}

class _MonsterListState extends State {
  var monsters = new List<Monster>();

  _getMonsters() {
    API.getMonsters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        monsters = list.map((model) => Monster.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getMonsters();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Monster List"),
        ),
        body: ListView.builder(
          itemCount: monsters.length,
          itemBuilder: (context, index) {
            print(monsters[index].name);
            return 
              Card( 
                  child: Column(
                    children: <Widget>[
                      Image.asset("assets/images/monsters/${monsters[index].name.replaceAll(" ", "-").toLowerCase()}.jpg"),
                      Text(monsters[index].name,
                      style: new TextStyle(color: Colors.blue, fontSize: 28.0)),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      )
                    ],
                  ),
                );
          },
        ));
  }
}