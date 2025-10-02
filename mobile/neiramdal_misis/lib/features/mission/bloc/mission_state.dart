import 'package:neiramdal_misis/features/mission/models/mission.dart';

abstract class MissionState {}

class MissionLoading extends MissionState {}

class MissionSuccess extends MissionState {
  final MissionModel mission;

  MissionSuccess(this.mission);
}

class MissionFailure extends MissionState {
  final String message;

  MissionFailure(this.message);
}
