import 'dart:convert';

class Animal{
  int id;
  String name;
  double weight;
  double buyPrice;
  double sellPrice;
  double rentability;
  int workshopId;

  Animal({
    required this.id,
    required this.name,
    required this.weight,
    required this.buyPrice,
    required this.sellPrice,
    required this.rentability,
    required this.workshopId
  });

  factory Animal.fromJson(String str) => Animal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'weight': weight,
      'buy_price': buyPrice,
      'sell_price': sellPrice,
      'rentability': rentability,
      'workshop_id': workshopId
    };
  }

  static Animal fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'],
      name: map['name'],
      weight: map['weight'],
      buyPrice: map['buy_price'],
      sellPrice: map['sell_price'],
      rentability: map['rentability'],
      workshopId: map['workshop_id']
    );
  }

  Animal copy() => Animal(
    id: id,
    name: name,
    weight: weight,
    buyPrice: buyPrice,
    sellPrice: sellPrice,
    rentability: rentability,
    workshopId: workshopId
  ); 
}