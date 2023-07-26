// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rikarne2/controller/AnimalController.dart';

import 'package:rikarne2/controller/ButchersWorkshopController.dart';
import 'package:rikarne2/controller/CutController.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ButchersWorkshopController workshopController = ButchersWorkshopController();
  AnimalsController animalsController = AnimalsController();
  CutController cutController = CutController();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Center(child: Text('Prueba'))
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            
            cutController.getCutsByAnimal("0");
            
          }
        ),
      )
    );
  }
}