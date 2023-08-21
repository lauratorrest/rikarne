// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rikarne2/db_provider/db_provider.dart';
import 'package:rikarne2/model/AnimalType.dart';
import 'package:rikarne2/widgets_models/expanded_container.dart';

class NewWorkshopScreen extends StatefulWidget {
  const NewWorkshopScreen({super.key});

  @override
  State<NewWorkshopScreen> createState() => _NewWorkshopScreenState();
}

class _NewWorkshopScreenState extends State<NewWorkshopScreen> {
  List<AnimalType> animalTypes = [];

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async{
    List<AnimalType> aTypes = await DBProvider.db.getAnimalTypes();
    setState(() {
      animalTypes = aTypes;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Nuevo taller'),
        centerTitle: true,
        elevation: 0
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: animalTypes.length,
          itemBuilder: ( _ , index){
            return ExpansiveContainer(
              title: animalTypes[index].name,
              animalTypeId: animalTypes[index].id
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (){

        },
      )
    );
  }
}