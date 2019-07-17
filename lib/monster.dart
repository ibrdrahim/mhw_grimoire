// To parse this JSON data, do
//
//     final monster = monsterFromJson(jsonString);

import 'dart:convert';

List<Monster> monsterFromJson(String str) => new List<Monster>.from(json.decode(str).map((x) => Monster.fromJson(x)));

String monsterToJson(List<Monster> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Monster {
    int id;
    String name;
    Type type;
    String species;
    String description;
    List<dynamic> elements;
    List<Ailment> ailments;
    List<Location> locations;
    List<Resistance> resistances;
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
        type: typeValues.map[json["type"]],
        species: json["species"],
        description: json["description"],
        elements: new List<dynamic>.from(json["elements"].map((x) => x)),
        ailments: new List<Ailment>.from(json["ailments"].map((x) => Ailment.fromJson(x))),
        locations: new List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
        resistances: new List<Resistance>.from(json["resistances"].map((x) => Resistance.fromJson(x))),
        weaknesses: new List<Weakness>.from(json["weaknesses"].map((x) => Weakness.fromJson(x))),
        rewards: new List<Reward>.from(json["rewards"].map((x) => Reward.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "species": species,
        "description": description,
        "elements": new List<dynamic>.from(elements.map((x) => elementValues.reverse[x])),
        "ailments": new List<dynamic>.from(ailments.map((x) => x.toJson())),
        "locations": new List<dynamic>.from(locations.map((x) => x.toJson())),
        "resistances": new List<dynamic>.from(resistances.map((x) => x.toJson())),
        "weaknesses": new List<dynamic>.from(weaknesses.map((x) => x.toJson())),
        "rewards": new List<dynamic>.from(rewards.map((x) => x.toJson())),
    };
}

class Ailment {
    int id;
    String name;
    String description;
    Recovery recovery;
    Protection protection;

    Ailment({
        this.id,
        this.name,
        this.description,
        this.recovery,
        this.protection,
    });

    factory Ailment.fromJson(Map<String, dynamic> json) => new Ailment(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        recovery: Recovery.fromJson(json["recovery"]),
        protection: Protection.fromJson(json["protection"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "recovery": recovery.toJson(),
        "protection": protection.toJson(),
    };
}

class Protection {
    List<Skill> skills;
    List<Item> items;

    Protection({
        this.skills,
        this.items,
    });

    factory Protection.fromJson(Map<String, dynamic> json) => new Protection(
        skills: new List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        items: new List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "skills": new List<dynamic>.from(skills.map((x) => x.toJson())),
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    int id;
    String name;
    String description;
    int rarity;
    int value;
    int carryLimit;

    Item({
        this.id,
        this.name,
        this.description,
        this.rarity,
        this.value,
        this.carryLimit,
    });

    factory Item.fromJson(Map<String, dynamic> json) => new Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        rarity: json["rarity"],
        value: json["value"],
        carryLimit: json["carryLimit"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "rarity": rarity,
        "value": value,
        "carryLimit": carryLimit,
    };
}

class Skill {
    int id;
    String name;
    String description;

    Skill({
        this.id,
        this.name,
        this.description,
    });

    factory Skill.fromJson(Map<String, dynamic> json) => new Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}

class Recovery {
    List<Action> actions;
    List<Item> items;

    Recovery({
        this.actions,
        this.items,
    });

    factory Recovery.fromJson(Map<String, dynamic> json) => new Recovery(
        actions: new List<Action>.from(json["actions"].map((x) => actionValues.map[x])),
        items: new List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "actions": new List<dynamic>.from(actions.map((x) => actionValues.reverse[x])),
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

enum Action { DODGE }

final actionValues = new EnumValues({
    "dodge": Action.DODGE
});

enum Element { FIRE, THUNDER, ICE, DRAGON, POISON, SLEEP, BLAST, PARALYSIS, WATER, STUN }

final elementValues = new EnumValues({
    "blast": Element.BLAST,
    "dragon": Element.DRAGON,
    "fire": Element.FIRE,
    "ice": Element.ICE,
    "paralysis": Element.PARALYSIS,
    "poison": Element.POISON,
    "sleep": Element.SLEEP,
    "stun": Element.STUN,
    "thunder": Element.THUNDER,
    "water": Element.WATER
});

class Location {
    int id;
    String name;
    int zoneCount;

    Location({
        this.id,
        this.name,
        this.zoneCount,
    });

    factory Location.fromJson(Map<String, dynamic> json) => new Location(
        id: json["id"],
        name: json["name"],
        zoneCount: json["zoneCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "zoneCount": zoneCount,
    };
}

class Resistance {
    String element;
    String condition;

    Resistance({
        this.element,
        this.condition,
    });

    factory Resistance.fromJson(Map<String, dynamic> json) => new Resistance(
        element: json["element"],
        condition: json["condition"] == null ? null : json["condition"],
    );

    Map<String, dynamic> toJson() => {
        "element": elementValues.reverse[element],
        "condition": condition == null ? null : condition,
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
    String subtype;
    Rank rank;
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
        subtype: json["subtype"] == null ? null : json["subtype"],
        rank: rankValues.map[json["rank"]],
        quantity: json["quantity"],
        chance: json["chance"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype == null ? null : subtype,
        "rank": rankValues.reverse[rank],
        "quantity": quantity,
        "chance": chance,
    };
}

enum Rank { LOW, HIGH }

final rankValues = new EnumValues({
    "high": Rank.HIGH,
    "low": Rank.LOW
});

enum Type { LARGE }

final typeValues = new EnumValues({
    "large": Type.LARGE
});

class Weakness {
    String element;
    int stars;
    String condition;

    Weakness({
        this.element,
        this.stars,
        this.condition,
    });

    factory Weakness.fromJson(Map<String, dynamic> json) => new Weakness(
        element: json["element"],
        stars: json["stars"],
        condition: json["condition"] == null ? null : json["condition"],
    );

    Map<String, dynamic> toJson() => {
        "element": elementValues.reverse[element],
        "stars": stars,
        "condition": condition == null ? null : condition,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
