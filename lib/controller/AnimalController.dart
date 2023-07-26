
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:rikarne2/controller/CutController.dart';

import 'package:rikarne2/model/Animal.dart';

class AnimalsController{
  final String _baseUrl = 'flutter-varios-c603c-default-rtdb.firebaseio.com';
  static List<Animal> animals = [];
  late Animal selectedAnimal;
  final CutController cutController = CutController();

  Future getAnimals() async{
    //final url = Uri.https(_baseUrl,'/rikarne/animals.json');
    //final resp = await http.get(url);

    final jsonString = await rootBundle.loadString('assets/animals.json');
    final data = await json.decode(jsonString);
    
    animals = data.map((value) => Animal.fromMap(value)).toList();

    return animals;
  }

  Future saveCreateWorkshop(Animal workshop) async{
    if(workshop.id == null){
      await createWorkshop(workshop);
    }else{
      await updateWorkshop(workshop);
    }
  }

  Future createWorkshop(Animal animal) async{
    final url = Uri.https(_baseUrl,'animals.json');
    final resp = await http.post( url , body: animal.toJson() );
    final decodedData = json.decode(resp.body);
    
    animal.id = decodedData['name'];
    animals.add(animal);
  }

  Future<String> updateWorkshop(Animal animal) async{
    final url = Uri.https( _baseUrl, 'animals/${ animal.id }.json');
    final resp = await http.put( url , body: animal.toJson() );
    final decodedData = resp.body;

    final index = animals.indexWhere((element) => element.id == animal.id);
    animals[index] = animal;

    return animal.id!;
  }
}