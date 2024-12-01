import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterModel{
  final String? id;
  final String? project;
  final String? user;
  final DateTime initialHour;
  final DateTime finalHour;
  final int? hours;
  final String? details;


  RegisterModel({
    required this.id,
    required this.project,
    required this.user,
    required this.initialHour,
    required this.finalHour,
    required this.hours,
    this.details,
  });

  RegisterModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        project = map["project"],
        user = map["user"],
        initialHour = (map["initialHour"] as Timestamp).toDate(),
        finalHour = (map["finalHour"] as Timestamp).toDate(),
        details = map["details"],
        hours = map["hours"];

        Map<String, dynamic> toMap(){
          return {
            "id": id,
            "project": project,
            "user": user,
            "initialHour": Timestamp.fromDate(initialHour),
            "finalHour": Timestamp.fromDate(finalHour),
            "details": details,
            "hours": hours,
          };
        }
}