import 'dart:convert';

import 'package:rikarne2/model/Cut.dart';

class Animal{
  String? id;
  double weight;
  double buyPrice;
  double sellPrice;
  double rentability;
  List<Cut> cuts;

  Animal({
    required this.id,
    required this.weight,
    required this.buyPrice,
    required this.sellPrice,
    required this.rentability,
    required this.cuts
  });

  factory Animal.fromJson(String str) => Animal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': id,
      'weight': weight,
      'buy_price': buyPrice,
      'sell_price': sellPrice,
      'rentability': rentability,
      'cuts': cuts.map((cut) => cut.toMap()).toList()
    };
  }

  static Animal fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['name'],
      weight: map['weight'],
      buyPrice: map['buy_price'],
      sellPrice: map['sell_price'],
      rentability: map['rentability'],
      cuts: List<Cut>.from(map['cuts'].map((cutMap) => Cut.fromMap(cutMap))),
    );
  }

  Animal copy() => Animal(
    id: id,
    weight: weight,
    buyPrice: buyPrice,
    sellPrice: sellPrice,
    rentability: rentability,
    cuts: cuts
  ); 
}