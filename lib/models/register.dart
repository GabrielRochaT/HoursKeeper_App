class RegisterModel{
  final String id;
  final String project;
  final String user;
  final String initialHour;
  final String finalHour;
  final String hours;
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
        initialHour = map["initialHour"],
        finalHour = map["finalHour"],
        details = map["details"],
        hours = map["hours"];

        Map<String, dynamic> toMap(){
          return {
            "id": id,
            "project": project,
            "user": user,
            "initialHour": initialHour,
            "finalHour;": finalHour,
            "details": details,
            "hours": hours,
          };
        }
}