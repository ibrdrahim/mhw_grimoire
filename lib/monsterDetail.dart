import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mhw_grimoire/API.dart';
import 'package:mhw_grimoire/monster.dart';

void main() => runApp(MonsterDetail());

class MonsterDetail extends StatelessWidget {
  MonsterDetail({this.monster});
  final Monster monster;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(monster.name)),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Image.asset(
                  "assets/images/monsters/${monster.name.replaceAll(" ", "-").toLowerCase()}.jpg"),
              SizedBox(height: 20),
              Text(monster.description, style: TextStyle(color: Colors.indigo)),
              SizedBox(height: 20),
              Text("Element",
                  style: TextStyle(color: Colors.indigo, fontSize: 20)),
              if (monster.elements.length > 0)
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monster.elements.length,
                    itemBuilder: (context, index) {
                      print(monster.elements[index]);
                      return Row(
                        children: <Widget>[
                          Image.asset(
                              "assets/images/status/${monster.elements[index]}.png",
                              width: 30,
                              height: 30),
                        ],
                      );
                    })
              else
                Text("None",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              SizedBox(height: 20),
              Text("Resistances",
                  style: TextStyle(color: Colors.indigo, fontSize: 20)),
              if (monster.resistances.length > 0)
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monster.resistances.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Image.asset(
                              "assets/images/status/${monster.weaknesses[index].element}.png",
                              width: 30,
                              height: 30),
                          for (var i = 0;
                              i < monster.weaknesses[index].stars;
                              i++)
                            Icon(Icons.star, size: 30, color: Colors.yellow),
                          //Text(monster.weaknesses[index].condition)
                        ],
                      );
                    })
              else
                Text("None",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              SizedBox(height: 20),
              Text("Weakness",
                  style: TextStyle(color: Colors.indigo, fontSize: 20)),
              if (monster.weaknesses.length > 0)
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monster.weaknesses.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Image.asset(
                              "assets/images/status/${monster.weaknesses[index].element}.png",
                              width: 30,
                              height: 30),
                          for (var i = 0;
                              i < monster.weaknesses[index].stars;
                              i++)
                            Icon(Icons.star, size: 30, color: Colors.yellow),
                          //Text(monster.weaknesses[index].condition)
                        ],
                      );
                    })
              else
                Text("None",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              SizedBox(height: 20),
              Text("Locations",
                  style: TextStyle(color: Colors.indigo, fontSize: 20)),
              if (monster.locations.length > 0)
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monster.locations.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Text(monster.locations[index].name),
                          Text(
                              " ${monster.locations[index].zoneCount.toString()}%"),
                        ],
                      );
                    })
              else
                Text("Not Available",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
              SizedBox(height: 20),
              Text("Rewards",
                  style: TextStyle(color: Colors.indigo, fontSize: 20)),
              if (monster.rewards.length > 0)
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: monster.rewards.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Text(monster.rewards[index].item.name),
                          Text(
                              " ${monster.rewards[index].item.rarity.toString()}%"),
                        ],
                      );
                    })
              else
                Text("Not Available",
                    style: TextStyle(color: Colors.grey, fontSize: 18)),
            ],
          )),
    );
  }
}
