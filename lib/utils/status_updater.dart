import 'dart:async';

import 'package:hours_keeper/utils/projects_service.dart';

class StatusUpdater {
  final ProjectService projectService;
  late Timer _timer;

  StatusUpdater(this.projectService);

  void startStatusUpdater(){
    print("STARTING TIMER");
    _timer = Timer.periodic(Duration(minutes: 1), (timer) async {
      await projectService.checkAndUpdateStatus();
    });
  }

  void stopTimer(){
    _timer.cancel();
  }
}