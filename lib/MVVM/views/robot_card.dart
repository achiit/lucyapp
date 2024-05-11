// views/robot_card.dart
import 'package:flutter/material.dart';
import 'package:lucyapp/MVVM/models/robot_model.dart';
import 'package:lucyapp/MVVM/view_models/robot_VM.dart';
import 'package:provider/provider.dart';

class RobotCard extends StatelessWidget {
  final Robot robot;
  final int index;

  RobotCard({required this.robot, required this.index});

  @override
  Widget build(BuildContext context) {
    final robotViewModel = Provider.of<RobotViewModel>(context);

    return Card(
      child: ListTile(
        tileColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          robot.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          robot.mode,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          _showModeDialog(context, robotViewModel);
        },
      ),
    );
  }

  void _showModeDialog(BuildContext context, RobotViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Mode'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  viewModel.changeMode(index, 'Mode 1');
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text('Mode 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.changeMode(index, 'Mode 2');
                  Navigator.of(context).pop();
                },
                child: Text('Mode 2'),
              ),
              // Add more mode options here
            ],
          ),
        );
      },
    );
  }
}
