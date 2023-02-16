import 'dart:convert';

Tabitem tabitemFromJson(String str) => Tabitem.fromJson(json.decode(str));

String tabitemToJson(Tabitem data) => json.encode(data.toJson());

class Tabitem {
  Tabitem({
    required this.id,
    required this.name,
    required this.cost,
    this.cart,
  });

  String id;
  String name;
  String cost;
  String? cart;

  factory Tabitem.fromJson(Map<String, dynamic> json) => Tabitem(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        cart: json["cart"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "cart": cart,
      };
}
