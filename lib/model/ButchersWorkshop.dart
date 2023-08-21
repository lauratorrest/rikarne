// ignore_for_file: file_names

class ButchersWorkshop{
  int? id;
  DateTime createdDate;
  DateTime? updatedDate;

  ButchersWorkshop({
    this.id,
    required this.createdDate,
    this.updatedDate
  });  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_date': createdDate.toIso8601String(),
      'updated_date': createdDate.toIso8601String(),
    };
  }

  static ButchersWorkshop fromMap(Map<String, dynamic> map) {
    return ButchersWorkshop(
      id: map['id'],
      createdDate: DateTime.parse(map['created_date']),
      updatedDate: DateTime.parse(map['updated_date']),
    );
  }  
}