import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

enum Movement { stop, left, right, up, down, anticlockwise, clockwise }

class RemoteControlViewModel extends ChangeNotifier {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('movement');
  final DatabaseReference _leftHandReference =
      FirebaseDatabase.instance.reference().child('left_hand');
  final DatabaseReference _rightHandReference =
      FirebaseDatabase.instance.reference().child('right_hand');
      final DatabaseReference _headReference =
      FirebaseDatabase.instance.reference().child('head_movement');
  Movement _currentMovement = Movement.stop;

  Movement get currentMovement => _currentMovement;

  Movement _leftHandMovement = Movement.stop;
  Movement _rightHandMovement = Movement.stop;

  Movement get leftHandMovement => _leftHandMovement;
  Movement get rightHandMovement => _rightHandMovement;
  Movement _headMovement = Movement.stop;
  Movement get headMovement => _headMovement;

//left hand
  void setLeftHandMovement(Movement movement) {
    _leftHandMovement = movement;
    _leftHandReference.set(movement.toString());
    notifyListeners();
  }

//right hand
  void setRightHandMovement(Movement movement) {
    _rightHandMovement = movement;
    _rightHandReference.set(movement.toString());
    notifyListeners();
  }

//movement
  void setMovement(Movement movement) {
    _currentMovement = movement;
    _databaseReference.set(movement.toString());
    notifyListeners();
  }

//head movement
  void setHeadMovement(Movement movement) {
    _headMovement = movement;
    _headReference.set(movement.toString());
    notifyListeners();
  }
}
