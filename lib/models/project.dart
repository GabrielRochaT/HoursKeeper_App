
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
   String id;
   String title;
   String description;
   DateTime startDate;
   DateTime endDate;
   String status;
   String? priority;
   int consumedHours;
   String? participant;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.priority,
    required this.consumedHours,
    required this.participant,
  });

  ProjectModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        description = map["description"],
        startDate = (map["startDate"] as Timestamp).toDate(),
        endDate = (map["endDate"] as Timestamp).toDate(),
        status = map["status"],
        priority = map["priority"],
        consumedHours = map["consumedHours"],
        participant = map["participant"];

        Map<String, dynamic> toMap(){
          return {
            "id": id,
            "title": title,
            "description": description,
            "startDate": Timestamp.fromDate(startDate),
            "endDate": Timestamp.fromDate(endDate),
            "status": status,
            "priority": priority,
            "consumedHours": consumedHours,
            "participant": participant,
          };
        }

}
