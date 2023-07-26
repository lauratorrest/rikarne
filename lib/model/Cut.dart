import 'dart:convert';

class Cut{
  String name;
  double weight;
  double sellPrice;

  Cut({
    required this.name,
    required this.weight,
    required this.sellPrice
  });

  factory Cut.fromJson(String str) => Cut.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'weight': weight,
      'sellPrice': sellPrice
    };
  }

  static Cut fromMap(Map<String, dynamic> map) {
    return Cut(
      name: map['name'],
      weight: map['weight'],
      sellPrice: map['sellPrice'],
    );
  }  

  Cut copy() => Cut(
    name: name,
    weight: weight,
    sellPrice: sellPrice,
  ); 
}