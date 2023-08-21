// ignore_for_file: file_names

class Cut{
  int id;
  String name;
  double weight;
  double sellPrice;
  int animalId;

  Cut({
    required this.id,
    required this.name,
    required this.weight,
    required this.sellPrice,
    required this.animalId
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'weight': weight,
      'sell_price': sellPrice,
      'animal_id': animalId
    };
  }

  static Cut fromMap(Map<String, dynamic> map) {
    return Cut(
      id: map['id'],
      name: map['name'],
      weight: map['weight'],
      sellPrice: map['sell_price'],
      animalId: map['animal_id']
    );
  }  
}