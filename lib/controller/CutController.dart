import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rikarne2/model/Cut.dart';

class CutController{
  static List<Cut> cuts = [];
  late Cut selectedCut;

  Future getCutsByAnimal(String id) async{
    final jsonString = await rootBundle.loadString('assets/cuts.json');
    final List<dynamic> data = await json.decode(jsonString);
  
    List<Cut> cuts = data.map((value) => Cut.fromMap(value)).toList();
    List<Cut> cutsByAnimal = cuts.where((cut) => cut.animalId == id).toList();
  
    return cutsByAnimal;
  }
}