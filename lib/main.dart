// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rikarne2/controller/AnimalsController.dart';

import 'package:rikarne2/controller/ButchersWorkshopController.dart';
import 'package:rikarne2/model/Animal.dart';
import 'package:rikarne2/model/ButchersWorkshop.dart';
import 'package:rikarne2/model/Cut.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ButchersWorkshopController workshopController = ButchersWorkshopController();
  AnimalsController animalsController = AnimalsController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Center(child: Text('Prueba'))
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async => workshopController.saveCreateWorkshop(
            ButchersWorkshop(id: null, createdDate: DateTime.now(), animals: await animalsController.getAnimals())
          )
        ),
      )
    );
  }
}