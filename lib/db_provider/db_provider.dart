import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:rikarne2/model/Animal.dart';
import 'package:rikarne2/model/AnimalType.dart';
import 'package:rikarne2/model/ButchersWorkshop.dart';
import 'package:rikarne2/model/CutType.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async{
    return _database != null
          ? _database!
          : await initDB();
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path,'rikarne.db');

    return await openDatabase(
      path,
      version: 4,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await db.execute('''
          CREATE TABLE workshops(
            id INTEGER PRIMARY KEY,
            created_date TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE animals(
            id INTEGER PRIMARY KEY,
            name TEXT,
            weight REAL,
            buy_price REAL,
            sell_price REAL,
            rentability REAL,
            workshop_id INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE animal_type(
            id INTEGER PRIMARY KEY,
            name TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE cuts(
            id INTEGER PRIMARY KEY,
            name TEXT,
            weight REAL,
            sell_price REAL,
            animal_id INTEGER
          )
        ''');
      }
    );
  }

  List<AnimalType> getAnimalTypes(){
    return animalTypes;
  }

  List<CutType> getCutTypesByAnimalType(int id){
    return cutTypes.where((ct) => ct.animalTypeId == id).toList();
  }

  void saveWorkshop(
      ButchersWorkshop workshop,
      Animal animal,
      AnimalType animalType,
      CutType cutType
    ){
    cutTypes.add(cutType);
    animalTypes.add(animalType);
    animals.add(animal);
    workshops.add(workshop);
    print(workshops);
    print(animals);
    print(animalTypes);
    print(cutTypes);
  }

  List<ButchersWorkshop> workshops = [];
  List<Animal> animals = [];

  List<AnimalType> animalTypes = [
    AnimalType(id: 1, name: "Res"),
    AnimalType(id: 2, name: "Cerdo"),
    AnimalType(id: 3, name: "Pollo"),
  ];

  List<CutType> cutTypes = [
    CutType(id: 1, name: 'LOMO FINO', animalTypeId: 1),
    CutType(id: 2, name: 'PUNTA GORDA', animalTypeId: 1),
    CutType(id: 3, name: 'CHULETA', animalTypeId: 2),
    CutType(id: 4, name: 'PATA DE CERDO', animalTypeId: 2),
    CutType(id: 5, name: 'ALA', animalTypeId: 3),
    CutType(id: 6, name: 'MUSLO DE POLLO', animalTypeId: 3)
  ];

}