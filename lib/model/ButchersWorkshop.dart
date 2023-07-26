import 'dart:convert';

import 'package:rikarne2/model/Animal.dart';

class ButchersWorkshop{
  String? id;
  DateTime createdDate;
  List<Animal> animals; 

  ButchersWorkshop({
    this.id,
    required this.createdDate,
    required this.animals
  });  

  factory ButchersWorkshop.fromJson(String str) => ButchersWorkshop.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_date': createdDate.toIso8601String(),
      'animals': animals.map((animal) => animal.toMap()).toList()
    };
  }

  static ButchersWorkshop fromMap(Map<String, dynamic> map) {
    return ButchersWorkshop(
      id: map['id'],
      createdDate: map['created_date'],
      animals : List<Animal>.from(map['animals'].map((animalMap) => Animal.fromMap(animalMap))),
    );
  }  
}