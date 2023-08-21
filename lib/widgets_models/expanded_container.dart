// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_logic_in_create_state, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rikarne2/db_provider/db_provider.dart';
import 'package:rikarne2/model/CutType.dart';
import 'package:rikarne2/widgets_models/input_field.dart';

class ExpansiveContainer extends StatefulWidget {
  ExpansiveContainer({super.key,required this.title, required this.animalTypeId});
  final String title;
  final int animalTypeId;
  @override
  State<ExpansiveContainer> createState() => _ExpansiveContainerState(title: title, animalTypeId: animalTypeId);
}

class _ExpansiveContainerState extends State<ExpansiveContainer> {
  _ExpansiveContainerState({required this.title, required this.animalTypeId});

  final String title;
  final int animalTypeId;
  List<CutType> cutTypes = [];
  bool _expanded = false;

  void _toggleExpand(){
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async{
    List<CutType> cTypes = DBProvider.db.getCutTypesByAnimalType(animalTypeId);
    setState((){
      cutTypes = cTypes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpand,
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: double.infinity,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  Icon(
                    _expanded
                    ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down
                  )
                ],
              ),
              if (_expanded) SizedBox(height: 10),
              if (_expanded) Divider(height: 1, color: Colors.grey),
              if (_expanded) SizedBox(height: 10),
              if (_expanded) Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Precio de compra: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        AppTextField(width: 80, sideText: 'COP')
                      ],
                    ),
                    SizedBox(height: 5),
                    ...cutTypes.map((cutType) => Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cutType.name),
                          AppTextField(width: 50, sideText: 'Kg'),
                        ],
                      ),
                    )).toList(),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}