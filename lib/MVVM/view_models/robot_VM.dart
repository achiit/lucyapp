// viewmodels/robot_view_model.dart
import 'package:flutter/material.dart';
import 'package:lucyapp/MVVM/models/robot_model.dart';
import 'package:provider/provider.dart';

class RobotViewModel extends ChangeNotifier {
  List<Robot> _robots = [
    Robot(name: 'Teaching Mode', mode: 'Learning Mode'),
    Robot(
        name: 'Discipline Coordination Mode',
        mode: 'Maintaining the Discipline Mode'),
    Robot(name: 'Interaction Mode', mode: 'Interacting with Lucy'),
    Robot(name: 'Voice Command Mode', mode: 'Listening to Commands'),
  ];

  List<Robot> get robots => _robots;

  void changeMode(int index, String newMode) {
    _robots[index] = _robots[index].copyWith(mode: newMode);
    notifyListeners();
  }
}
