import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rikarne2/controller/AnimalsController.dart';
import 'package:rikarne2/model/Animal.dart';
import 'package:rikarne2/model/ButchersWorkshop.dart';

class ButchersWorkshopController{

  final AnimalsController animalsController = AnimalsController();
  
  final String _baseUrl = 'flutter-varios-c603c-default-rtdb.firebaseio.com';
  static List<ButchersWorkshop> workshops = [];
  late ButchersWorkshop selectedWorkshop;

  Future getWorkshops() async{
    final url = Uri.https(_baseUrl,'workshops.json');
    final resp = await http.get(url);

    final Map<String,dynamic> workshopMap = json.decode(resp.body);

    workshopMap.forEach((key, value) {
      final tempWorkshop = ButchersWorkshop.fromMap(value);
      tempWorkshop.id = key;
      workshops.add(tempWorkshop);
    });
    
    return workshops;
  }

  Future saveCreateWorkshop(ButchersWorkshop workshop) async{
    if(workshop.id == null){
      await createWorkshop(workshop);
    }else{
      await updateWorkshop(workshop);
    }
  }

  Future createWorkshop(ButchersWorkshop workshop) async{
    final url = Uri.https(_baseUrl,'/rikarne/workshops.json');
    final resp = await http.post( url , body: workshop.toJson() );
    final decodedData = json.decode(resp.body);

    workshop.animals
      .forEach((a) => a.sellPrice = a.cuts.fold(0, (previousValue, e) => previousValue + e.sellPrice));
    workshop.animals.forEach((a) => a.rentability = a.buyPrice / a.sellPrice * 100);
    
    workshop.id = decodedData['id'];
    workshops.add(workshop);
  }

  Future<String> updateWorkshop(ButchersWorkshop workshop) async{
    final url = Uri.https( _baseUrl, 'workshops/${ workshop.id }.json');
    final resp = await http.put( url , body: workshop.toJson() );
    final decodedData = resp.body;

    final index = workshops.indexWhere((element) => element.id == workshop.id);
    workshops[index] = workshop;

    return workshop.id!;
  }

}