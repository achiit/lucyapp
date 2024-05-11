// views/robot_grid.dart
import 'package:flutter/material.dart';
import 'package:lucyapp/MVVM/view_models/robot_VM.dart';
import 'package:provider/provider.dart';
import 'robot_card.dart';

class RobotGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final robotViewModel = Provider.of<RobotViewModel>(context);

    return GridView.builder(
      itemCount: robotViewModel.robots.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return RobotCard(robot: robotViewModel.robots[index], index: index);
      },
    );
  }
}
