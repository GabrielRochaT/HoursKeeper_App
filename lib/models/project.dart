class Project {
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String status;
  final String priority;
  final String consumedHours;
  final List<String> participants;

  Project({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.priority,
    required this.consumedHours,
    required this.participants,
  });
}