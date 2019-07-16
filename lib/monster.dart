// To parse this JSON data, do
//
//     final monster = monsterFromJson(jsonString);

import 'dart:convert';

List<Monster> monsterFromJson(String str) => new List<Monster>.from(json.decode(str).map((x) => Monster.fromJson(x)));

String monsterToJson(List<Monster> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Monster {
    int id;
    String name;
    String type;
    String species;
    String description;
    List<dynamic> elements;
    List<dynamic> ailments;
    List<dynamic> locations;
    List<dynamic> resistances;
    List<Weakness> weaknesses;
    List<Reward> rewards;

    Monster({
        this.id,
        this.name,
        this.type,
        this.species,
        this.description,
        this.elements,
        this.ailments,
        this.locations,
        this.resistances,
        this.weaknesses,
        this.rewards,
    });

    factory Monster.fromJson(Map<String, dynamic> json) => new Monster(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        species: json["species"],
        description: json["description"],
        elements: new List<dynamic>.from(json["elements"].map((x) => x)),
        ailments: new List<dynamic>.from(json["ailments"].map((x) => x)),
        locations: new List<dynamic>.from(json["locations"].map((x) => x)),
        resistances: new List<dynamic>.from(json["resistances"].map((x) => x)),
        weaknesses: new List<Weakness>.from(json["weaknesses"].map((x) => Weakness.fromJson(x))),
        rewards: new List<Reward>.from(json["rewards"].map((x) => Reward.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "species": species,
        "description": description,
        "elements": new List<dynamic>.from(elements.map((x) => x)),
        "ailments": new List<dynamic>.from(ailments.map((x) => x)),
        "locations": new List<dynamic>.from(locations.map((x) => x)),
        "resistances": new List<dynamic>.from(resistances.map((x) => x)),
        "weaknesses": new List<dynamic>.from(weaknesses.map((x) => x.toJson())),
        "rewards": new List<dynamic>.from(rewards.map((x) => x.toJson())),
    };
}

class Reward {
    int id;
    Item item;
    List<Condition> conditions;

    Reward({
        this.id,
        this.item,
        this.conditions,
    });

    factory Reward.fromJson(Map<String, dynamic> json) => new Reward(
        id: json["id"],
        item: Item.fromJson(json["item"]),
        conditions: new List<Condition>.from(json["conditions"].map((x) => Condition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item": item.toJson(),
        "conditions": new List<dynamic>.from(conditions.map((x) => x.toJson())),
    };
}

class Condition {
    String type;
    dynamic subtype;
    String rank;
    int quantity;
    int chance;

    Condition({
        this.type,
        this.subtype,
        this.rank,
        this.quantity,
        this.chance,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => new Condition(
        type: json["type"],
        subtype: json["subtype"],
        rank: json["rank"],
        quantity: json["quantity"],
        chance: json["chance"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype,
        "rank": rank,
        "quantity": quantity,
        "chance": chance,
    };
}

class Item {
    int id;
    String name;
    String description;
    int rarity;
    int carryLimit;
    int value;

    Item({
        this.id,
        this.name,
        this.description,
        this.rarity,
        this.carryLimit,
        this.value,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rarity: json["rarity"],
        carryLimit: json["carryLimit"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rarity": rarity,
        "carryLimit": carryLimit,
        "value": value,
    };
}

class Weakness {
    String element;
    int stars;
    dynamic condition;

    Weakness({
        this.element,
        this.stars,
        this.condition,
    });

    factory Weakness.fromJson(Map<String, dynamic> json) => new Weakness(
        element: json["element"],
        stars: json["stars"],
        condition: json["condition"],
    );

    Map<String, dynamic> toJson() => {
        "element": element,
        "stars": stars,
        "condition": condition,
    };
}
