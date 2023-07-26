//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//import 'package:rikarne2/model/Cut.dart';
//
//class CutController{
//  final String _baseUrl = 'flutter-varios-c603c-default-rtdb.firebaseio.com';
//  static List<Cut> cuts = [];
//  late Cut selectedCut;
//
//  Future getCuts() async{
//    final url = Uri.https(_baseUrl,'/rikarne/animals.json');
//    final resp = await http.get(url);
//
//    final Map<String,dynamic> animalMap = json.decode(resp.body);
//
//    animalMap.forEach((key, value) {
//      final tempAnimal = Animal.fromMap(value);
//      tempAnimal.id = key;
//      animals.add(tempAnimal);
//    });
//    print(animals);
//    return animals;
//  }
//}