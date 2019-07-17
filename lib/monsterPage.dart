import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mhw_grimoire/monster.dart';
import 'package:mhw_grimoire/API.dart';
import 'package:mhw_grimoire/monsterDetail.dart';

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
            return 
              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => MonsterDetail(monster: monsters[index],)),
                  );
                },
                child: 
                  Card( 
                  child: ListTile(
                    leading: Image.asset("assets/images/monsters/${monsters[index].name.replaceAll(" ", "-").toLowerCase()}.jpg"),
                    title: Text(monsters[index].name),
                    subtitle: Text(
                      monsters[index].description
                    ),
                  ),
                )
              );
          },
        ));
  }
}