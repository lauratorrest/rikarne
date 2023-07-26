import 'dart:convert';

class Cut{
  String name;
  double weight;
  double sellPrice;
  String animalId;

  Cut({
    required this.name,
    required this.weight,
    required this.sellPrice,
    required this.animalId
  });

  factory Cut.fromJson(String str) => Cut.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'weight': weight,
      'sell_price': sellPrice,
      'animal_id': animalId
    };
  }

  static Cut fromMap(Map<String, dynamic> map) {
    return Cut(
      name: map['name'],
      weight: map['weight'],
      sellPrice: map['sell_price'],
      animalId: map['animal_id']
    );
  }  

  Cut copy() => Cut(
    name: name,
    weight: weight,
    sellPrice: sellPrice,
    animalId: animalId
  ); 
}